import 'package:flutter/material.dart';
import 'package:hong_kong_app/app/core/ui/styles/text_styles.dart';
import 'package:hong_kong_app/app/core/ui/widgets/ecommerce_appbar.dart';
import 'package:hong_kong_app/app/core/ui/widgets/ecommerce_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EcommerceAppBar(),
        body: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              Text(
                'Cadastro',
                style: context.textStyles.textTitle,
              ),
              Text(
                'Preencha os campos abaixo para criar o seu cadastro',
                style: context.textStyles.textMedium.copyWith(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Senha'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Confrime Sua Senha'),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: EcommerceButton(
                  onPressed: () {},
                  label: 'Cadastrar',
                  width: double.infinity,
                ),
              )
            ],
          )),
        ));
  }
}
