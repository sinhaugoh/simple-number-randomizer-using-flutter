import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portable_flutter_foundation/randomizer_change_notifier.dart';
import 'package:portable_flutter_foundation/range_selector_page.dart';

void main() {
  runApp(MyApp());
}

final randomizerProvider = ChangeNotifierProvider((ref) => RandomizerChangeNotifier());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RangeSelectorPage(),
      ),
    );
  }
}
