import 'package:flutter/material.dart';
import 'package:hong_kong_app/app/pages/auth/register/register_controller.dart';
import 'package:hong_kong_app/app/pages/auth/register/register_page.dart';
import 'package:provider/provider.dart';

class RegisterRoute {
  RegisterRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(create: (context) => RegisterController(context.read()))
        ],
        child: const RegisterPage(),
      );
}
