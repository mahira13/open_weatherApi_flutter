import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Padding paddingSymmetricExtension({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this);
  }

  Padding paddingTop(double top) {
    return Padding(padding: EdgeInsets.only(top: top), child: this);
  }

  Padding paddingLeft(double left) {
    return Padding(padding: EdgeInsets.only(left: left), child: this);
  }

  Padding paddingRight(double right) {
    return Padding(padding: EdgeInsets.only(right: right), child: this);
  }

  Padding paddingBottom(double bottom) {
    return Padding(padding: EdgeInsets.only(bottom: bottom), child: this);
  }

  Padding paddingOnlyExtension(
      {double top = 0.0,
      double left = 0.0,
      double bottom = 0.0,
      double right = 0.0}) {
    return Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom), child: this);
  }

  Padding paddingAllExtension(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  Widget onTap(
    void Function()? function,
  ) {
    return InkWell(
      onTap: function,
      child: this,
    );
  }
}
