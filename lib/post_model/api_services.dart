//5- create a file to handle the API call ....

import 'dart:convert';

import 'package:api_training/core/constants.dart';
import 'package:api_training/post_model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<PostModel>?> getPosts() async {
    // 1)parse Url
    // 2) get (data from Url) usin http package
    // 3) check statuscode (200 OK)
    // 4) parse body from string  to  json using jsonDecode() method
    // 5) parse List<Map> to List<Model> and return it;
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.postsEndPoint);
      var res = await http.get(url);
      if (res.statusCode == 200) {
        // ==200 means response OK

        List data = jsonDecode(res.body) as List;
        List<PostModel> posts = data.map((e) => PostModel.fromJson(e)).toList();
        return posts;

        // parsing
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
