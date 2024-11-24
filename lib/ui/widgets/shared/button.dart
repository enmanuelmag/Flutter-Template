import 'package:flutter/material.dart';

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
    Color color = Colors.white;

    if (variant == ButtonVariant.text || variant == ButtonVariant.outlined) {
      color = getColor(context);
    }

    if (disabled == true) {
      color = color.withOpacity(0.5);
    }

    return color;
  }

  Color getColor(BuildContext context) {
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
          side: BorderSide(
            color: getColor(context),
          ),
        ),
        child: child,
      );
    } else {
      //apply border radios 8, to all corners
      return ElevatedButton(
        onPressed: () {
          if (disabled == true) return;
          onPressed!();
        },
        onLongPress: onLongPress,
        style: ElevatedButton.styleFrom(
          shape: borderShape,
          backgroundColor: getColor(context),
        ),
        child: child,
      );
    }
  }
}
