part of 'todo_bloc.dart';

class Item {
  final int id;
  final String value;

  const Item({required this.id, required this.value});
}

@immutable
abstract class TodoState {
  final List<Item> todoList;

  const TodoState(this.todoList);
}

class TodoInitial extends TodoState {
  const TodoInitial(super.todoList);
}
