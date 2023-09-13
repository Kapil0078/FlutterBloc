import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc {
  // CounterBloc(super.initialState);
  CounterBloc() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);

  void neutral() => emit(0);
}

// stream
enum CounterEvent { increment, decrement }

class Counter extends Bloc<CounterEvent, int> {
  Counter(super.initialState);

  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }
}
