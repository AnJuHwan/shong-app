import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shong_app/Page/home.dart';
import 'package:shong_app/Page/home_page.dart';
import 'package:shong_app/Widget/home_item.dart';

class PostingPage extends StatefulWidget {
  const PostingPage({Key? key}) : super(key: key);

  @override
  _PostingPageState createState() => _PostingPageState();
}

class _PostingPageState extends State<PostingPage> {
  String title = '';
  String posting = '';

  final double width = Get.width;
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
                onTap: () {},
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 30,
                    width: 50,
                    child: Center(
                      child: Text(
                        '완료',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Container(
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
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 0.1),
                    ),
                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
