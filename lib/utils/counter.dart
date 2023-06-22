import 'dart:async';

import 'package:flutter/foundation.dart';

class Counter {
  final int time;
  final int duration;
  Timer? timerInstance;
  static int _count = 0;
  Counter({this.time = 60, this.duration = 1});

  final StreamController<int> _countStreamController = StreamController<int>();
  Stream<int> get stream => _countStreamController.stream;
  int get count => _count;

  void start() {
    _count = time;
    _countStreamController.sink.add(_count);
    Timer.periodic(Duration(seconds: duration), (timer) {
      timerInstance = timer;
      _count--;
      _countStreamController.sink.add(_count);
      if (_count == 0) {
        _count = 0;
        timer.cancel();
        if (kDebugMode) {
          print('自动清除');
        }
      }
    });
  }

  void clearTime() {
    _count = 0;
    _countStreamController.sink.add(_count);
    timerInstance?.cancel();
    if (kDebugMode) {
      print('手动清除');
    }
  }
}
