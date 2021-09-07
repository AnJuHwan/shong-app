import 'package:flutter/material.dart';

class HomeItem extends StatefulWidget {
  const HomeItem({Key? key}) : super(key: key);

  @override
  _HomeItemState createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Image.asset('./images/test_1.png'),
          ),
          Expanded(
              child: Container(
            child: Column(
              children: [
                Text('숑아사진 테스트 1 입니다.'),
                Row(
                  children: [
                    Icon(Icons.favorite),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
