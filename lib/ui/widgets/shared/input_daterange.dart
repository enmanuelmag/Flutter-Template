import 'package:flutter/material.dart';

import 'package:flutter_production_boilerplate_riverpod/config/style.dart';

class InputDateRange extends StatelessWidget {
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
  final void Function(DateTimeRange) onChange;

  const InputDateRange({
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
              DateTimeRange? dateRangeTime = await showDateRangePicker(
                context: context,
                initialDateRange: DateTimeRange(
                  start: DateTime.now(),
                  end: DateTime.now().add(const Duration(days: 7)),
                ),
                firstDate: minDate ?? DateTime(2000),
                lastDate: maxDate ?? DateTime(2100),
                cancelText: cancelText ?? 'Cancel',
                confirmText: confirmText ?? 'Confirm',
                helpText: helperText,
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      dialogTheme: DialogTheme(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );

              if (dateRangeTime != null) {
                onChange(dateRangeTime);
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
