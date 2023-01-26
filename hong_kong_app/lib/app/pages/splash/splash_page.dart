import 'package:flutter/material.dart';
import 'package:hong_kong_app/app/core/ui/styles/app_styles.dart';
import 'package:hong_kong_app/app/core/ui/styles/colors_app.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.colors.primary;

    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black)),
        primaryColor: ColorsApp.instance.primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsApp.instance.primary,
          primary: ColorsApp.instance.primary,
          secondary: ColorsApp.instance.secondary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: AppStyles.instance.primaryButton,
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.black,
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.all(13),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Colors.grey[400]!)
          ),
        ),
      ),
      child: Scaffold(
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
      ),
    );
  }
}
