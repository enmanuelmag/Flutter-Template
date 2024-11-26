// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_production_boilerplate_riverpod/config/style.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class InputDateRange extends StatelessWidget {
  final String label;
  final String? name;
  final DateTimeRange? initialValue;
  final List<FormFieldValidator<DateTimeRange>>? validators;
  final String? cancelText;
  final String? confirmText;
  final bool? autoFocus;
  final String? placeholder;
  final String? helperText;
  final bool? disabled;
  final String? error;
  final bool? obscureText;
  final bool? readOnly;
  final void Function(DateTimeRange)? onChange;

  const InputDateRange({
    super.key,
    required this.label,
    this.initialValue,
    this.onChange,
    this.name,
    this.validators,
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
    return getInput(context);
  }

  Widget getInput(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(fontSize: Style.labelInputSize),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          FormBuilderDateRangePicker(
            name: name ?? '',
            firstDate: initialValue?.start ?? DateTime(2000),
            lastDate: initialValue?.end ?? DateTime(2100),
            validator: FormBuilderValidators.compose(
              validators ?? <String? Function(dynamic)>[],
            ),
            enabled: disabled != true,
            autofocus: autoFocus ?? false,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              hintText: placeholder,
              helperText: helperText,
              fillColor: Colors.white.withOpacity(0.1),
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
