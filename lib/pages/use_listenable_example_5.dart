import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseListenableExample5 extends HookWidget {
  const UseListenableExample5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countDown = useMemoized(() => CountDown(from: 20));

    final notifier = useListenable(countDown);
    return Scaffold(
      appBar: AppBar(
        title: const Text("UseListenable Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              notifier.value.toString(),
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}

class CountDown extends ValueNotifier<int> {
  late final StreamSubscription sub;
  CountDown({required int from}) : super(from) {
    sub = Stream.periodic(const Duration(seconds: 1), (value) => from - value)
        .takeWhile((value) => value >= 0)
        .listen((value) => this.value = value);
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }
}
