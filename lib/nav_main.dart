import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'screens/profile.dart';
import 'screens/courses.dart';
import 'screens/home.dart';

class NavMain extends StatefulWidget {
  const NavMain({super.key});

  @override
  State<NavMain> createState() => _NavMainState();
}

class _NavMainState extends State<NavMain> {
  int screenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreen(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getScreen() {
    List<Widget> screens = [
      const HomeScreen(),
      const ProfileScreen(),
      const CoursesScreen()
    ];
    return IndexedStack(
      index: screenIndex,
      children: screens,
    );
  }

  Widget getFooter() {
    List bottomItems = [
      'assets/images/home_icon.svg',
      'assets/images/user_icon.svg',
      'assets/images/course_icon.svg'
    ];
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.blue, blurRadius: 30.0, offset: Offset(0, -10)),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Container(
            padding: const EdgeInsets.all(21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(bottomItems.length, (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      screenIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        bottomItems[index],
                        height: 17.5,
                        color: screenIndex == index ? Colors.orangeAccent : Colors.black,
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                );
              }),
            )),
      ),
    );
  }
}
