import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// removes null from a given iterable
extension CompactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform,
  ]) =>
      map(transform ?? (e) => e)
          .where(
            (e) => e != null,
          )
          .cast();
}

const imageUrl = "https://bit.ly/3qAf0rF";

class FutureHooksExample4 extends HookWidget {
  const FutureHooksExample4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// If cached version of object is found, then widget is not rebuilt
    /// We are using it with useFuture() because useFuture() cannot hold state
    final image = useMemoized(() => NetworkAssetBundle(Uri.parse(imageUrl))
        .load(imageUrl)
        .then((data) => data.buffer.asUint8List())
        .then((data) => Image.memory(data)));

    final snapshot = useFuture(image);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Network Image Hooks"),
      ),
      body: Column(
        children: [snapshot.data].compactMap().toList(),
      ),
    );
  }
}
