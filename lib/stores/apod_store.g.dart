// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apod_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApodStore on ApodStoreBase, Store {
  late final _$apodFutureAtom =
      Atom(name: 'ApodStoreBase.apodFuture', context: context);

  @override
  ObservableFuture<List<ApodImageModel>>? get apodFuture {
    _$apodFutureAtom.reportRead();
    return super.apodFuture;
  }

  @override
  set apodFuture(ObservableFuture<List<ApodImageModel>>? value) {
    _$apodFutureAtom.reportWrite(value, super.apodFuture, () {
      super.apodFuture = value;
    });
  }

  late final _$isPlayingAtom =
      Atom(name: 'ApodStoreBase.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$fetchApodAsyncAction =
      AsyncAction('ApodStoreBase.fetchApod', context: context);

  @override
  Future<void> fetchApod(ApodPaginationModel pagination) {
    return _$fetchApodAsyncAction.run(() => super.fetchApod(pagination));
  }

  late final _$ApodStoreBaseActionController =
      ActionController(name: 'ApodStoreBase', context: context);

  @override
  void setPlaying(bool value) {
    final _$actionInfo = _$ApodStoreBaseActionController.startAction(
        name: 'ApodStoreBase.setPlaying');
    try {
      return super.setPlaying(value);
    } finally {
      _$ApodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
apodFuture: ${apodFuture},
isPlaying: ${isPlaying}
    ''';
  }
}
