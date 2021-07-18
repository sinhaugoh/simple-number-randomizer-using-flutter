import 'package:flutter/material.dart';
import 'package:portable_flutter_foundation/main.dart';
import 'package:portable_flutter_foundation/randomizer_change_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends ConsumerWidget {
  const RangeSelectorForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final formKey;

  @override
  Widget build(BuildContext context, WidgetReference ref) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              title: 'Minimum',
              intValueSetter: (value) => context.read(randomizerProvider).min = value,
            ),
            SizedBox(
              height: 12,
            ),
            RangeSelectorTextFormField(
              title: 'Maximum',
              intValueSetter: (value) => context.read(randomizerProvider).max = value,
            ),
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  final String title;
  final IntValueSetter intValueSetter;

  const RangeSelectorTextFormField({
    Key? key,
    required this.title,
    required this.intValueSetter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: title,
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'Must be an integer';
        } else {
          return null;
        }
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}
