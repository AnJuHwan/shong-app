import 'package:get/get.dart';

class Controller extends GetxController {
  RxList<dynamic> title = [].obs;

  void addTitle(title) {
    title.add(title);
  }
}
