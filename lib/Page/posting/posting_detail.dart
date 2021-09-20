import 'package:carousel_slider/carousel_slider.dart';
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
                child: CarouselSlider(
                    items: controller.postingImage.map((image) {
                      return Container(
                        width: width * 0.75,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                    )),
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
