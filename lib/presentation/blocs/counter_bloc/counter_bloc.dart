import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    // on<CounterIncreased>((event, emit) {});
    on<CounterIncreased>(_onCounterIncresed);
  }

  void _onCounterIncresed(CounterIncreased event, Emitter<CounterState> emi) {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCounter: state.transactionCounter + 1));
  }
}
