import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shong_app/GetX_Controller/getx_controller.dart';

class PostingItem extends StatefulWidget {
  const PostingItem({Key? key}) : super(key: key);

  @override
  _PostingItemState createState() => _PostingItemState();
}

final double width = Get.width;
final double height = Get.height;
Controller _controller = Get.put(Controller());

class _PostingItemState extends State<PostingItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.70,
      child: ListView.separated(
          itemBuilder: (_, index) => item(index: index),
          separatorBuilder: (_, index) => Divider(),
          itemCount: Get.put(Controller()).title.length),
    );
  }

  Widget item({required int index}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: width,
      height: 100,
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Image.asset(
              './images/test_1.png',
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Text('${_controller.title[index]}')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.favorite),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
