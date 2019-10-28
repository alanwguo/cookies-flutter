import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'models/models.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Player,
  PlayerUrn,
])
Serializers serializers =
    (_$serializers.toBuilder()..add(PlayerUrnSerializer())).build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
