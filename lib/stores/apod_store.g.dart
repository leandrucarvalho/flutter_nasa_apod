// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apod_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApodStore on ApodStoreBase, Store {
  late final _$apodListAtom =
      Atom(name: 'ApodStoreBase.apodList', context: context);

  @override
  ObservableList<ApodImageModel> get apodList {
    _$apodListAtom.reportRead();
    return super.apodList;
  }

  @override
  set apodList(ObservableList<ApodImageModel> value) {
    _$apodListAtom.reportWrite(value, super.apodList, () {
      super.apodList = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: 'ApodStoreBase.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$fetchApodAsyncAction =
      AsyncAction('ApodStoreBase.fetchApod', context: context);

  @override
  Future<void> fetchApod(ApodPaginationModel pagination) {
    return _$fetchApodAsyncAction.run(() => super.fetchApod(pagination));
  }

  late final _$fetchMoreApodAsyncAction =
      AsyncAction('ApodStoreBase.fetchMoreApod', context: context);

  @override
  Future<void> fetchMoreApod() {
    return _$fetchMoreApodAsyncAction.run(() => super.fetchMoreApod());
  }

  @override
  String toString() {
    return '''
apodList: ${apodList},
currentPage: ${currentPage}
    ''';
  }
}
