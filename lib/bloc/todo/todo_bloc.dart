import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoInitial(<Item>[])) {
    on<AddItem>((event, emit) {
      emit(TodoInitial(
          [...state.todoList, Item(id: event.id, value: event.text)]));
    });
    on<RemoveItem>((event, emit) {
      emit(TodoInitial(
          state.todoList..removeWhere((item) => item.id == event.id)));
    });
    on<ClearItem>((event, emit) {
      emit(const TodoInitial(<Item>[]));
    });
  }
}
