import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HookCounterApp extends HookWidget {
  const HookCounterApp({Key? key}) : super(key: key);

  int increment(int value) => value++;

  @override
  Widget build(BuildContext context) {
    final count = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hooks Counter App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You have pressed the button this many times!"),
            const SizedBox(height: 8),
            Text(
              "${count.value}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
