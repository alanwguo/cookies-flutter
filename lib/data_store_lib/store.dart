import 'dart:async';
import 'dart:collection';

import 'package:rxdart/rxdart.dart';

import '../urn-lib/urn.dart';
import 'record.dart';

part 'internal_cache.dart';
part 'record_finder_result.dart';

/// Class that allows you to create, add, and retrieve models
class Store<UrnType extends Urn, Model extends Record<UrnType>> {
  final _internalCache = _InternalCache<UrnType, Model>();
  RecordFinderResult<UrnType, Model> _getAllFinder;

  Store() {
    _getAllFinder = RecordFinderResult(_internalCache, []);
  }

  Stream<Iterable<Model>> peekAll() => _getAllFinder.peek();

  Stream<Model> peekRecord(UrnType entityUrn) =>
      _internalCache.get(entityUrn).stream;

  void addRecord(Model model) {
    final containsKey = _internalCache.containsKey(model.entityUrn);
    _internalCache.put(model.entityUrn, model);
    if (!containsKey) {
      _getAllFinder.updateUrns(_getAllFinder.urns..add(model.entityUrn));
    }
  }
}
