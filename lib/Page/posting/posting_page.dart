import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shong_app/GetX_Controller/getx_controller.dart';
import 'package:shong_app/Page/home/home.dart';

class PostingPage extends StatefulWidget {
  const PostingPage({Key? key}) : super(key: key);

  @override
  _PostingPageState createState() => _PostingPageState();
}

class _PostingPageState extends State<PostingPage> {
  String title = '';
  String posting = '';

  final double width = Get.width;
  Controller controller = Get.put(Controller());
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
                    Get.to(() => Home());
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
                      onPressed: () {},
                      child: Text('이미지 업로드'),
                    ),
                  ),
                  Divider(),
                  Container(
                    width: width * 0.5,
                    child: Center(
                      child: Image.asset('./images/test_1.png'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
