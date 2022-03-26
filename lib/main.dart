import 'package:flutter/material.dart';
import 'package:learning_flutter_hooks/pages/lifecycle_hook_8.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Learning Flutter Hooks',
      home: UseLifeCycleState8(),
      debugShowCheckedModeBanner: false,
    );
  }
}
