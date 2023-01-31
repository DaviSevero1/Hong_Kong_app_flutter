import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hong_kong_app/app/core/ui/helpers/loader.dart';
import 'package:hong_kong_app/app/core/ui/helpers/messages.dart';
import 'package:hong_kong_app/app/core/ui/widgets/ecommerce_appbar.dart';
import 'package:hong_kong_app/app/models/product_model.dart';
import 'package:hong_kong_app/app/pages/home/widgets/ecommerce_product_tile.dart';
import 'package:hong_kong_app/app/pages/home/widgets/home_state.dart';
import 'package:provider/provider.dart';

import '../../core/ui/base_state/base_state.dart';
import 'widgets/home_controller.dart';
//import 'package:hong_kong_app/app/pages/home/widgets/home_controller.dart';
//import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  
  @override
  void onReady() {
      controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
              any: () => hideLoader(),
              loading: () => showLoader(),
              error: () {
                hideLoader();
                showError(state.errorMessage ?? 'Erro não informado');
              });
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return EcommerceProductTile(product: product);
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
