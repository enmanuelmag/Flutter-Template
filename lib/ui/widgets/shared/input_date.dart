import 'package:flutter/material.dart';

import 'package:flutter_production_boilerplate_riverpod/config/style.dart';

class InputDate extends StatelessWidget {
  final String label;
  final String? cancelText;
  final String? confirmText;
  final DateTime? minDate;
  final DateTime? maxDate;
  final bool? autoFocus;
  final String? placeholder;
  final String? helperText;
  final bool? disabled;
  final String? error;
  final bool? obscureText;
  final bool? readOnly;
  final void Function(DateTime) onChange;

  const InputDate({
    super.key,
    required this.label,
    required this.onChange,
    this.minDate,
    this.maxDate,
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
              DateTime? datetime = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: minDate ?? DateTime(2000),
                lastDate: maxDate ?? DateTime(2100),
                cancelText: cancelText ?? 'Cancel',
                confirmText: confirmText ?? 'Confirm',
                helpText: helperText,
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
