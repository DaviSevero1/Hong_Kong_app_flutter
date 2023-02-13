import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hong_kong_app/app/core/ui/base_state/base_state.dart';
import 'package:hong_kong_app/app/core/ui/styles/text_styles.dart';
import 'package:hong_kong_app/app/core/ui/widgets/ecommerce_appbar.dart';
import 'package:hong_kong_app/app/core/ui/widgets/ecommerce_button.dart';
import 'package:hong_kong_app/app/pages/auth/register/register_controller.dart';
import 'package:hong_kong_app/app/pages/auth/register/register_state.dart';
import 'package:match/match.dart';
import 'package:validatorless/validatorless.dart';

//import '../../../core/ui/base_state/base_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passworEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passworEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader(),
          error: () {
            hideLoader();
            showError('Erro ao registrar com sucesso');
          },
          success: () {
            hideLoader();
            showSucess('Cadastro realizado com sucesso');
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
          appBar: EcommerceAppBar(),
          body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'Cadastro',
                      style: context.textStyles.textTitle,
                    ),
                    Text(
                      'Preencha os campos abaixo para criar o seu cadastro',
                      style: context.textStyles.textMedium.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Nome', fillColor: Colors.black12),
                      controller: _nameEC,
                      validator: Validatorless.required('Nome Obrigatório'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'E-mail', fillColor: Colors.black12),
                      controller: _emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Email obrigatório'),
                        Validatorless.email('Email inválido'),
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Senha', fillColor: Colors.black12),
                        controller: _passworEC,
                        obscureText: true,
                        validator: Validatorless.multiple([
                          Validatorless.required('Senha obrigatória'),
                          Validatorless.min(
                              6, 'Senha deve conter pelo menos 6 caracteres'),
                        ])),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Confirme Sua Senha',
                            fillColor: Colors.black12),
                        obscureText: true,
                        validator: Validatorless.multiple([
                          Validatorless.required('Confirme sua Senha'),
                          Validatorless.compare(
                              _passworEC, 'As senhas estão diferentes')
                        ])),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: EcommerceButton(
                        onPressed: () {
                          final valid =
                              _formKey.currentState?.validate() ?? false;
                          if (valid) {
                            controller.register(
                              _nameEC.text,
                              _emailEC.text,
                              _passworEC.text,
                            );
                          }
                        },
                        label: 'Cadastrar',
                        width: double.infinity,
                      ),
                    )
                  ],
                )),
          )),
    );
  }
}
