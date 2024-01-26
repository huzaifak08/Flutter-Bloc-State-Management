import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_statemanagement/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;

        return body.map((e) {
          return PostModel.fromMap(e);
        }).toList();
      } else {
        return [];
      }
    } on SocketException {
      throw Exception('Error while fetching data');
    } on TimeoutException {
      throw Exception('Timeour exception occoured');
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
