import 'dart:io';

class Upload {
  String? uid;
  String? name;
  String? title;
  String? discription;
  File? uploadImage;
  DateTime? createTime;

  Upload({
    this.uid,
    this.name,
    this.title,
    this.discription,
    this.uploadImage,
    this.createTime,
  });
}
