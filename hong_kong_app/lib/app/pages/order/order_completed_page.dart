import 'package:flutter/material.dart';
import 'package:hong_kong_app/app/core/ui/helpers/size_extensions.dart';
import 'package:hong_kong_app/app/core/ui/styles/text_styles.dart';
import 'package:hong_kong_app/app/core/ui/widgets/ecommerce_button.dart';

class OrderCompletedPage extends StatelessWidget {
  const OrderCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ColoredBox(
      color: Color.fromARGB(255, 29, 29, 29),
      child: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: context.percentHeight(.2),
            ),
            Image.asset(
              'assets/images/logo2.png',
              height: 250,
              width: 400,
            ),
            const SizedBox(
              height: 90,
            ),
            Text(
              'Pedido realizado com sucesso, em breve você receberá a confirmação do seu pedido.',
              textAlign: TextAlign.center,
              style: context.textStyles.textExtraBold.copyWith(
                  fontSize: 18, color: Color.fromARGB(255, 171, 154, 59)),
            ),
            const SizedBox(
              height: 90,
            ),
            EcommerceButton(
              width: context.percentWidth(.9),
              label: ('Fechar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 200,
            ),
          ]),
        ),
      ),
    ));
  }
}
