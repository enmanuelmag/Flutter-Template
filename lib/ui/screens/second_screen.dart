import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_production_boilerplate_riverpod/ui/widgets/widget.barrel.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SecondScreen extends StatelessWidget {
  static String path = '/settings';

  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<SelectItem> items = <SelectItem>[
      SelectItem(value: '1', label: Text('One')),
      SelectItem(value: '2', label: Text('Two')),
      SelectItem(value: '3', label: Text('Three'), disabled: true),
      SelectItem(value: '4', label: Text('Four')),
    ];

    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            const Header(text: 'bottom_nav_second'),
            const TextDivider(text: 'Form Validation'),
            getForm(),
            const TextDivider(text: 'Inputs'),
            SwitchCustom(
              label: 'Switch',
              value: false,
              onChanged: (bool b) {
                print('Switch value: $b');
              },
            ),
            InputText(
              label: 'Label',
              helperText: 'Helper Text',
              onChange: (String value) {},
            ),
            SelectInput(
              label: 'Select',
              items: items,
              helperText: 'Select an item',
              onChange: (String value) {},
            ),
            InputText(
              label: 'Number',
              helperText: 'Only numbers',
              onChange: (String value) {},
              keyboardType: TextInputType.number,
            ),
            InputText(
              isCurrency: true,
              label: 'Currency',
              helperText: 'Only currency',
              onChange: (String value) {},
              keyboardType: TextInputType.number,
            ),
            InputDate(
              label: 'Date',
              helperText: 'Select a date',
              onChange: (DateTime value) {
                print('Selected date: $value');
              },
            ),
            InputDateRange(
              label: 'Date range',
              helperText: 'Select a date range',
              onChange: (DateTimeRange value) {
                print('Selected range date: $value');
              },
            ),
            InputTime(
              label: 'Time',
              helperText: 'Select a time',
              onChange: (TimeOfDay value) {
                print('Selected range date: $value');
              },
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  Widget getForm() {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    return FormBuilder(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
          InputText(
            name: 'name',
            label: 'Name',
            validators: [
              FormBuilderValidators.required(),
            ],
          ),
          InputText(
            name: 'email',
            label: 'Email',
            validators: [
              FormBuilderValidators.email(),
            ],
          ),
          const SizedBox(height: 16),
          ButtonExtended(
            text: 'Save',
            color: ButtonColor.green,
            variant: ButtonVariant.contained,
            onPressed: () {
              formKey.currentState?.validate();

              debugPrint(formKey.currentState?.value.toString());
            },
          )
        ],
      ),
    );
  }
}
