// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Player> _$playerSerializer = new _$PlayerSerializer();
Serializer<PlayerInput> _$playerInputSerializer = new _$PlayerInputSerializer();

class _$PlayerSerializer implements StructuredSerializer<Player> {
  @override
  final Iterable<Type> types = const [Player, _$Player];
  @override
  final String wireName = 'Player';

  @override
  Iterable<Object> serialize(Serializers serializers, Player object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'entityUrn',
      serializers.serialize(object.entityUrn,
          specifiedType: const FullType(PlayerUrn)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'points',
      serializers.serialize(object.points, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Player deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlayerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'entityUrn':
          result.entityUrn = serializers.deserialize(value,
              specifiedType: const FullType(PlayerUrn)) as PlayerUrn;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'points':
          result.points = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PlayerInputSerializer implements StructuredSerializer<PlayerInput> {
  @override
  final Iterable<Type> types = const [PlayerInput, _$PlayerInput];
  @override
  final String wireName = 'PlayerInput';

  @override
  Iterable<Object> serialize(Serializers serializers, PlayerInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    if (object.points != null) {
      result
        ..add('points')
        ..add(serializers.serialize(object.points,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  PlayerInput deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlayerInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'points':
          result.points = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Player extends Player {
  @override
  final PlayerUrn entityUrn;
  @override
  final String name;
  @override
  final int points;

  factory _$Player([void Function(PlayerBuilder) updates]) =>
      (new PlayerBuilder()..update(updates)).build();

  _$Player._({this.entityUrn, this.name, this.points}) : super._() {
    if (entityUrn == null) {
      throw new BuiltValueNullFieldError('Player', 'entityUrn');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Player', 'name');
    }
    if (points == null) {
      throw new BuiltValueNullFieldError('Player', 'points');
    }
  }

  @override
  Player rebuild(void Function(PlayerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlayerBuilder toBuilder() => new PlayerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Player &&
        entityUrn == other.entityUrn &&
        name == other.name &&
        points == other.points;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, entityUrn.hashCode), name.hashCode), points.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Player')
          ..add('entityUrn', entityUrn)
          ..add('name', name)
          ..add('points', points))
        .toString();
  }
}

class PlayerBuilder implements Builder<Player, PlayerBuilder> {
  _$Player _$v;

  PlayerUrn _entityUrn;
  PlayerUrn get entityUrn => _$this._entityUrn;
  set entityUrn(PlayerUrn entityUrn) => _$this._entityUrn = entityUrn;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _points;
  int get points => _$this._points;
  set points(int points) => _$this._points = points;

  PlayerBuilder();

  PlayerBuilder get _$this {
    if (_$v != null) {
      _entityUrn = _$v.entityUrn;
      _name = _$v.name;
      _points = _$v.points;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Player other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Player;
  }

  @override
  void update(void Function(PlayerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Player build() {
    final _$result =
        _$v ?? new _$Player._(entityUrn: entityUrn, name: name, points: points);
    replace(_$result);
    return _$result;
  }
}

class _$PlayerInput extends PlayerInput {
  @override
  final String name;
  @override
  final int points;

  factory _$PlayerInput([void Function(PlayerInputBuilder) updates]) =>
      (new PlayerInputBuilder()..update(updates)).build();

  _$PlayerInput._({this.name, this.points}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('PlayerInput', 'name');
    }
  }

  @override
  PlayerInput rebuild(void Function(PlayerInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlayerInputBuilder toBuilder() => new PlayerInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlayerInput && name == other.name && points == other.points;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), points.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PlayerInput')
          ..add('name', name)
          ..add('points', points))
        .toString();
  }
}

class PlayerInputBuilder implements Builder<PlayerInput, PlayerInputBuilder> {
  _$PlayerInput _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _points;
  int get points => _$this._points;
  set points(int points) => _$this._points = points;

  PlayerInputBuilder();

  PlayerInputBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _points = _$v.points;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlayerInput other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PlayerInput;
  }

  @override
  void update(void Function(PlayerInputBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PlayerInput build() {
    final _$result = _$v ?? new _$PlayerInput._(name: name, points: points);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
