import 'package:flutter/material.dart';

import '../data/File_Json.dart';
import '../data/courses.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(""),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                height: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/appbar.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('HELLO \nEvan',
                          style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 1, 104, 132)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 26,
                        ),
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        // floatingLabelBehavior: FloatingLabelBehavior.never,
                        floatingLabelStyle: TextStyle(
                          backgroundColor: Colors.white,
                        ),
                        suffixIcon: Icon(
                          Icons.mic,
                          color: Colors.blue,
                        ),
                        labelText: "search your courses",
                        labelStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(45)))),
                  )
                ]),
              )
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'coming cources',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'see more',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(10),
            child: Wrap(
              children: List.generate(
                courses.length,
                (index) {
                  var data = courses[index];
                  var size = MediaQuery.of(context).size;
                  bool isMyCourse = mycourses
                      .any((course) => data['title'] == course['title']);
                  return Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 20),
                    child: Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10.0,
                                offset: const Offset(0, 5)),
                          ]),
                      width: size.width * 0.6,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                height: size.height * 0.2,
                                width: size.width * 0.6,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    data['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 7,
                                left: 7,
                                child: Container(
                                  width: 90,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(100)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${data['semester']} semester',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data['title'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 14,
                                decoration: isMyCourse
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(right: 7, left: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      data['instructor_profile'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                      width: 70,
                                      alignment: Alignment.centerLeft,
                                      child: Text(data['instructor_name'])),
                                ),
                                Text(
                                  '${data['credits']} credits',
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Taken Cources',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'see more',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Column(
            children: List.generate(
              commingCourses.length,
              (index) {
                var data = commingCourses[index];
                var size = MediaQuery.of(context).size;
                const paddingBetweenWidgets = 10;
                const otherWidgetsWidth = 50;
                const completionPercentage = 100;
                final availableWidth =
                    size.width - otherWidgetsWidth - paddingBetweenWidgets;
                final widgetWidth =
                    availableWidth * (completionPercentage / 100);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 19, 66, 92),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: size.width * .17,
                              width: size.width * .17,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  data['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['title'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Instructor : ${data['instructor_name']}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Container(
                                    width: size.width,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  Container(
                                    width: widgetWidth *
                                        (data['percentage'] / 100),
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.amber.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(100),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.amber,
                                          blurRadius: 6,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 50,
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${data['percentage']}%',
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Elective Cources',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'see more',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(10),
            child: Wrap(
              children: List.generate(
                elective.length,
                (index) {
                  var data = elective[index];
                  var size = MediaQuery.of(context).size;
                  bool isMyCourse = mycourses
                      .any((course) => data['title'] == course['title']);
                  return Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 20),
                    child: Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10.0,
                                offset: const Offset(0, 5)),
                          ]),
                      width: size.width * 0.6,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                height: size.height * 0.2,
                                width: size.width * 0.6,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    data['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 7,
                                left: 7,
                                child: Container(
                                  width: 90,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(100)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${data['semester']} semester',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data['title'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 14,
                                decoration: isMyCourse
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(right: 7, left: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      data['instructor_profile'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                      width: 70,
                                      alignment: Alignment.centerLeft,
                                      child: Text(data['instructor_name'])),
                                ),
                                Text(
                                  '${data['credits']} credits',
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Minor Cources',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'see more',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(10),
            child: Wrap(
              children: List.generate(
                minor_course.length,
                (index) {
                  var data = minor_course[index];
                  var size = MediaQuery.of(context).size;
                  bool isMyCourse = mycourses
                      .any((course) => data['title'] == course['title']);
                  return Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 20),
                    child: Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10.0,
                                offset: const Offset(0, 5)),
                          ]),
                      width: size.width * 0.6,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                height: size.height * 0.2,
                                width: size.width * 0.6,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    data['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 7,
                                left: 7,
                                child: Container(
                                  width: 90,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(100)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${data['semester']} semester',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data['title'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 14,
                                decoration: isMyCourse
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(right: 7, left: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      data['instructor_profile'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                      width: 70,
                                      alignment: Alignment.centerLeft,
                                      child: Text(data['instructor_name'])),
                                ),
                                Text(
                                  '${data['credits']} credits',
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Others Cources',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'see more',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(10),
            child: Wrap(
              children: List.generate(
                other_course.length,
                (index) {
                  var data = other_course[index];
                  var size = MediaQuery.of(context).size;
                  bool isMyCourse = mycourses
                      .any((course) => data['title'] == course['title']);
                  return Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 20),
                    child: Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10.0,
                                offset: const Offset(0, 5)),
                          ]),
                      width: size.width * 0.6,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                height: size.height * 0.2,
                                width: size.width * 0.6,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    data['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 7,
                                left: 7,
                                child: Container(
                                  width: 90,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(100)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${data['semester']} semester',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data['title'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 14,
                                decoration: isMyCourse
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(right: 7, left: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      data['instructor_profile'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                      width: 70,
                                      alignment: Alignment.centerLeft,
                                      child: Text(data['instructor_name'])),
                                ),
                                Text(
                                  '${data['credits']} credits',
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
