import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double percentHeight (double percent) => height * percent;

  double percentWidth (double percent) => width * percent;

  Size get size => MediaQuery.of(this).size;
}
