import 'package:envo_mobile/modules/auth_module/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/posts.dart';
import '../../repositories/post_repository.dart';

class PostsController extends GetxController {
  static PostsController to = Get.find<PostsController>();
  PageController pageController = PageController(viewportFraction: 0.75);
  Rxn<List<Post>> posts = Rxn([]);
  Rxn<bool> loading = Rxn(false);
  PostRepository postRepository =
      PostRepository(AuthController.to.authRepository);
  @override
  void onInit() {
    getPosts();
  }

  getPosts() async {
    try {
      loading.value = true;
      posts.value = await postRepository.getAllPosts();
      loading.value = false;
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  likePost(Post post) async {
    try {
      await postRepository.like(post);
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  unLikePost(Post post) async {
    try {
      await postRepository.unLike(post);
    } catch (e) {
      showSnackBar(e.toString());
    }
  }
}
