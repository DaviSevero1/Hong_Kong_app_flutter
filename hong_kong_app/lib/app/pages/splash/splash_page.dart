import 'package:flutter/material.dart';
import 'package:hong_kong_app/app/core/config/env/env.dart';
import 'package:hong_kong_app/app/core/ui/helpers/size_extensions.dart';
//import 'package:hong_kong_app/app/core/ui/styles/app_styles.dart';
import 'package:hong_kong_app/app/core/ui/styles/colors_app.dart';
import 'package:hong_kong_app/app/core/ui/widgets/ecommerce_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.colors.primary;

    return Scaffold(
      body: ColoredBox(
        color: Color.fromARGB(255, 0, 0, 0),
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeight(.30),
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                  ),
                  const Text(
                    'A casa da Pick-Up',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 211, 80), fontSize: 14),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  EcommerceButton(
                      width: context.percentWidth(.7),
                      height: 50,
                      label: 'Acessar',
                      onPressed: () {
                        Navigator.of(context).popAndPushNamed('/home');
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
