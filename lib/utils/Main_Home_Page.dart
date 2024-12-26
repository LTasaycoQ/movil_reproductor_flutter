import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/DescargaVideo.dart';
import 'package:flutter_application_1/pages/Home.dart';

class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _pageIndex = 0;
  final List<Widget> _tabList = [
    HomePage(),
    DescargaPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _tabList.elementAt(_pageIndex),
          if (_pageIndex != 3)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Color.fromARGB(255, 26, 26, 26),
                    selectedItemColor: Color.fromARGB(255, 255, 0, 98),
                    unselectedItemColor: Color.fromARGB(255, 247, 247, 247),
                    showSelectedLabels: true,
                    showUnselectedLabels: false,
                    currentIndex: _pageIndex,
                    onTap: (int index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined),
                        label: "Home",
                        backgroundColor: const Color.fromARGB(255, 24, 24, 24),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.downloading_rounded),
                        label: "Download",
                        backgroundColor: const Color.fromARGB(255, 24, 24, 24),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
