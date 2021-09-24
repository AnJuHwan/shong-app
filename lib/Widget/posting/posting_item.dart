import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shong_app/GetX_Controller/getx_controller.dart';
import 'package:shong_app/Page/posting/posting_detail.dart';

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
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          Get.put(Controller()).title.length;
        });
      },
      child: Container(
        height: height * 0.70,
        child: ListView.separated(
          itemCount: Get.put(Controller()).title.length,
          itemBuilder: (_, index) => item(index: index),
          separatorBuilder: (_, index) => Divider(),
        ),
      ),
    );
  }

  Widget item({required int index}) {
    return GestureDetector(
      onTap: () {
        Get.to(() => PostingDetail(index: index));
      },
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: width,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 이미지 사진
              Container(
                constraints: BoxConstraints(maxWidth: 200),
                height: height,
                // child: Image.file(
                //   _controller.postingImage[0],
                //   fit: BoxFit.cover,
                // ),
              ),
              ////
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${_controller.title.reversed.toList()[index]}'),
                          IconButton(
                            onPressed: () {
                              _controller.title.remove(
                                  _controller.title.reversed.toList()[index]);
                              setState(() {
                                _controller.title.length;
                              });
                            },
                            icon: Icon(Icons.delete),
                          )
                        ],
                      ),
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
        ),
      ),
    );
  }
}
