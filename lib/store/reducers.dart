import 'package:redux/redux.dart';
import 'package:xianyu/store/state.dart';

import 'actions.dart';

int countReducer(int store, dynamic action) {
  if (CountActions.increment == action) {
    store++;
  }
  if (CountActions.discrement == action) {
    store--;
  }
  return store;
}

final todoReducer = combineReducers<List<Item>>([
  TypedReducer<List<Item>, AddItem>(
      (state, action) => [...state, Item(id: action.id, value: action.text)]),
  TypedReducer<List<Item>, RemoveItem>(
      (state, action) => state..removeWhere((item) => item.id == action.id)),
  TypedReducer<List<Item>, ClearItem>((state, action) => const <Item>[])
]);

AppState appReducers(AppState state, dynamic action) {
  return AppState(
      count: countReducer(state.count, action),
      todoList: todoReducer(state.todoList, action));
}
