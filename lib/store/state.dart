import 'actions.dart';

class AppState {
  final int count;
  final List<Item> todoList;

  AppState({this.count = 0, this.todoList = const <Item>[]});

  // AppState.initState()
  //     : count = 0,
  //       todoList = const <Item>[];
}
