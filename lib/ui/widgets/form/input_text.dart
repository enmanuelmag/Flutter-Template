// ignore_for_file: always_specify_types, inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

import 'package:flutter_production_boilerplate_riverpod/config/style.dart';

class InputText extends StatelessWidget {
  final String label;
  final String? name;
  final List<FormFieldValidator<String>>? validators;
  final bool? autoFocus;
  final bool? isCurrency;
  final String? placeholder;
  final String? helperText;
  final bool? disabled;
  final String? error;
  final bool? obscureText;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final void Function(String)? onChange;

  const InputText({
    super.key,
    required this.label,
    this.onChange,
    this.name,
    this.validators,
    this.autoFocus,
    this.isCurrency,
    this.placeholder,
    this.helperText,
    this.disabled,
    this.error,
    this.obscureText,
    this.readOnly,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: name ?? '',
      validator: FormBuilderValidators.compose(
        validators ?? <String? Function(dynamic)>[],
      ),
      builder: (FormFieldState<Object?> field) => getInput(field),
    );
  }

  Widget getInput(
    FormFieldState<Object?> field,
  ) {
    List<TextInputFormatter> inputFormatters = <TextInputFormatter>[];

    TextInputType parsedKeyboardType = keyboardType ?? TextInputType.text;

    if (isCurrency == true) {
      parsedKeyboardType = TextInputType.number;
      inputFormatters.add(CurrencyTextInputFormatter.currency(
        decimalDigits: 2,
        locale: 'en_US',
        symbol: '\$',
      ));
    } else if (parsedKeyboardType == TextInputType.number) {
      inputFormatters.add(FilteringTextInputFormatter.digitsOnly);
    }

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
            onChanged: (value) {
              if (onChange != null) {
                onChange!(value);
              }
              field.didChange(value);
            },
            inputFormatters: inputFormatters,
            enabled: disabled != true,
            readOnly: readOnly ?? false,
            autofocus: autoFocus ?? false,
            obscureText: obscureText ?? false,
            keyboardType: parsedKeyboardType,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              errorText: field.errorText ?? error,
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
