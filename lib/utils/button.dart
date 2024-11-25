import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/widgets/widget.barrel.dart';

Color getColor({
  required BuildContext context,
  ButtonColor? color,
  bool? disabled,
}) {
  Color colorBtn = Theme.of(context).colorScheme.primary;

  switch (color) {
    case ButtonColor.red:
      colorBtn = Colors.red;
      break;
    case ButtonColor.green:
      colorBtn = Colors.green;
      break;
    case ButtonColor.grey:
      colorBtn = Colors.grey;
      break;
    case ButtonColor.orange:
      colorBtn = Colors.orange;
      break;
    case ButtonColor.violet:
      colorBtn = Colors.purple;
      break;
    case ButtonColor.blue:
      colorBtn = Colors.blue;
      break;
    case ButtonColor.yellow:
      colorBtn = Colors.yellow;
      break;
    case ButtonColor.primary:
    default:
      colorBtn = Theme.of(context).colorScheme.primary;
      break;
  }

  if (disabled == true) {
    colorBtn = colorBtn.withOpacity(0.5);
  }

  return colorBtn;
}
