import 'package:redux/redux.dart';
import 'package:xianyu/store/actions.dart';

import '../store/state.dart';

class ViewModel {
  final int count;
  final Function increment;
  final Function discrement;
  final List<Item> todoList;
  final Function addItem;
  final Function removeItem;
  final Function clearItem;

  ViewModel(
      {required this.count,
      required this.increment,
      required this.discrement,
      required this.todoList,
      required this.addItem,
      required this.removeItem,
      required this.clearItem});

  factory ViewModel.create(Store<AppState> store) {
    incrementHandler() {
      store.dispatch(CountActions.increment);
    }

    discrementHandler() {
      store.dispatch(CountActions.discrement);
    }

    addItemHandler(String text) {
      store.dispatch(AddItem(text));
    }

    removeItemHandler(int id) {
      store.dispatch(RemoveItem(id));
    }

    clearItemHandler() {
      store.dispatch(ClearItem());
    }

    return ViewModel(
        count: store.state.count,
        increment: incrementHandler,
        discrement: discrementHandler,
        todoList: store.state.todoList,
        addItem: addItemHandler,
        removeItem: removeItemHandler,
        clearItem: clearItemHandler);
  }
}
