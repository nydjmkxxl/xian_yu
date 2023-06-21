import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xianyu/database/content_provider.dart';
import 'package:xianyu/entity_class/serialize/user_info.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';
// import 'package:scoped_model/scoped_model.dart'; // scopedmodel
import 'package:xianyu/pages/second.dart';
import 'package:xianyu/utils/counter.dart';
import 'package:xianyu/utils/request/http.dart';
import 'package:xianyu/utils/storage.dart';
// import 'package:xianyu/pages/second.dart';
// import 'package:xianyu/store/reducers.dart';
// import 'package:xianyu/store/state.dart';
// import 'package:xianyu/widgets/view_model.dart';

import 'bloc/count/count_bloc.dart';
import 'bloc/todo/todo_bloc.dart';
import 'entity_class/get_it.dart';
import 'entity_class/serialize/http.response.dart';
// import 'model/count_model.dart'; // scopedmodel

void main() async {
  getItSetup(); // 单例工具
  GetStorage.init(); // 本地存储初始化
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountBloc>(create: (context) => CountBloc()),
        BlocProvider<TodoBloc>(create: (context) => TodoBloc())
      ],
      child: MaterialApp(
        title: 'flutter',
        theme: ThemeData(brightness: Brightness.light),
        home: const MyHomePage(title: 'app title'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController textController = TextEditingController();
  Counter counter = Counter(time: 10);

  // active
  ButtonStyle btnActive = ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(Colors.blue),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))));
  // inactive
  ButtonStyle btnInActive = ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))));

  @override
  Widget build(BuildContext context) {
    String msg = '';

    return Scaffold(
        appBar: AppBar(title: const Text('flutter')),
        body: Center(
          child: Column(
            children: [
              Text(widget.title),
              BlocBuilder<CountBloc, int>(
                  builder: (context, state) => Text('$state')),
              StreamBuilder<int>(
                  stream: counter.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (counter.count > 0) {
                        msg = '重新发送 ${snapshot.data}s';
                      } else {
                        msg = '重新发送';
                      }
                    } else {
                      msg = '获取验证码';
                    }
                    return ElevatedButton(
                        onPressed: () async {
                          // 正在获取验证码时再次点击无效
                          if (counter.count > 0) {
                            if (kDebugMode) {
                              print('正在获取验证码时再次点击无效');
                            }
                            return;
                          }
                          counter.start();
                          // var res = await DioHttp()
                          //     .get('crm/user/queryUserInfo', {'userId': 179});

                          // Map<String, dynamic> data = res.data;
                          // HttpResponse httpResponse =
                          //     HttpResponse.fromJson(data);
                          // if (res.statusCode != 200) {
                          //   counter.clearTime();
                          // } else {
                          // ContentProvider().addPostBatch(lists)
                          var srcJson = {
                            "userId": 179,
                            "deptId": 681,
                            "loginName": "18914821512",
                            "userName": "test",
                            "userType": "00",
                            "email": "1427997791@qq.com",
                            "phonenumber": "18914821512",
                            "sex": "0",
                            "avatar": "",
                            "password": "",
                            "salt": "",
                            "status": "0",
                            "delFlag": "0",
                            "loginIp": "114.225.161.25",
                            "loginDate": [2021, 10, 25, 14, 37, 18],
                            "createBy": "18952023912",
                            "createTime": "2021-08-27 13:55:56",
                            "updateBy": "",
                            "updateTime": "2022-10-20 11:00:35",
                            "remark": "被推荐",
                            "openId": "okVU15XTiSNxiPlHfP3S65DWC-Cg",
                            "city": "",
                            "country": "",
                            "province": "",
                            "headimgUrl":
                                "https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI4nhGyttsoDgvKSI3MOOleuV0ZTFr3e9gor17qbaLT2NvYz38hqDb8jEFQH4IeAJibpzwA6APTwOQ/132",
                            "unionId": "",
                            "loginnum": 7,
                            "userpost": "",
                            "businesscity": "北京市",
                            "businessprovince": "北京市",
                            "organize": "",
                            "isnotcie": 0,
                            "subusername": "朱明东",
                            "deptType": "",
                            "deptTypeName": "",
                            "deptStatus": "",
                            "usenum": "",
                            "expireDate": "2024-01-01 23:59:59",
                            "aicLicense": 35985,
                            "aicBalance": 2994,
                            "payType": "",
                            "recommenderName": "仲启潞",
                            "recommenderPhone": "15855087406",
                            "addeffectTime": 1705116769000,
                            "agencyPolicy": "1/0.05/550/3000",
                            "violation": 49,
                            "voice": 1,
                            "myCustomer": 1,
                            "customerView": 1,
                            "phone": 1,
                            "infoModify": 2,
                            "edit": 2,
                            "downloadFlag": 1,
                            "aiFlag": 1,
                            "addCustomer": 1,
                            "picUpload": 1,
                            "excel": 1,
                            "fclass": 1,
                            "fclassFree": 1,
                            "agentFlag": 1,
                            "myGroup": 1,
                            "subInfoModify": 2,
                            "subPhone": 1,
                            "subEdit": 2,
                            "subDownload": 1,
                            "freeMaterials": 1,
                            "phoneNumbers": 1,
                            "assistAccount": 1,
                            "analysis": 1,
                            "message": 2,
                            "submitCount": "",
                            "ocrErrorCount": "",
                            "plateErrorCount": "",
                            "repeatCount": "",
                            "queueCount": "",
                            "passCount": "",
                            "matchCount": "",
                            "matchRate": "",
                            "submitCountYe": "",
                            "ocrErrorCountYe": "",
                            "plateErrorCountYe": "",
                            "repeatCountYe": "",
                            "queueCountYe": "",
                            "passCountYe": "",
                            "matchCountYe": "",
                            "matchRateYe": "",
                            "headimg":
                                "data:image/png;base64,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",
                            "recentDay": "",
                            "expire": 2,
                            "record": {
                              "userId": 179,
                              "submitCount": 11,
                              "ocrErrorCount": "",
                              "plateErrorCount": "",
                              "repeatCount": "",
                              "queueCount": "",
                              "passCount": "",
                              "matchCount": "",
                              "matchRate": "",
                              "submitCountYe": "",
                              "ocrErrorCountYe": "",
                              "plateErrorCountYe": "",
                              "repeatCountYe": "",
                              "queueCountYe": "",
                              "passCountYe": "",
                              "matchCountYe": "",
                              "matchRateYe": "",
                              "recentDay": "",
                              "createTime": "",
                              "updateTime": ""
                            }
                          };
                          UserInfo userInfo = UserInfo.fromJson(srcJson);
                          var res1 = ContentProvider.db
                              .addPostBatch([userInfo, userInfo]);

                          /// 存储用户数据
                          // Storage().setUserInfo(userInfo);
                          // httpResponse.data = userInfo;
                          // if (httpResponse.msg!.isNotEmpty) {
                          //   Fluttertoast.showToast(
                          //       msg: httpResponse.msg!,
                          //       toastLength: Toast.LENGTH_SHORT,
                          //       gravity: ToastGravity.CENTER,
                          //       timeInSecForIosWeb: 1,
                          //       backgroundColor: Colors.red,
                          //       textColor: Colors.white,
                          //       fontSize: 16);
                          // }
                          // }
                        },
                        style: counter.count == 0 ? btnActive : btnInActive,
                        child: Text(msg));
                  }),
              TextField(
                controller: textController,
                onSubmitted: (str) {
                  BlocProvider.of<TodoBloc>(context).add(AddItem(str));
                  textController.text = '';
                },
              ),
              BlocBuilder<TodoBloc, TodoState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView(
                        children: state.todoList
                            .map((item) => ListTile(
                                  leading: Text('${item.id}'),
                                  title: Text(item.value),
                                  trailing: IconButton(
                                      onPressed: () {
                                        BlocProvider.of<TodoBloc>(context)
                                            .add(RemoveItem(item.id));
                                      },
                                      icon: const Icon(Icons.delete)),
                                ))
                            .toList()),
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
              heroTag: 'increment',
              onPressed: () {
                BlocProvider.of<CountBloc>(context)
                    .add(CountActionsBloc.increment);
              },
              child: const Icon(Icons.add)),
          FloatingActionButton(
              heroTag: 'tincrement',
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Second()));
              },
              child: const Icon(Icons.search)),
          FloatingActionButton(
              heroTag: 'discrement',
              onPressed: () {
                BlocProvider.of<CountBloc>(context)
                    .add(CountActionsBloc.decrement);
              },
              child: const Icon(Icons.remove))
        ]));
  }
}

