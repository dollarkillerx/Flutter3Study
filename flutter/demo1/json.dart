import 'dart:convert'; // json解析需要依賴

void main() {
  var mapData = {
    "name": "v1",
    "age": 20,
  };
  var strData = '{"name": "v2", "age": 20}';

  // MAP = > JSON
  print(json.encode(mapData));
  // JSON STR = > MAP
  print(json.decode(strData));
}