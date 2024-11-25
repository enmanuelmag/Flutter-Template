import 'package:flutter/material.dart';

import 'package:flutter_production_boilerplate_riverpod/utils/button.dart';

enum ButtonColor {
  red,
  green,
  grey,
  orange,
  violet,
  blue,
  yellow,
  primary,
}

enum ButtonVariant {
  contained,
  outlined,
  text,
}

class ButtonExtended extends StatelessWidget {
  final String text;
  final bool? disabled;
  final ButtonColor? color;
  final ButtonVariant? variant;
  final Widget? leftSection;
  final Widget? rightSection;
  final bool? loading;
  final bool? fullWidth;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  const ButtonExtended({
    super.key,
    required this.text,
    this.disabled,
    this.color,
    this.variant = ButtonVariant.contained,
    this.leftSection,
    this.rightSection,
    this.loading,
    this.fullWidth,
    this.onPressed,
    this.onLongPress,
  });

  Text getText(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: getTextColor(context),
      ),
    );
  }

  Color getTextColor(BuildContext context) {
    Color colorText = Colors.white;

    if (variant == ButtonVariant.text || variant == ButtonVariant.outlined) {
      colorText = getColor(context: context, color: color, disabled: disabled);
    }

    if (disabled == true) {
      colorText = colorText.withOpacity(0.5);
    }

    return colorText;
  }

  @override
  Widget build(BuildContext context) {
    Text text = getText(context);

    Row child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (leftSection != null) leftSection!,
        text,
        if (rightSection != null) rightSection!,
      ],
    );

    RoundedRectangleBorder borderShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    );

    Color bgColor =
        getColor(context: context, color: color, disabled: disabled);

    if (variant == ButtonVariant.text) {
      return TextButton(
        onPressed: () {
          if (disabled == true) return;
          onPressed!();
        },
        onLongPress: onLongPress,
        child: child,
      );
    } else if (variant == ButtonVariant.outlined) {
      return OutlinedButton(
        onPressed: () {
          if (disabled == true) return;
          onPressed!();
        },
        onLongPress: onLongPress,
        style: OutlinedButton.styleFrom(
          shape: borderShape,
          side: BorderSide(color: bgColor),
        ),
        child: child,
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          if (disabled == true) return;
          onPressed!();
        },
        onLongPress: onLongPress,
        style: ElevatedButton.styleFrom(
          shape: borderShape,
          backgroundColor: bgColor,
        ),
        child: child,
      );
    }
  }
}