/// ***************************************************** scopedmodel start
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'flutter',
//       home: MyHomePage(title: 'app name'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   final String title;
//   const MyHomePage({required this.title, Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return ScopedModel<CountModel>(
//       model: getIt<CountModel>(),
//       child: ScopedModelDescendant<CountModel>(
//           builder: (context, child, model) => Scaffold(
//               appBar: AppBar(title: const Text('flutter')),
//               body: Center(
//                 child: Column(
//                   // model.count.toString()
//                   children: [
//                     Text(widget.title),
//                     Text(ScopedModel.of<CountModel>(context).count.toString())
//                   ],
//                 ),
//               ),
//               floatingActionButton:
//                   Column(mainAxisAlignment: MainAxisAlignment.end, children: [
//                 FloatingActionButton(
//                     heroTag: 'increment',
//                     onPressed: () {
//                       model.increment();
//                     },
//                     child: const Icon(Icons.add)),
//                 FloatingActionButton(
//                     heroTag: 'increment',
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => const Second()));
//                     },
//                     child: const Icon(Icons.search)),
//                 FloatingActionButton(
//                     heroTag: 'discrement',
//                     onPressed: () {
//                       model.discrement();
//                     },
//                     child: const Icon(Icons.remove))
//               ]))),
//     );
//   }
// }
/// ***************************************************** scopedmodel end

