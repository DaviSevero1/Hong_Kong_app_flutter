import 'package:flutter/material.dart';

class EcommerceAppBar extends AppBar {
  EcommerceAppBar({super.key, double elevation = 1})
      : super(
          elevation: elevation,
          title: Image.asset(
            'assets/images/logo.png',
            width: 80,
          ),
        );
}
