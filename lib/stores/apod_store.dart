import 'package:flutter_nasa_apod/models/apod_pagination_model.dart';
import 'package:mobx/mobx.dart';

import '../models/apod_image_model.dart';
import '../services/apod_service.dart';

part 'apod_store.g.dart';

class ApodStore = ApodStoreBase with _$ApodStore;

abstract class ApodStoreBase with Store {
  final ApodService _apodService = ApodService();

  @observable
  ObservableFuture<List<ApodImageModel>>? apodFuture;

  @action
  Future<void> fetchApod(ApodPaginationModel pagination) async {
    final limitedPagination = ApodPaginationModel(
      startDate: pagination.startDate,
      endDate: pagination.endDate,
      count: pagination.count ?? 10,
    );
    apodFuture = ObservableFuture(_apodService.fetchApods(limitedPagination));
  }
}
