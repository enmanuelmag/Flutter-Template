import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/config/style.dart';

//import 'package:gluestack_ui/gluestack_ui.dart';

class InputText extends StatelessWidget {
  final String label;
  final bool? autoFocus;
  final String? placeholder;
  final String? helperText;
  final bool? disabled;
  final String? error;
  final bool? obscureText;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final void Function(String) onChange;

  const InputText({
    super.key,
    required this.label,
    required this.onChange,
    this.autoFocus,
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
            onChanged: onChange,
            enabled: disabled != true,
            readOnly: readOnly ?? false,
            autofocus: autoFocus ?? false,
            obscureText: obscureText ?? false,
            keyboardType: keyboardType ?? TextInputType.text,
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
