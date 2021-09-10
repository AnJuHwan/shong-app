import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shong_app/Page/posting/posting_page.dart';
import 'package:shong_app/Widget/posting/posting_item.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
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
              PostingItem(),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: Container(
            padding: EdgeInsets.all(10),
            child: PopupMenuButton(
                offset: Offset(0, -65),
                child: Icon(Icons.add),
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => PostingPage());
                          },
                          child: Text('게시물 작성'),
                        ),
                      )
                    ]),
            decoration: BoxDecoration(
              color: Colors.blueGrey[200],
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        )
      ],
    );
  }
}
