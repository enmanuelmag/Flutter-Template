import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final double? horizontal;
  final double? vertical;

  const TextDivider({
    super.key,
    required this.text,
    this.horizontal,
    this.vertical,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vertical ?? 16,
        horizontal: horizontal ?? 24,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              color: Theme.of(context).dividerColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              tr(text),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Expanded(
            child: Divider(
              color: Theme.of(context).dividerColor,
            ),
          ),
        ],
      ),
    );
  }
}
