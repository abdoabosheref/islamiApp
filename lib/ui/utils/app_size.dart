import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

abstract class AppSize {
  static double width(BuildContext context) => MediaQuery.of(context).size.width;
  static double height(BuildContext context) => MediaQuery.of(context).size.height;
}


