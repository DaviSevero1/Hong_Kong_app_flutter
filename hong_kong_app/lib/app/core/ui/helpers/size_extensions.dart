import 'package:flutter/cupertino.dart';

extension SizeExtensions on BuildContext {
  double get screenWidht => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  double percentWidth(double percent) => screenWidht * percent;
  double percentHeight(double percent) => screenHeight * percent;
}
