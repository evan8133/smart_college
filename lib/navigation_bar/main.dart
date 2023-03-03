import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

//main app that calls the runApp.
void main() {
  runApp(AnimatedBottomBar());
}

class AnimatedBottomBar extends StatefulWidget {
  AnimatedBottomBar({Key? key}) : super(key: key);

  @override
  State<AnimatedBottomBar> createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  List<IconData> iconList = [
    //list of icons that required by animated navigation bar.
    Icons.abc_sharp,
    Icons.access_time,
    Icons.holiday_village,
    Icons.account_tree_rounded
  ];
  int _bottomNavIndex = 0; //default index of the tabs
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //material app with debugshowcheckedmodebanner false
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //scaffold
        body: Container(),
        floatingActionButton: FloatingActionButton(
            child: Icon(iconList[_bottomNavIndex]), onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          notchMargin: 20,
          height: 60,
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness
              .defaultEdge, //use mediumCurve or highCurve to make the curve more circular
          onTap: (index) => setState(() => _bottomNavIndex = index),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
