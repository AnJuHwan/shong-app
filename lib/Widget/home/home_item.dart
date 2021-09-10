import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeItem extends StatefulWidget {
  const HomeItem({Key? key}) : super(key: key);

  @override
  _HomeItemState createState() => _HomeItemState();
}

final double width = Get.width;
final double height = Get.height;

class _HomeItemState extends State<HomeItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.70,
      child: ListView.separated(
          itemBuilder: (_, index) => item(),
          separatorBuilder: (_, index) => Divider(),
          itemCount: 5),
    );
  }
}

Widget item() {
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
        Container(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(''), //요기 텍스트 받아와야댐
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.favorite),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
