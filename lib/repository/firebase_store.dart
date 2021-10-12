import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebasePostingRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> uploadPostingImage(String? name, String? title,
      String? discription, String? id, File? image) {
    CollectionReference posting =
        FirebaseFirestore.instance.collection('posting');
    return posting.add({
      'name': name,
      'title': title,
      'discription': discription,
      'id': id,
      'image': image
    });
  }
}
