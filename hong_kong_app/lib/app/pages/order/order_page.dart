import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hong_kong_app/app/core/ui/styles/text_styles.dart';
import 'package:hong_kong_app/app/core/ui/widgets/ecommerce_appbar.dart';
import 'package:hong_kong_app/app/core/ui/widgets/ecommerce_button.dart';
import 'package:hong_kong_app/app/dto/order_product_dto.dart';
import 'package:hong_kong_app/app/models/payment_type_model.dart';
import 'package:hong_kong_app/app/models/product_model.dart';
import 'package:hong_kong_app/app/pages/order/order_controller.dart';
import 'package:hong_kong_app/app/pages/order/order_state.dart';
import 'package:hong_kong_app/app/pages/order/widgets/order_field.dart';
import 'package:hong_kong_app/app/pages/order/widgets/order_product_tile.dart';
import 'package:hong_kong_app/app/pages/order/widgets/payment_types_field.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/ui/base_state/base_state.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
  @override
  void onReady() {
    final products =
        ModalRoute.of(context)!.settings.arguments as List<OrderProductDto>;
    controller.load(products);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderController, OrderState>(
      listener: (context, state) {
        state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
            error: () {
              hideLoader();
              showError(state.errorMessage ?? 'Erro não informado');
            });
      },
      child: Scaffold(
        appBar: EcommerceAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(children: [
                  Text(
                    'Carrinho',
                    style: context.textStyles.textTitle,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/trashRegular.png'),
                  ),
                ]),
              ),
            ),
            BlocSelector<OrderController, OrderState, List<OrderProductDto>>(
              selector: (state) => state.orderProducts,
              builder: (context, orderProducts) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: orderProducts.length,
                    (context, index) {
                      final orderProduct = orderProducts[index];
                      return Column(
                        children: [
                          OrderProductTile(
                              index: index, orderProduct: orderProduct),
                          Text('Produto $index'),
                          const Divider(
                            color: Colors.grey,
                          )
                        ],
                      );
                    },
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total do pedido',
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 16),
                      ),
                      Text(
                        '100',
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderField(
                  title: 'Endereço de Entrega',
                  controller: TextEditingController(),
                  validator: Validatorless.required('m'),
                  hintText: 'Digite um endereço',
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderField(
                  title: 'CPF',
                  controller: TextEditingController(),
                  validator: Validatorless.required('m'),
                  hintText: 'Digite o CPF',
                ),
                BlocSelector<OrderController, OrderState, List<PaymentTypeModel>>(
                  selector: (state) => state.paymentTypes,
                  builder: (context, paymentTypes) {
                    return PaymentTypesField(paymentTypes: paymentTypes,);
                  },
                ),
              ]),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: EcommerceButton(
                      width: double.infinity,
                      height: 45,
                      label: 'Finalizar',
                      onPressed: () {}),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
