import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:scoped_model/scoped_model.dart';
// import 'package:xianyu/model/count_model.dart';

import '../bloc/count/count_bloc.dart';
// import '../entity_class/get_it.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:xianyu/store/state.dart';
// import 'package:xianyu/widgets/view_model.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountBloc, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('second'),
          ),
          body: Center(
              child: Column(
            children: [Text('$state')],
          )),
        );
      },
    );
  }
}




// class Second extends StatelessWidget {
//   const Second({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScopedModel<CountModel>(
//       model: getIt<CountModel>(),
//       child: ScopedModelDescendant<CountModel>(
//         builder: (context, child, model) => Scaffold(
//           appBar: AppBar(
//             title: const Text('second'),
//           ),
//           body: Center(
//               child: Column(
//             children: [
//               Text(ScopedModel.of<CountModel>(context).count.toString())
//             ],
//           )),
//         ),
//       ),
//     );
//   }
// }




// class Second extends StatelessWidget {
//   const Second({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector<AppState, ViewModel>(
//         builder: (context, viewModel) => Scaffold(
//               body: Center(
//                 child: Text(viewModel.count.toString()),
//               ),
//               floatingActionButton: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   FloatingActionButton(
//                     heroTag: 'sincrement',
//                     onPressed: () {
//                       viewModel.increment();
//                     },
//                     child: const Icon(Icons.add),
//                   ),
//                   const SizedBox(height: 10),
//                   FloatingActionButton(
//                     heroTag: 'sdiscrement',
//                     onPressed: () {
//                       viewModel.discrement();
//                     },
//                     child: const Icon(Icons.remove),
//                   )
//                 ],
//               ),
//             ),
//         converter: (store) => ViewModel.create(store));
//   }
// }
