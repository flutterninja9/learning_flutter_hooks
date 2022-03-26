import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FutureHookExample1 extends HookWidget {
  const FutureHookExample1({Key? key, required this.title}) : super(key: key);

  final String title;

  Future<String> getWeather() async =>
      Future.delayed(const Duration(seconds: 2), () => "22 C @ Ramgarh");

  @override
  Widget build(BuildContext context) {
    final weather = useFuture(getWeather());

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: weather.data == null
            ? const CircularProgressIndicator()
            : Text(
                weather.data!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
      ),
    );
  }
}
