import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/widgets/widget.barrel.dart';

import 'package:flutter_production_boilerplate_riverpod/utils/button.dart';

class IconButtonExtended extends StatelessWidget {
  final IconData icon;
  final double? size;
  final bool? disabled;
  final ButtonColor? color;
  final ButtonVariant? variant;
  final bool? loading;
  final bool? fullWidth;
  final VoidCallback? onPressed;

  const IconButtonExtended({
    super.key,
    required this.icon,
    this.size,
    this.disabled,
    this.color,
    this.variant = ButtonVariant.contained,
    this.loading,
    this.fullWidth,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    CircleBorder borderShape = CircleBorder();

    Color bgColor =
        getColor(context: context, color: color, disabled: disabled);

    if (variant == ButtonVariant.transparent) {
      return IconButton.outlined(
        onPressed: () {
          if (disabled == true) return;

          if (onPressed != null) {
            onPressed!();
          }
        },
        iconSize: (size ?? 24) + 4,
        style: IconButton.styleFrom(
          shape: borderShape,
          side: BorderSide(color: Colors.transparent),
        ),
        icon: Icon(icon, color: bgColor),
      );
    } else if (variant == ButtonVariant.outlined) {
      return IconButton.outlined(
        onPressed: () {
          if (disabled == true) return;

          if (onPressed != null) {
            onPressed!();
          }
        },
        iconSize: size ?? 24,
        style: IconButton.styleFrom(
          shape: borderShape,
          side: BorderSide(color: bgColor),
        ),
        icon: Icon(icon, color: bgColor),
      );
    } else {
      return IconButton.filled(
        onPressed: () {
          if (disabled == true) return;

          if (onPressed != null) {
            onPressed!();
          }
        },
        iconSize: size ?? 24,
        style: IconButton.styleFrom(
          shape: borderShape,
          backgroundColor: bgColor,
        ),
        icon: Icon(icon),
      );
    }
  }
}
