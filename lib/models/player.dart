import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cookies_flutter/data_store_lib/record.dart';

import '../serializers.dart';
import '../urn-lib/urn.dart';
import '../urn-lib/urn_serializer.dart';

part 'player.g.dart';

abstract class Player
    implements Built<Player, PlayerBuilder>, Record<PlayerUrn> {
  // Fields
  PlayerUrn get entityUrn;
  String get name;
  int get points;

  Player._();

  factory Player([void Function(PlayerBuilder) updates]) = _$Player;

  String toJson() {
    return json.encode(serializers.serializeWith(Player.serializer, this));
  }

  static Player fromJson(String jsonString) {
    return serializers.deserializeWith(
        Player.serializer, json.decode(jsonString));
  }

  static Serializer<Player> get serializer => _$playerSerializer;
}

class PlayerUrn extends Urn {
  static const kNamespace = 'aguo';
  static const kType = 'player';
  final namespace = kNamespace;
  final type = kType;
  final String id;

  const PlayerUrn(this.id);

  factory PlayerUrn.parseFromString(String str) {
    final id = Urn.parseUrnStr(str, kNamespace, kType);
    return PlayerUrn(id);
  }
}

class PlayerUrnSerializer extends UrnSerializer<PlayerUrn> {
  @override
  Iterable<Type> get types => [PlayerUrn];

  @override
  PlayerUrn urnFromStringFactory(str) => PlayerUrn.parseFromString(str);

  @override
  String get wireName => 'PlayerUrn';
}
