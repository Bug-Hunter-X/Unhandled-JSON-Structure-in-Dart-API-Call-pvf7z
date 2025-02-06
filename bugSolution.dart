```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      if (jsonData is List) {
        for (var item in jsonData) {
          if (item is Map && item.containsKey('name')) {
            print(item['name']);
          } else {
            print('Unexpected JSON structure in list item: $item');
          }
        }
      } else if (jsonData is Map) {
        //Handle the case where jsonData is a single map
        print(jsonData['name'] ?? 'Name not found');
      } else {
        print('Unexpected JSON structure: $jsonData');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```