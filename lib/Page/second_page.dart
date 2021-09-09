import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.pink[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () async {
                    String url = 'https://www.instagram.com/shongahh_/';
                    await launch(url);
                  },
                  child: Container(
                    width: 80,
                    height: 50,
                    child: Image.asset(
                      './images/shongstargram.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    String url =
                        'https://www.youtube.com/channel/UCF_R5sUdfi4msuMlhyfXaOw';
                    await launch(url);
                  },
                  child: Container(
                    width: 80,
                    height: 50,
                    child: SvgPicture.asset(
                      './images/shongtube.svg',
                      fit: BoxFit.contain,
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    String url = 'https://www.twitch.tv/caroline9071';
                    await launch(url);
                  },
                  child: Container(
                    width: 80,
                    height: 50,
                    child: SvgPicture.asset(
                      './images/shongtwitch.svg',
                      fit: BoxFit.contain,
                      height: 100,
                      color: Colors.purple,
                    ),
                  ),
                )
              ],
            ),
          ),
          Text('2번째')
        ],
      ),
    );
  }
}
