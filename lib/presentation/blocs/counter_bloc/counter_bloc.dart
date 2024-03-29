import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    // on<CounterIncreased>((event, emit) {});
    on<CounterIncreased>(_onCounterIncresed);
    on<CounterReset>(_onCounterReset);
  }

  void _onCounterIncresed(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCounter: state.transactionCounter + 1));
  }

  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: 0,
    ));
  }
}
