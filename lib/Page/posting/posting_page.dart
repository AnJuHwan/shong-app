import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shong_app/GetX_Controller/getx_controller.dart';
import 'package:shong_app/Page/home/home.dart';

class PostingPage extends StatefulWidget {
  const PostingPage({Key? key}) : super(key: key);

  @override
  _PostingPageState createState() => _PostingPageState();
}

class _PostingPageState extends State<PostingPage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> imageItems = [];

  String title = '';
  String posting = '';
  var getIndex;

  final double width = Get.width;
  Controller controller = Get.put(Controller());

  void selectImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    try {
      if (selectedImages!.isNotEmpty) {
        setState(() {
          imageItems.addAll(selectedImages);
        });
      } else {}
    } catch (e) {
      print(e);
    }
    print('image List length : ${imageItems.length.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.5,
            title: Text(
              '게시글 작성',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  posting.length != 0 ? posting : '';
                  if (title.length == 0) {
                    return;
                  } else {
                    controller.title.add(title);
                    controller.post.add(posting);
                    for (int i = 0; i < imageItems.length; i++) {
                      controller.postingImage.add(File(imageItems[i].path));
                    }

                    Get.off(() => Home());
                  }
                },
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color:
                          title.length == 0 ? Colors.grey[300] : Colors.amber,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 30,
                    width: 50,
                    child: Center(
                      child: Text(
                        '완료',
                        style: TextStyle(
                          fontSize: 14,
                          color: title.length == 0
                              ? Colors.black.withOpacity(0.2)
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 0.1),
                      ),
                    ),
                    padding: EdgeInsets.only(left: 5),
                    child: TextField(
                      onChanged: (text) {
                        setState(() {
                          title = text;
                        });
                      },
                      maxLength: 30,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '제목을 입력해주세요',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: TextField(
                      onChanged: (text) {
                        setState(() {
                          posting = text;
                        });
                      },
                      maxLength: 400,
                      maxLines: 15,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '게시글을 작성해주세요',
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        selectImages();
                      },
                      child: Text('이미지 업로드'),
                    ),
                  ),
                  Divider(),
                  imageItems.length != 0
                      ? Container(
                          width: width,
                          height: height * 0.3,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: imageItems.length,
                              itemBuilder: (context, index) {
                                getIndex = index;
                                return Container(
                                  // width: 200,
                                  constraints: BoxConstraints(
                                    minWidth: 100,
                                    maxWidth: 300,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      File(imageItems[index].path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
