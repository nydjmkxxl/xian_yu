import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
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
                            print('正在获取验证码时再次点击无效');
                            return;
                          }
                          counter.start();
                          var res = await DioHttp()
                              .get('crm/user/queryUserInfo', {'userId': 179});

                          Map<String, dynamic> data = res.data;
                          HttpResponse httpResponse =
                              HttpResponse.fromJson(data);
                          if (res.statusCode != 200) {
                            counter.clearTime();
                          } else {
                            UserInfo userInfo = UserInfo.fromJson(data['data']);

                            /// 存储用户数据
                            Storage().setUserInfo(userInfo);
                            httpResponse.data = userInfo;
                            if (httpResponse.msg!.isNotEmpty) {
                              Fluttertoast.showToast(
                                  msg: httpResponse.msg!,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16);
                            }
                          }
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
