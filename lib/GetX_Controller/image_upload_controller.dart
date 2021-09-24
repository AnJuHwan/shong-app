import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

/* 
수정 해야 하는것 :
1. 경로가 깔끔하게 저장되지 않음 , 
2. 하드웨어 이미지 경로로 불러와야댐  ex) getDownloadURL
*/
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

  // Future<String> downloadURL(File file) async {
  //   try {
  //     String downloadURL = await firebase_storage.FirebaseStorage.instance
  //         .ref('posting/${currentUser!.uid}/$file')
  //         .getDownloadURL();
  //     print(downloadURL);
  //     return downloadURL;
  //   } catch (e) {
  //     print('faild');
  //   }
  //   return '';
  //   // Within your widgets:
  //   // Image.network(downloadURL);
  // }
}
