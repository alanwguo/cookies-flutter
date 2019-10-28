import 'package:built_value/serializer.dart';
import 'package:cookies_flutter/urn-lib/urn.dart';

abstract class UrnSerializer<T extends Urn> implements PrimitiveSerializer<T> {
  @override
  T deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return urnFromStringFactory(serialized as String);
  }

  @override
  Object serialize(Serializers serializers, T object,
      {FullType specifiedType = FullType.unspecified}) {
    return object.toString();
  }

  T urnFromStringFactory(String str);
}
