import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shong_app/GetX_Controller/auth_controller.dart';

import 'package:shong_app/Page/posting/posting_detail.dart';

class PostingItem extends StatefulWidget {
  const PostingItem({Key? key}) : super(key: key);

  @override
  _PostingItemState createState() => _PostingItemState();
}

final double width = Get.width;
final double height = Get.height;

class _PostingItemState extends State<PostingItem> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: Container(
        height: height * 0.70,
        child: ListView.separated(
          itemCount: 0,
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
              Container(
                constraints: BoxConstraints(maxWidth: 200),
                height: height,
                child: Image.asset(
                  './images/test_1.png',
                  fit: BoxFit.cover,
                ),
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
                          Text('임시1'),
                          IconButton(
                            onPressed: () {},
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
