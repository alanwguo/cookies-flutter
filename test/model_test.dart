import 'package:flutter_test/flutter_test.dart';
import 'package:cookies_flutter/models/player.dart';
import 'package:cookies_flutter/serializers.dart';

void main() {
  test('Test Player model initialization, serialization, deserialization', () {
    final player = Player((b) => b
      ..entityUrn = PlayerUrn('1234')
      ..name = 'Alan'
      ..points = 5);

    final str = standardSerializers.serialize(player);
    print(str);

    final deserialized = standardSerializers.deserialize(str);
    expect(deserialized, player);
  });
}
