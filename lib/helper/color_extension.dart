import 'package:flutter/material.dart';

extension ColorExtension on String {
  toColor() {
    String hexColor = this.replaceAll("Color(", "").replaceAll(")", "");
    return Color(int.parse("$hexColor"));
  }
}
