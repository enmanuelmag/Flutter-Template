// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_production_boilerplate_riverpod/config/style.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SwitchCustom extends StatelessWidget {
  final bool value;
  final String? name;
  final List<String? Function(dynamic)>? validators;
  final String? label;
  final void Function(bool) onChanged;

  const SwitchCustom({
    super.key,
    required this.value,
    required this.onChanged,
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
      builder: (FormFieldState<Object?> field) => getSwitch(field),
    );
  }

  Widget getSwitch(
    FormFieldState<Object?> field,
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
              value: value,
              onChanged: (v) {
                onChanged(!v);
                field.didChange(!v);
              },
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
