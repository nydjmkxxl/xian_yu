import 'package:scoped_model/scoped_model.dart';

class CountModel extends Model {
  int _count = 0;

  int get count => _count;
  void increment() {
    _count++;

    notifyListeners();
  }

  void discrement() {
    _count--;

    notifyListeners();
  }
}
