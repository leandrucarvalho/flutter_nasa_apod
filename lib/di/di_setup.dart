import 'package:get_it/get_it.dart';

import '../services/apod_service.dart';
import '../stores/apod_store.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Verifique se já não está registrado antes de registrar
  if (!getIt.isRegistered<ApodService>()) {
    getIt.registerLazySingleton(() => ApodService());
  }

  if (!getIt.isRegistered<ApodStore>()) {
    getIt.registerLazySingleton(() => ApodStore());
  }
}
