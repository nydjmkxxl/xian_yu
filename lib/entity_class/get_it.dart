import 'package:get_it/get_it.dart';
import 'package:xianyu/model/count_model.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerLazySingleton<CountModel>(() => CountModel());
}
