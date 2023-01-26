import 'package:flutter/material.dart';
import 'package:hong_kong_app/app/core/ui/styles/app_styles.dart';
import 'package:hong_kong_app/app/core/ui/styles/colors_app.dart';

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
          ElevatedButton(
            onPressed: () {},
            child: Text('Teste'),
          ),
          TextFormField()
        ],
      ),
    );
  }
}