/// ***************************************************** redux start
// class MyApp extends StatelessWidget {
//   final store = Store(appReducers, initialState: AppState());
//   MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StoreProvider<AppState>(
//       store: store,
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const MyHomePage(title: 'Flutter Demo Home Page'),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector<AppState, ViewModel>(
//       builder: (context, viewModel) => Scaffold(
//           appBar: AppBar(
//             backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//             title: Text(widget.title),
//           ),
//           body: SizedBox(
//             height: MediaQuery.of(context).size.height,
//             child: Column(
//               children: <Widget>[
//                 Text(viewModel.count.toString()),
//                 TextField(
//                   controller: textController,
//                   onSubmitted: (str) {
//                     viewModel.addItem(textController.text);
//                     textController.text = '';
//                   },
//                 ),
//                 Expanded(
//                   child: ListView(
//                       children: viewModel.todoList
//                           .map(
//                             (item) => ListTile(
//                                 leading: Text(item.id.toString()),
//                                 title: Text(item.value),
//                                 trailing: IconButton(
//                                     onPressed: () {
//                                       // viewModel.clearItem();
//                                       Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   const Second()));
//                                       // viewModel.removeItem(item.id);
//                                     },
//                                     icon: const Icon(Icons.remove))),
//                           )
//                           .toList()),
//                 ),
//               ],
//             ),
//           ),
//           floatingActionButton: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               FloatingActionButton(
//                 heroTag: 'increment',
//                 onPressed: () {
//                   viewModel.increment();
//                 },
//                 child: const Icon(Icons.add),
//               ),
//               const SizedBox(height: 10),
//               FloatingActionButton(
//                 heroTag: 'discrement',
//                 onPressed: () {
//                   viewModel.discrement();
//                 },
//                 child: const Icon(Icons.remove),
//               )
//             ],
//           )),
//       converter: (store) => ViewModel.create(store),
//     );
//   }
// }
