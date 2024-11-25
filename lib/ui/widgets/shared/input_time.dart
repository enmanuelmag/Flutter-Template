import 'package:flutter/material.dart';

import 'package:flutter_production_boilerplate_riverpod/config/style.dart';

class InputTime extends StatelessWidget {
  final String label;
  final String? cancelText;
  final String? confirmText;
  final bool? autoFocus;
  final String? placeholder;
  final String? helperText;
  final bool? disabled;
  final String? error;
  final bool? obscureText;
  final bool? readOnly;
  final void Function(TimeOfDay) onChange;

  const InputTime({
    super.key,
    required this.label,
    required this.onChange,
    this.cancelText,
    this.confirmText,
    this.autoFocus,
    this.placeholder,
    this.helperText,
    this.disabled,
    this.error,
    this.obscureText,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    TextInputType parsedKeyboardType = TextInputType.datetime;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          TextField(
            onTap: () async {
              TimeOfDay? datetime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                cancelText: cancelText ?? 'Cancel',
                confirmText: confirmText ?? 'Confirm',
              );

              if (datetime != null) {
                onChange(datetime);
              }
            },
            enabled: disabled != true,
            readOnly: true,
            autofocus: autoFocus ?? false,
            obscureText: obscureText ?? false,
            keyboardType: parsedKeyboardType,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              errorText: error,
              hintText: placeholder,
              helperText: helperText,
              fillColor: Colors.white30,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            style: TextStyle(
              height: Style.inputHeight,
            ),
          ),
        ],
      ),
    );
  }
}
