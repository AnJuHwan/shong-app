import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shong_app/GetX_Controller/getx_controller.dart';

class PostingDetail extends StatefulWidget {
  final int index;
  const PostingDetail({Key? key, required this.index}) : super(key: key);

  @override
  _PostingDetailState createState() => _PostingDetailState();
}

class _PostingDetailState extends State<PostingDetail> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    final double width = Get.width;
    final double height = Get.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.5,
          title: Text('게시글', style: TextStyle(color: Colors.black54)),
        ),
        body: Container(
          width: width,
          height: height,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: width,
                height: height * 0.4,
                color: Colors.blueGrey[100],
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: width * 0.8,
                        height: height * 0.3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            './images/test_1.png',
                            fit: BoxFit.fill,
                          ),
                        ), // 이미지가 있으면 이미지 , 없으면 아이콘으로 후에 바꿀 것
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blueGrey[200],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: width,
                height: height * 0.1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('제목'),
                    SizedBox(
                      height: 2,
                    ),
                    Obx(
                      () => Text(
                        '${controller.title.reversed.toList()[widget.index]}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: width,
                  child: Text(
                    '${controller.post.reversed.toList()[widget.index]}',
                    textAlign: TextAlign.start,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
