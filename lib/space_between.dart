import 'package:flutter/material.dart';

Widget spaceBetween(List<Widget> children) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: children,
  );
}

Widget spaceBetweenPadding({EdgeInsets padding, List<Widget> children}) {
  return Padding(
    padding: padding,
    child: spaceBetween(children),
  );
}
