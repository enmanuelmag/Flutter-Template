import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final double? horizontal;
  final double? vertical;

  const Separator({super.key, this.horizontal, this.vertical});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 8,
        vertical: vertical ?? 8,
      ),
      child: Divider(
        color: Theme.of(context).dividerColor,
      ),
    );
  }
}
