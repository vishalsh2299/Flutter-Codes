import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> getHotNews() async {
  var url =
      "http://newsapi.org/v2/everything?q=apple&from=2020-10-07&to=2020-10-07&sortBy=popularity&apiKey=d133e08b3e5d4d768c3a3a4164c783f4";
  final response = await http.get(url);
  final statusCode = response.statusCode;

  if (statusCode < 200 || statusCode >= 300 || response.body == null) {
    print("Error $statusCode");
    return null;
  } else {
    // print("${response.body}");
    var storiesList = jsonDecode(response.body);
    List data = storiesList['articles'];
    return data;
  }
}
