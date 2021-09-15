import 'package:get/get.dart';

class Controller extends GetxController {
  RxList title = [].obs;

  void addTitle(title) {
    title.add(title);
  }

  RxList post = [].obs;

  void addPost(post) {
    post.add(post);
  }

  void addPostingImage(iamge) {
    postingImage.add(iamge);
  }

  RxList postingImage = [].obs;
}
