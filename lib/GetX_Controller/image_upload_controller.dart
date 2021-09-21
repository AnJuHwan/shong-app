import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirebaseImageStore extends GetxController {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  var currentUser = FirebaseAuth.instance.currentUser;
  // currentUser!.uid

  Future<void> uploadImage(File file) async {
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('posting/${currentUser!.uid}')
          .child('$file')
          .putFile(file);
      print('저장');
    } catch (e) {
      // e.g, e.code == 'canceled'
      print('실패');
    }
    print(file);
  }
}
