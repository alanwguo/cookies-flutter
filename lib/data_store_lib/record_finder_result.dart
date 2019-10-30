part of 'store.dart';

class RecordFinderResult<UrnType extends Urn, Model extends Record<UrnType>> {
  /// Record cache to lookup cached records
  _InternalCache<UrnType, Model> _internalCache;

  BehaviorSubject<ValueObservable<Iterable<Model>>> _recordsSubject;
  StreamSubscription<Iterable<Model>> _recordsSubjectSubscription;

  /// Urns that are part of this finder result
  List<UrnType> urns;

  RecordFinderResult(this._internalCache, this.urns);

  void updateUrns(List<UrnType> newUrnsToFind) {
    if (newUrnsToFind != urns) {
      urns = newUrnsToFind;
      _updateRecordsSubject();
    }
  }

  Stream<Iterable<Model>> peek() {
    if (_recordsSubject == null) {
      final subjects = urns.map((urn) => _internalCache.get(urn));
      if (subjects.isNotEmpty) {
        _recordsSubjectSubscription?.cancel();
        final combinedObservable =
            Observable.combineLatestList(subjects).publishValue();
        _recordsSubject = BehaviorSubject.seeded(combinedObservable);
        _recordsSubjectSubscription = combinedObservable.connect();
      } else {
        _recordsSubject = BehaviorSubject.seeded(BehaviorSubject.seeded([]));
      }
    }
    return _recordsSubject.flatMap((stream) => stream);
  }

  void _updateRecordsSubject() {
    _recordsSubjectSubscription?.cancel();
    final subjects = urns.map((urn) => _internalCache.get(urn));
    final combinedObservable =
        Observable.combineLatestList(subjects).publishValue();
    _recordsSubject?.add(combinedObservable);
    _recordsSubjectSubscription = combinedObservable.connect();
  }
}
