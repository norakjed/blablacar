import 'package:blablacaar/ui/theme/theme.dart';
import 'package:blablacaar/ui/widgets/actions/bla_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: BlaButtonTestScreen()),
    );
  }
}

class BlaButtonTestScreen extends StatelessWidget {
  const BlaButtonTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BlaButton Test')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlaButton(
              label: 'Search',
              type: ButtonType.primary,
              onPressed: () {
                debugPrint('Primary pressed');
              },
            ),
            SizedBox(height: 10),
            BlaButton(
              label: 'Cancel',
              type: ButtonType.secondary,
              onPressed: () {
                debugPrint('Secondary pressed');
              },
            ),
            SizedBox(height: 10,),
            BlaButton(
              label: 'Search',
              type: ButtonType.primary,
              icon: Icons.search,
              onPressed: () {
                debugPrint('Primary with icon pressed');
              },
            ),
            SizedBox(height: 10),
            BlaButton(
              label: 'Cancel',
              type: ButtonType.secondary,
              icon: Icons.cancel,
              onPressed: () {
                debugPrint('Secondary with icon pressed');
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
