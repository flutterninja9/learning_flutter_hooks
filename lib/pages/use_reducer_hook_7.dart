import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learning_flutter_hooks/pages/future_hooks_example_4.dart';

/// What is a reducer?
/// newState = old-state + action

enum Action { rotateLeft, rotateRight, increaseAlpha, decreaseAlpha }

@immutable
class State {
  final double rotateDeg;
  final double alpha;

  const State({
    required this.rotateDeg,
    required this.alpha,
  });

  const State.zero()
      : rotateDeg = 0.0,
        alpha = 1.0;

  State rotateRight() => State(
        rotateDeg: rotateDeg + 10.0,
        alpha: alpha,
      );

  State rotateLeft() => State(
        rotateDeg: rotateDeg - 10.0,
        alpha: alpha,
      );

  State increaseAlpha() => State(
        rotateDeg: rotateDeg,
        alpha: min(alpha + 0.1, 1.0),
      );

  State decreaseAlpha() => State(
        rotateDeg: rotateDeg,
        alpha: max(alpha - 0.1, 0.0),
      );
}

State reducer(
  State state,
  Action? action,
) {
  switch (action) {
    case Action.rotateLeft:
      return state.rotateLeft();
    case Action.rotateRight:
      return state.rotateRight();
    case Action.increaseAlpha:
      return state.increaseAlpha();
    case Action.decreaseAlpha:
      return state.decreaseAlpha();
    default:
      return state;
  }
}

class UseReducerHook7 extends HookWidget {
  const UseReducerHook7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = useReducer<State, Action?>(
      reducer,
      initialState: const State.zero(),
      initialAction: null,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("useReducer Hook Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  TextButton(
                    onPressed: () => store.dispatch(Action.rotateLeft),
                    child: const Text("Rotate Left"),
                  ),
                  TextButton(
                    onPressed: () => store.dispatch(Action.rotateRight),
                    child: const Text("Rotate Right"),
                  ),
                  TextButton(
                    onPressed: () => store.dispatch(Action.increaseAlpha),
                    child: const Text("Increase Opacity"),
                  ),
                  TextButton(
                    onPressed: () => store.dispatch(Action.decreaseAlpha),
                    child: const Text("Decrease Opacity"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Opacity(
              opacity: store.state.alpha,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(store.state.rotateDeg / 360),
                child: Image.network(imageUrl),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
