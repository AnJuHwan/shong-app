import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shong_app/Page/posting_page.dart';
import 'package:shong_app/Widget/home_item.dart';
import 'package:url_launcher/url_launcher.dart';

List<Widget> items = [];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

final double width = Get.width;
final double height = Get.height;

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List page = [HomePage(), SecondPage(), ThirdPage()];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          title: Text('숑앱', style: TextStyle(color: Colors.black54)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          backgroundColor: Colors.red[50],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.speaker_notes),
              label: '자유게시판',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '프로필',
            )
          ],
        ),
        drawer: Drawer(
          child: Text('hello'),
        ),
        body: page[_currentIndex],
      ),
    );
  }
}

Widget HomePage() {
  return Stack(
    children: [
      Container(
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
            Column(
              children: items.map((e) => e).toList(),
              //게시글 아이템 들어갈 자리
            )
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

Widget SecondPage() {
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

Widget ThirdPage() {
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
        Text('3번째')
      ],
    ),
  );
}

Widget PostingButton() {
  return Container(
    child: Text('게시물 작성하기'),
    color: Colors.red,
  );
}
