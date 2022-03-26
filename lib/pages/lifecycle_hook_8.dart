import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseLifeCycleState8 extends HookWidget {
  const UseLifeCycleState8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lifeCycle = useAppLifecycleState();
    return Scaffold(
      appBar: AppBar(
        title: const Text("useLifeCycle Hook Example"),
      ),
      body: Opacity(
        opacity: lifeCycle == AppLifecycleState.resumed ? 1 : 0,
        child: const Center(
          child: Text("CREDIT CARD INFORMATION"),
        ),
      ),
    );
  }
}
