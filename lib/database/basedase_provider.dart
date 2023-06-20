import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:xianyu/config.dart';
import 'package:xianyu/entity_class/serialize/user_info.dart';
import 'package:xianyu/utils/function.dart';
import 'package:xianyu/utils/storage.dart';

class DatabaseProvider {
  ///  databaseProvider 代表 该类的
  static final DatabaseProvider db = DatabaseProvider();

  Database? _database;

  DatabaseProvider();

  Future<Database> get databaseProvider async {
    if (_database == null) {
      _database = await initDatabase();
      return _database as Database;
    }
    return _database as Database;
  }

  // Future<Database> get databaseProvider async =>
  //   _database ?? await initDatabase();

  Future<Database> initDatabase() async {
    /// 判断路径是否存在，不存在需要创建
    /// 根据不同场景，public user
    String path = '';
    String databasePath = await getDatabasesPath();
    if (kDebugMode) {
      print(databasePath);
    }
    UserInfo? userInfo = Storage().getUserInfo();
    if (userInfo != null) {
      path =
          join(databasePath, '${userInfo.userId}', Config.privateDatabaseName);
      await makeDir(path);
    } else {
      path = join(databasePath, Config.publicDatabaseName);
    }

    if (kDebugMode) {
      print('本地数据库 存储路径: $path');
    }

    return await openDatabase(
      path,
      version: 1,
      onConfigure: (db) {},
      onOpen: (db) {},
      onCreate: (db, version) async {
        /// 当这个表不存在时，创建它
        /// 表 posts 字段 ()
        /// id TEXT PRIMARY KEY, 主键
        await db.execute(''' CREATE TABLE IF NOT EXISTS posts (
          id TEXT PRIMARY KEY,
          userId INTEGER,
          deptId INTEGER,
          loginName TEXT,
          userName TEXT,
          userType TEXT,
          email TEXT,
          phonenumber TEXT,
          sex TEXT,
          avatar TEXT,
          password TEXT,
          salt TEXT,
          status TEXT,
          delFlag TEXT,
          loginIp TEXT,
          loginDate TEXT,
          createBy TEXT,
          createTime TEXT,
          updateBy TEXT,
          updateTime TEXT,
          remark TEXT,
          openId TEXT,
          city TEXT,
          country TEXT,
          province TEXT,
          headimgUrl TEXT,
          unionId TEXT,
          loginnum INTEGER,
          userpost TEXT,
          businesscity TEXT,
          businessprovince TEXT,
          organize TEXT,
          isnotcie INTEGER,
          subusername TEXT,
          deptType TEXT,
          deptTypeName TEXT,
          deptStatus TEXT,
          usenum TEXT,
          expireDate TEXT,
          aicLicense INTEGER,
          aicBalance INTEGER,
          payType TEXT,
          recommenderName TEXT,
          recommenderPhone TEXT,
          addeffectTime INTEGER,
          agencyPolicy TEXT,
          violation INTEGER,
          voice  INTEGER,
          myCustomer INTEGER,
          customerView INTEGER,
          phone  INTEGER,
          infoModify INTEGER,
          edit   INTEGER,
          downloadFlag INTEGER,
          aiFlag INTEGER,
          addCustomer INTEGER,
          picUpload INTEGER,
          excel  INTEGER,
          fclass INTEGER,
          fclassFree INTEGER,
          agentFlag INTEGER,
          myGroup INTEGER,
          subInfoModify INTEGER,
          subPhone INTEGER,
          subEdit INTEGER,
          subDownload INTEGER,
          freeMaterials INTEGER,
          phoneNumbers INTEGER,
          assistAccount INTEGER,
          analysis INTEGER,
          message INTEGER,
          submitCount TEXT,
          ocrErrorCount TEXT,
          plateErrorCount TEXT,
          repeatCount TEXT,
          queueCount TEXT,
          passCount TEXT,
          matchCount TEXT,
          matchRate TEXT,
          submitCountYe TEXT,
          ocrErrorCountYe TEXT,
          plateErrorCountYe TEXT,
          repeatCountYe TEXT,
          queueCountYe TEXT,
          passCountYe TEXT,
          matchCountYe TEXT,
          matchRateYe TEXT,
          headimg TEXT,
          recentDay TEXT,
          expire INTEGER,
          record TEXT) ''');

        /// await db.execute()... 创建其他表
      },
      onUpgrade: (db, oldVersion, newVersion) {},
      onDowngrade: (db, oldVersion, newVersion) {},
    );
  }
}
