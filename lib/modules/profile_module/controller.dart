import 'package:get/get.dart';

import '../../models/posts.dart';
import '../../repositories/post_repository.dart';
import '../../utils/helper_widgets.dart';
import '../home/controller.dart';

class ProfileController extends GetxController{
static ProfileController to=Get.find<ProfileController>(); Rxn<List<Post>> posts = Rxn([]);
  Rxn<bool> loading = Rxn(false);
  PostRepository postRepository = HomeController.to.postRepository;
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
}