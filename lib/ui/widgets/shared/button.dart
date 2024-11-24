import 'package:flutter/material.dart';

enum ButtonColor {
  red,
  green,
  gray,
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
    if (variant == ButtonVariant.text || variant == ButtonVariant.outlined) {
      return Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: disabled == true
              ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
              : Theme.of(context).colorScheme.primary,
        ),
      );
    } else {
      return Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color:
              disabled == true ? Colors.white.withOpacity(0.5) : Colors.white,
        ),
      );
    }
  }

  Color getColor(BuildContext context) {
    if (disabled == true) {
      return Theme.of(context).colorScheme.primary.withOpacity(0.5);
    }

    switch (color) {
      case ButtonColor.red:
        return Theme.of(context).colorScheme.error;
      case ButtonColor.green:
        return Colors.green;
      case ButtonColor.gray:
        return Theme.of(context).colorScheme.secondary;
      case ButtonColor.orange:
        return Colors.orange;
      case ButtonColor.violet:
        return Theme.of(context).colorScheme.tertiary;
      case ButtonColor.blue:
        return Theme.of(context).colorScheme.primary;
      case ButtonColor.yellow:
        return Colors.yellow;
      case ButtonColor.primary:
        return Theme.of(context).colorScheme.primary;
      default:
        return Theme.of(context).colorScheme.primary;
    }
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
        onPressed: disabled == true ? null : onPressed,
        onLongPress: onLongPress,
        child: child,
      );
    } else if (variant == ButtonVariant.outlined) {
      return OutlinedButton(
        onPressed: disabled == true ? null : onPressed,
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
        onPressed: disabled == true ? null : onPressed,
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
