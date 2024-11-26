// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:flutter_production_boilerplate_riverpod/config/style.dart';

class InputTime extends StatelessWidget {
  final String label;
  final String? name;
  final TimeOfDay? initialValue;
  final List<FormFieldValidator<TimeOfDay>>? validators;
  final String? cancelText;
  final String? confirmText;
  final bool? autoFocus;
  final String? placeholder;
  final String? helperText;
  final bool? disabled;
  final String? error;
  final bool? obscureText;
  final bool? readOnly;
  final void Function(TimeOfDay)? onChange;

  const InputTime({
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
    return FormBuilderField(
      name: name ?? '',
      initialValue: initialValue,
      validator: FormBuilderValidators.compose(
        validators ?? <String? Function(dynamic)>[],
      ),
      builder: (FormFieldState<TimeOfDay?> field) => getInput(context, field),
    );
  }

  Widget getInput(
    BuildContext context,
    FormFieldState<TimeOfDay?> field,
  ) {
    TextEditingController textController = TextEditingController(
      text: field.value?.format(context) ?? '',
    );

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
          TextField(
            controller: textController,
            onTap: () async {
              TimeOfDay? datetime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                cancelText: cancelText ?? 'Cancel',
                confirmText: confirmText ?? 'Confirm',
              );

              if (datetime != null) {
                if (onChange != null) {
                  onChange!(datetime);
                }
                field.didChange(datetime);
              }
            },
            enabled: disabled != true,
            readOnly: true,
            autofocus: autoFocus ?? false,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              errorText: field.errorText ?? error,
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
