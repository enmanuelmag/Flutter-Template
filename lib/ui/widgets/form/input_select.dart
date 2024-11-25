import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:flutter_production_boilerplate_riverpod/config/style.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/widgets/sheets/bottom_sheet_container.dart';

//define items type for SelectInput, this is a list of items, each item has a label and value property
class SelectItem {
  final Widget label;
  final String value;
  final bool? disabled;
  final Widget? leading;
  final Widget? trailing;

  const SelectItem({
    required this.label,
    required this.value,
    this.disabled,
    this.leading,
    this.trailing,
  });
}

class SelectInput extends StatelessWidget {
  final String label;
  final String? name;
  final List<String? Function(dynamic)>? validators;
  final List<SelectItem> items;
  final bool? autoFocus;
  final String? placeholder;
  final String? helperText;
  final bool? disabled;
  final String? error;
  final bool? readOnly;
  final void Function(String) onChange;

  const SelectInput({
    super.key,
    required this.label,
    required this.items,
    required this.onChange,
    this.name,
    this.validators,
    this.autoFocus,
    this.placeholder,
    this.helperText,
    this.disabled,
    this.error,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: name ?? '',
      validator: FormBuilderValidators.compose(
        validators ?? <String? Function(dynamic)>[],
      ),
      builder: (FormFieldState<Object?> field) => getInput(context, field),
    );
  }

  Widget getInput(
    BuildContext context,
    FormFieldState<Object?> field,
  ) {
    final List<ListTile> itemsWidget = items
        .map(
          (SelectItem item) => ListTile(
            title: item.label,
            leading: item.leading,
            trailing: item.trailing,
            visualDensity: VisualDensity.compact,
            enabled: item.disabled != true,
            onTap: () {
              if (item.disabled == true) return;

              onChange(item.value);
              field.didChange(item.value);
            },
          ),
        )
        .toList();

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
            onTap: () {
              BasicSheet.show(
                context: context,
                title: label,
                child: Column(
                  children: itemsWidget,
                ),
              );
            },
            enabled: disabled != true,
            readOnly: readOnly ?? false,
            autofocus: autoFocus ?? false,
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
