import 'dart:convert';

import 'package:moor/moor.dart';

class ListColumnConverter extends TypeConverter<List<String>, String> {
  const ListColumnConverter();
  @override
  List<String> mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }

    List<String> stringList =
        (jsonDecode(fromDb) as List<dynamic>).cast<String>();

    return stringList;
  }

  @override
  String mapToSql(List<String> value) {
    if (value == null) {
      return null;
    }

    return jsonEncode(value);
  }
}
