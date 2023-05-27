import 'dart:convert';

import 'package:bloc_statemanagement/Bloc/API%20Handling/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  List<PostModel> postList = [];

  Future<List<PostModel>> fetchPost() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      postList.clear();
      for (Map<String, dynamic> i in data) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }
}
