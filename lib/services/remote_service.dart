import 'package:flutter_app/models/users.dart';
import 'package:flutter_app/models/products.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  String baseApi = 'https://newsapi.org/v2/top-headlines?';
  static const String apiKey = '58b98b48d2c74d9c94dd5dc296ccf7b6';

  Future<List<Product>> getProducts() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return productsFromJson(json);
    }
  }

  Future<User> getUser() async {
    var client = http.Client();

    var uri = Uri.parse(baseApi + '/users');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    }
  }
}
