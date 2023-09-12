import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent {
  increment,
  decrement,
  init,
}

class CounterBloc extends Bloc<CounterEvent, int> {
  // CounterBloc(super.initialState);
  CounterBloc() : super(0);

  Stream<int> counterEvent(CounterEvent event) async* {
    // increment
    // decrement
    // yield

    if (event == CounterEvent.increment) {
      yield state + 1;
    } else if (event == CounterEvent.decrement) {
      yield state - 1;
    } else {
      yield 1;
    }
  }
}
