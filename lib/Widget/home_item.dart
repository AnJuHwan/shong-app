import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeItem extends StatefulWidget {
  final String text;
  const HomeItem({Key? key, required this.text}) : super(key: key);

  @override
  _HomeItemState createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  @override
  Widget build(BuildContext context) {
    final double width = Get.width;
    final double height = Get.height;
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
                  Text(widget.text),
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
