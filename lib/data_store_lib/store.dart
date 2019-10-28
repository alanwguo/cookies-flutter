import 'dart:async';
import 'dart:collection';

import 'package:rxdart/rxdart.dart';

import '../urn-lib/urn.dart';
import 'record.dart';

part 'internal_cache.dart';

class Store<UrnType extends Urn, Model extends Record<UrnType>> {
  final _internalCache = _InternalCache<UrnType, Model>();
  BehaviorSubject<ValueObservable<Iterable<Model>>> _getAllSubject;
  StreamSubscription<Iterable<Model>> _getAllSubjectSubscription;

  Store();

  Stream<Iterable<Model>> peekAll() {
    if (_getAllSubject == null) {
      final subjects = _internalCache.values;
      if (subjects.isNotEmpty) {
        _getAllSubjectSubscription?.cancel();
        final combinedObservable =
            Observable.combineLatestList(_internalCache.values).publishValue();
        _getAllSubject = BehaviorSubject.seeded(combinedObservable);
        _getAllSubjectSubscription = combinedObservable.connect();
      } else {
        _getAllSubject = BehaviorSubject.seeded(BehaviorSubject.seeded([]));
      }
    }
    return _getAllSubject.flatMap((stream) => stream);
  }

  Stream<Model> peekRecord(Urn entityUrn) =>
      _internalCache.get(entityUrn).stream;

  void addRecord(Model model) {
    final containsKey = _internalCache.containsKey(model.entityUrn);
    _internalCache.put(model.entityUrn, model);
    if (!containsKey) {
      _getAllSubjectSubscription?.cancel();
      final combinedObservable =
          Observable.combineLatestList(_internalCache.values).publishValue();
      _getAllSubject?.add(combinedObservable);
      _getAllSubjectSubscription = combinedObservable.connect();
    }
  }
}
