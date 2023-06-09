part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

/// 添加 item
class AddItem extends TodoEvent {
  static int _id = 0;
  final String text;

  AddItem(this.text) {
    _id++;
  }

  int get id => _id;
}

/// 移除 item
class RemoveItem extends TodoEvent {
  final int id;

  RemoveItem(this.id);
}

/// 清空 item
class ClearItem extends TodoEvent {}
