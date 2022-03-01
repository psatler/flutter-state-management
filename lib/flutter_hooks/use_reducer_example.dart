import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const _url = 'https://bit.ly/3x7J5Qt';

enum Action {
  rotateLeft,
  rotateRight,
  moreVisible,
  lessVisible,
}

@immutable
class State {
  final double rotationDegrees;
  final double alpha;

  const State({
    required this.rotationDegrees,
    required this.alpha,
  });

  const State.zero()
      : rotationDegrees = 0.0,
        alpha = 1.0;

  State rotateRight() => State(
        rotationDegrees: rotationDegrees + 10.0,
        alpha: alpha,
      );

  State rotateLeft() => State(
        rotationDegrees: rotationDegrees - 10.0,
        alpha: alpha,
      );

  State increaseAlpha() => State(
        rotationDegrees: rotationDegrees,
        alpha: min(alpha + 0.1, 1.0),
      );

  State decreaseAlpha() => State(
        rotationDegrees: rotationDegrees,
        alpha: max(alpha - 0.1, 0.0),
      );
}

State reducer(State oldState, Action? action) {
  switch (action) {
    case Action.rotateLeft:
      return oldState.rotateLeft();

    case Action.rotateRight:
      return oldState.rotateRight();

    case Action.moreVisible:
      return oldState.increaseAlpha();

    case Action.lessVisible:
      return oldState.decreaseAlpha();

    default:
      return oldState;
  }
}

// ##########
// ##########
// ##########

class UseReducerExample extends HookWidget {
  const UseReducerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = useReducer<State, Action?>(
      reducer,
      initialState: const State.zero(),
      initialAction: null,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('useReducer example')),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RotateLeftButton(store: store),
                RotateRightButton(store: store),
                DecreaseAlphaButton(store: store),
                IncreaseAlphaButton(store: store),
              ],
            ),
          ),
          const SizedBox(height: 150),
          Opacity(
            opacity: store.state.alpha,
            child: RotationTransition(
                turns:
                    AlwaysStoppedAnimation(store.state.rotationDegrees / 360.0),
                child: Image.network(_url)),
          ),
        ],
      ),
    );
  }
}

class IncreaseAlphaButton extends StatelessWidget {
  const IncreaseAlphaButton({
    Key? key,
    required this.store,
  }) : super(key: key);

  final Store<State, Action?> store;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        store.dispatch(Action.moreVisible);
      },
      child: const Text('Increase Alpha'),
    );
  }
}

class DecreaseAlphaButton extends StatelessWidget {
  const DecreaseAlphaButton({
    Key? key,
    required this.store,
  }) : super(key: key);

  final Store<State, Action?> store;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        store.dispatch(Action.lessVisible);
      },
      child: const Text('Decrease Alpha'),
    );
  }
}

class RotateRightButton extends StatelessWidget {
  const RotateRightButton({
    Key? key,
    required this.store,
  }) : super(key: key);

  final Store<State, Action?> store;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        store.dispatch(Action.rotateRight);
      },
      child: const Text('Rotate Right'),
    );
  }
}

class RotateLeftButton extends StatelessWidget {
  const RotateLeftButton({
    Key? key,
    required this.store,
  }) : super(key: key);

  final Store<State, Action?> store;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        store.dispatch(Action.rotateLeft);
      },
      child: const Text('Rotate Left'),
    );
  }
}
