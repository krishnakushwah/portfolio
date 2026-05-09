import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdaptiveIcon extends StatelessWidget {
  const AdaptiveIcon(this.icon, {super.key, this.color, this.size});

  final Object icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    if (icon is FaIconData) {
      return FaIcon(icon as FaIconData, color: color, size: size);
    }
    return Icon(icon as IconData, color: color, size: size);
  }
}
