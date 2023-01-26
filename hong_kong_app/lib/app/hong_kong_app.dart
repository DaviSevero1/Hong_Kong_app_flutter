import 'package:flutter/material.dart';
import 'package:hong_kong_app/app/core/ui/theme/theme_config.dart';
import 'package:hong_kong_app/app/pages/splash/splash_page.dart';

class HongKongApp extends StatelessWidget {

  const HongKongApp({ super.key });

   @override
   Widget build(BuildContext context) {
       return MaterialApp(
        title: 'HongKong App',
        theme: ThemeConfig.theme,
        routes: {
          '/':(context) => const SplashPage()
        },
       );
  }
}