import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learning_flutter_hooks/pages/future_hooks_example_4.dart';

class ComplexUIWithHooks6 extends HookWidget {
  const ComplexUIWithHooks6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final StreamController<double> streamController;
    streamController = useStreamController<double>(onListen: () {
      streamController.sink.add(0.0);
    });

    final stream = useStream(streamController.stream);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rotation Effect"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: GestureDetector(
                onTap: () => streamController.add(stream.data! + 0.1),
                child: SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Transform.rotate(
                    angle: stream.data!,
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
