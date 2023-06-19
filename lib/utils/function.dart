import 'dart:io';

import 'package:path/path.dart';

Future<bool> makeDir(String path) async {
  if (await Directory(dirname(path)).exists()) {
    return true;
  } else {
    try {
      await Directory(dirname(path)).create(recursive: true);
      return true;
    } catch (e) {
      return false;
    }
  }
}
