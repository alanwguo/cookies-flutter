part of 'store.dart';

class _InternalCache<K, V> {
  final Map<K, BehaviorSubject<V>> _cache = HashMap();

  _InternalCache();

  Iterable<K> get keys => _cache.keys;

  Iterable<BehaviorSubject<V>> get values => _cache.values;

  BehaviorSubject<V> get(K key) {
    return _cache[key];
  }

  bool containsKey(K key) => _cache.containsKey(key);

  void put(K key, V obj) {
    if (!_cache.containsKey(key)) {
      _cache[key] = BehaviorSubject.seeded(obj);
    } else {
      _cache[key].add(obj);
    }
  }

  void dispose(K key) {
    _cache[key]?.close();
  }
}
