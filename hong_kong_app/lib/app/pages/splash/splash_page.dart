import 'package:flutter/material.dart';
import 'package:hong_kong_app/app/core/ui/styles/app_styles.dart';
import 'package:hong_kong_app/app/core/ui/styles/colors_app.dart';
import 'package:hong_kong_app/app/core/ui/widgets/ecommerce_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.colors.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('splash'),
      ),
      body: Column(
        children: [
          Container(),
          EcommerceButton(
            width: 100,
            height: 100,
            label: 'Teste label',
            onPressed: () {},
          ),
          TextFormField(),
        ],
      ),
    );
  }
}
