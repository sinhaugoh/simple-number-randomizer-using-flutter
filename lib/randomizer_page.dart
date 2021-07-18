import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portable_flutter_foundation/main.dart';

class RandomizerPage extends ConsumerWidget {
  RandomizerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetReference ref) {
    final randomizer = ref.watch(randomizerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Randomizer'),
      ),
      body: Center(
        child: Text(
          randomizer.generatedNumber?.toString() ?? 'Generate a number',
          style: TextStyle(fontSize: 42),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read(randomizerProvider).generateRandomNumber();
        },
        label: Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
