// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_production_boilerplate_riverpod/config/style.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SwitchCustom extends StatelessWidget {
  final String? name;
  final List<FormFieldValidator<String>>? validators;
  final String? label;
  final void Function(bool)? onChange;

  const SwitchCustom({
    super.key,
    required this.onChange,
    this.name,
    this.validators,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: name ?? '',
      validator: FormBuilderValidators.compose(
        validators ?? <String? Function(dynamic)>[],
      ),
      builder: (FormFieldState<bool?> field) => getSwitch(field),
    );
  }

  Widget getSwitch(
    FormFieldState<bool?> field,
  ) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            if (label != null)
              Text(
                label!,
                style: TextStyle(fontSize: Style.labelInputSize),
                overflow: TextOverflow.ellipsis,
              ),
            const SizedBox(width: 4),
            Switch(
              value: field.value as bool? ?? false,
              onChanged: (v) {
                if (onChange != null) {
                  onChange!(v);
                }
                field.didChange(!v);
              },
            ),
          ],
        ),
      ],
    );
  }
}
