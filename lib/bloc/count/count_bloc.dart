import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'count_event.dart';
// part 'count_state.dart';

enum CountActionsBloc { increment, decrement }

class CountBloc extends Bloc<CountActionsBloc, int> {
  CountBloc() : super(0) {
    on<CountActionsBloc>((event, emit) {
      if (CountActionsBloc.increment == event) {
        emit(state + 1);
      }
      if (CountActionsBloc.decrement == event) {
        emit(state - 1);
      }
      emit(state);
    });
  }
}
