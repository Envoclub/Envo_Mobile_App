import 'dart:convert';
import 'dart:developer';

import 'package:envo_mobile/models/posts.dart';

import '../utils/meta_strings.dart';
import 'auth_repository.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  AuthRepository authRepository;
  PostRepository(this.authRepository);

  Future<List<Post>> getAllPosts() async {
    try {
      var headers = {
        "Authorization": "Token " + authRepository.accessToken!,
        "Content-type": "application/json"
      };
      log(headers.toString());
      try {
        String url = MetaStrings.baseUrl + MetaStrings.getPosts;
        log(url);

        var response = await http.get(Uri.parse(url), headers: headers);

        if (response.statusCode == 200) {
          return [];
        } else {
          throw jsonDecode(response.body)["detail"];
        }
      } catch (e) {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  like(Post post) async {
    try {
      var headers = {
        "Authorization": "Token " + authRepository.accessToken!,
        "Content-type": "application/json"
      };
      var params = {"pk": post.id};
      log(headers.toString());
      try {
        String url = MetaStrings.baseUrl + MetaStrings.likePost;
        log(url);

        var response = await http.post(Uri.parse(url),
            headers: headers, body: jsonEncode(params));
        log(response.body);
        if (response.statusCode == 200) {
          return true;
        } else {
          throw jsonDecode(response.body)["detail"];
        }
      } catch (e) {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  unLike(Post post) async {
    try {
      var headers = {
        "Authorization": "Token " + authRepository.accessToken!,
        "Content-type": "application/json"
      };
      var params = {"pk": post.id};
      log(headers.toString());
      try {
        String url = MetaStrings.baseUrl + MetaStrings.unLikePost;
        log(url);

        var response = await http.post(Uri.parse(url),
            headers: headers, body: jsonEncode(params));
        log(response.body);
        if (response.statusCode == 200) {
          return true;
        } else {
          throw jsonDecode(response.body)["detail"];
        }
      } catch (e) {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  createPost(Post post) async {
    try {
      var headers = {
        "Authorization": "Token " + authRepository.accessToken!,
        "Content-type": "application/json"
      };
      var params = post;
      log(headers.toString());
      try {
        String url = MetaStrings.baseUrl + MetaStrings.getPosts;
        log(url);

        var response = await http.post(Uri.parse(url),
            headers: headers, body: jsonEncode(params));
        log(response.body);
        if (response.statusCode == 200) {
          return true;
        } else {
          throw jsonDecode(response.body)["detail"];
        }
      } catch (e) {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }
}
