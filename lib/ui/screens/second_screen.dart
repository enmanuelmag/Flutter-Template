import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_production_boilerplate_riverpod/ui/widgets/widget.barrel.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SecondScreen extends StatelessWidget {
  static String path = '/settings';

  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            const TextDivider(
              text: 'Form Validation',
              horizontal: 8,
            ),
            getForm(),
            const TextDivider(
              text: 'Inputs',
              horizontal: 8,
            ),
            getInputs(),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  Widget getInputs() {
    const List<SelectItem> items = <SelectItem>[
      SelectItem(value: '1', label: 'One'),
      SelectItem(value: '2', label: 'Two'),
      SelectItem(value: '3', label: 'Three', disabled: true),
      SelectItem(value: '4', label: 'Four'),
    ];

    return Column(
      children: <Widget>[
        SwitchCustom(
          label: 'Switch',
          onChange: (bool b) {
            print('Switch value: $b');
          },
        ),
        InputText(
          label: 'Label',
          helperText: 'Helper Text',
          onChange: (String? value) {},
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
          onChange: (String? value) {},
          keyboardType: TextInputType.number,
        ),
        InputText(
          isCurrency: true,
          label: 'Currency',
          helperText: 'Only currency',
          onChange: (String? value) {},
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
      ],
    );
  }

  Widget getForm() {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    const List<SelectItem> items = <SelectItem>[
      SelectItem(value: '1', label: 'One'),
      SelectItem(value: '2', label: 'Two'),
      SelectItem(value: '3', label: 'Three', disabled: true),
      SelectItem(value: '4', label: 'Four'),
    ];

    return FormBuilder(
      key: formKey,
      initialValue: <String, dynamic>{
        'name': 'John Doe',
        'email': 'test@test.com',
        'select': '3',
        'date': DateTime.now(),
        'time': TimeOfDay.now(),
        'switch': true,
      },
      child: Column(
        children: <Widget>[
          InputText(
            name: 'name',
            label: 'Name',
            validators: <FormFieldValidator<String>>[
              FormBuilderValidators.required(),
            ],
          ),
          const SizedBox(height: 8),
          SelectInput(
            name: 'select',
            label: 'Select',
            items: items,
            helperText: 'Select an item',
            validators: <FormFieldValidator<String>>[
              FormBuilderValidators.required(),
            ],
          ),
          InputText(
            name: 'email',
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            validators: <FormFieldValidator<String>>[
              FormBuilderValidators.email(),
            ],
          ),
          InputDate(
            name: 'date',
            label: 'Date',
            validators: <FormFieldValidator<DateTime>>[
              FormBuilderValidators.required(),
            ],
          ),
          InputTime(
            name: 'time',
            label: 'Time',
            validators: <FormFieldValidator<TimeOfDay>>[
              FormBuilderValidators.required(),
            ],
          ),
          SwitchCustom(
            name: 'switch',
            label: 'Switch',
            onChange: (bool b) {
              print('Switch value: $b');
            },
          ),
          const SizedBox(height: 16),
          ButtonExtended(
            text: 'Save',
            color: ButtonColor.green,
            variant: ButtonVariant.contained,
            onPressed: () {
              formKey.currentState?.saveAndValidate();

              debugPrint('PRINT ${formKey.currentState?.value.toString()}');
            },
          )
        ],
      ),
    );
  }
}
