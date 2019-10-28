import 'package:flutter/foundation.dart';

@immutable
abstract class Urn {
  String get namespace;
  String get type;
  String get id;

  String toString() => "urn:$namespace:$type:$id";

  const Urn();

  static String parseUrnStr(
      String str, String expectedNamespace, String expectedType) {
    final parts = str.split(':');
    if (parts.length != 4) {
      throw InvalidUrnSyntaxException(
          'String does not have the right number of sections.');
    } else if (parts[0] != 'urn') {
      throw InvalidUrnSyntaxException('String does not begin with "urn"');
    } else if (parts[1] != expectedNamespace) {
      throw InvalidUrnSyntaxException(
          'String has namespace "${parts[1]}" when the expected namespace is "$expectedNamespace"');
    } else if (parts[2] != expectedType) {
      throw InvalidUrnSyntaxException(
          'String has type "${parts[2]}" when the expected type is "$expectedType"');
    }
    return parts[3];
  }

  bool operator ==(o) =>
      o is Urn && o.namespace == namespace && o.type == type && o.id == id;

  int get hashCode => namespace.hashCode ^ type.hashCode ^ id.hashCode;
}

class InvalidUrnSyntaxException implements Exception {
  final String message;

  const InvalidUrnSyntaxException(this.message);
}
