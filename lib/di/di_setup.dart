import 'package:get_it/get_it.dart';

import '../stores/apod_store.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => ApodStore());
}
