import 'package:flutter/material.dart';
import 'package:hong_kong_app/app/core/provider/aplication_binding.dart';
import 'package:hong_kong_app/app/core/ui/theme/theme_config.dart';
import 'package:hong_kong_app/app/pages/home/home_router.dart';
import 'package:hong_kong_app/app/pages/splash/splash_page.dart';
import 'package:provider/provider.dart';

class HongKongApp extends StatelessWidget {

  const HongKongApp({ super.key });

   @override
   Widget build(BuildContext context) {
       return AplicationBinding(
         child: MaterialApp(
          title: 'HongKong App',
          theme: ThemeConfig.theme,
          routes: {
            '/':(context) => const SplashPage(),
            '/home':(context) => HomeRouter.page,
          },
         ),
       );
  }
}