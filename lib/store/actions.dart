
enum CountActions {
  increment,
  discrement
}

// item
class Item {
  final int id;
  final String value;

  Item({required this.id, required this.value});

  get length => null;
}

// 添加 item
class AddItem {
  static int _id = 0;
  final String text;

  AddItem(this.text) {
    _id++;

    Item(id: _id, value: text);
  }

  int get id => _id;
}

// 移除 item
class RemoveItem {
  final int id;

  RemoveItem(this.id);
}

// 清空 item
class ClearItem {}
