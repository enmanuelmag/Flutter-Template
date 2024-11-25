import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader extends StatelessWidget {
  final double? size;
  final String? text;

  const Loader({super.key, this.size, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LoadingAnimationWidget.progressiveDots(
          color: Theme.of(context).colorScheme.primary,
          size: size ?? 42,
        ),
        const SizedBox(height: 0),
        if (text != null)
          Text(
            text!,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
      ],
    );
  }
}
