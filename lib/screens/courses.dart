import 'package:flutter/material.dart';
import 'package:smart_project/data/File_Json.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  var finished = mycourses
      .where(
        (element) => element['percentage'] == 100,
      )
      .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Courses"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(
              finished.length,
              (index) {
                var data = finished[index];
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
        ));
  }
}
