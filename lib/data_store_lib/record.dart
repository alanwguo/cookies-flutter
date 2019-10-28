import 'package:cookies_flutter/urn-lib/urn.dart';

abstract class Record<UrnType extends Urn> {
  UrnType get entityUrn;
}
