import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:xianyu/database/basedase_provider.dart';
import 'package:xianyu/entity_class/serialize/user_info.dart';

class ContentProvider extends DatabaseProvider {
  /// 不用定义 ContentProvider 就可以使用
  /// 定义这个以后就可以 ContentProvider.db 这样使用公共方法
  static final ContentProvider db = ContentProvider();

  Future<Database> get contentProviderDatabase async => super.databaseProvider;

  /// 增
  /// 写入表 posts 使用 for 性能地下 batch insert （批量插入）
  addPostBatch(List<UserInfo> lists) async {
    try {
      final db = await contentProviderDatabase;
      Batch batch = db.batch();
      for (var element in lists) {
        batch.insert('posts', element.toJson());
      }
      var res = await batch.commit();
      print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 成功');
      return res;
    } catch (e) {
      if (kDebugMode) {
        print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 失败 $e');
      }
    }
  }

  /// 删
  deletePostBatch(List<String> userIds) async {
    try {
      final db = await contentProviderDatabase;
      Batch batch = db.batch();
      for (var element in userIds) {
        /// 当语句中与 sqlfite 中保留关键字冲突时使用 []
        batch.delete('posts', where: '[userId] = ?', whereArgs: [element]);
      }
      var res = await batch.commit();
      return res;
    } catch (e) {
      if (kDebugMode) {
        print('delete post $e');
      }
    }
  }

  /// 查
  getPost(String userId) async {
    try {
      final db = await contentProviderDatabase;
      var res =
          await db.query('posts', where: '[userId] = ?', whereArgs: [userId]);
      if (res.isEmpty) return null;
      List<UserInfo> lists = res.map((e) => UserInfo.fromJson(e)).toList();
      return lists[0];
    } catch (e) {
      if (kDebugMode) {
        print('getPost $e');
      }
    }
  }

  getPosts(List<String> userIds) async {
    try {
      final db = await contentProviderDatabase;

      /// SELECT * FROM posts WHERE [userId] IN ("userId1","userId2")
      String sql =
          'SELECT * FROM posts WHERE [userId] IN ("${userIds.join(',').replaceAll(',', ",")}")';
      var res = await db.rawQuery(sql);
      if (res.isEmpty) return null;
      List<UserInfo> lists = res.map((e) => UserInfo.fromJson(e)).toList();
      return lists;
    } catch (e) {
      if (kDebugMode) {
        print('getPosts $e');
      }
    }
  }

  /// 改
  /// toJson -> Array || Object -> Sqflite
  updatePost(List<UserInfo> lists) async {
    try {
      final db = await contentProviderDatabase;
      Batch batch = db.batch();
      for (var element in lists) {
        batch.update('posts', element.toJson(),
            where: '[userId] = ?', whereArgs: [element.userId]);
      }
      var res = await batch.commit();
      if (res.isEmpty) return null;
      return res;
    } catch (e) {
      if (kDebugMode) {
        print('updatePost $e');
      }
    }
  }
}
