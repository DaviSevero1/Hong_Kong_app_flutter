import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instace;

  ColorsApp._();

  static ColorsApp get instance {
    _instace ??= ColorsApp._();
    return _instace!;
  }

  Color get primary => const Color(0XFF007D21);
  Color get secondary => const Color(0XFFF88B0C);
}

extension ColorAppExcetions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
