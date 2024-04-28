// ignore: avoid_web_libraries_in_flutter, unused_import
// ignore_for_file: implementation_imports, unnecessary_import, duplicate_ignore, prefer_const_constructors

import 'package:flutter/material.dart';
// ignore: unused_import
// ignore: unused_import

// ignore: unnecessary_import, unused_import
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore: use_key_in_widget_constructors, camel_case_types
class student extends StatefulWidget {
  const student({super.key});
  @override
  // ignore: library_private_types_in_public_api
  State<student> createState() => _studentState();
}

// ignore: camel_case_types
class _studentState extends State<student> {
  @override
  Widget build(BuildContext content) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body:
          // ignore: avoid_unnecessary_containers
          Container(
        child: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              // ignore: prefer_const_constructors
              backgroundColor: Color.fromARGB(221, 1, 3, 71),
              leading: IconButton(
                onPressed: () {},
                // ignore: prefer_const_constructors
                icon: Icon(Icons.person),
              ),

              // ignore: prefer_const_constructors
              title: Text(
                'PLYMOUTH  UNIVERSITY',
                // ignore: prefer_const_constructors
                style: TextStyle(
                    // ignore: prefer_const_constructors
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 25,
                    fontFamily: 'Rubik'),
              ),
            ),
            // ignore: prefer_const_constructors
            SliverToBoxAdapter(
              child: Column(children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 100,
                    width: 400,
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      shape: BoxShape.rectangle,
                      // ignore: prefer_const_constructors
                      color: Color.fromARGB(255, 90, 165, 252),
                    ),
                    alignment: Alignment.center,

                    // ignore: prefer_const_constructors
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        SizedBox(height: 35),
                        // ignore: prefer_const_constructors
                        Text("   Software Engineering 01",
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                        // ignore: prefer_const_constructors
                      ],
                    )),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 100,
                    width: 400,
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      shape: BoxShape.rectangle,
                      // ignore: prefer_const_constructors
                      color: Color.fromARGB(255, 90, 165, 252),
                    ),
                    alignment:
                        Alignment.center, // ignore: prefer_const_constructors
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        SizedBox(height: 35),
                        // ignore: prefer_const_constructors
                        Text("   Software Engineering 02",
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                        // ignore: prefer_const_constructors
                      ],
                    )),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 100,
                    width: 400,

                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      shape: BoxShape.rectangle,
                      // ignore: prefer_const_constructors
                      color: Color.fromARGB(255, 90, 165, 252),
                    ),
                    alignment: Alignment.center,

                    // ignore: prefer_const_constructors
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        SizedBox(height: 35),
                        // ignore: prefer_const_constructors
                        Text("   Software Engineering 03",
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                        // ignore: prefer_const_constructors
                      ],
                    )),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 100,
                    width: 400,
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      shape: BoxShape.rectangle,
                      // ignore: prefer_const_constructors
                      color: Color.fromARGB(255, 90, 165, 252),
                    ),
                    alignment:
                        Alignment.center, // ignore: prefer_const_constructors
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        SizedBox(height: 35),
                        // ignore: prefer_const_constructors
                        Text("   Software Engineering 04",
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                        // ignore: prefer_const_constructors
                      ],
                    )),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 100,
                    width: 400,
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      shape: BoxShape.rectangle,
                      // ignore: prefer_const_constructors
                      color: Color.fromARGB(255, 90, 165, 252),
                    ),
                    alignment: Alignment.center,

                    // ignore: prefer_const_constructors
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        SizedBox(height: 35),
                        // ignore: prefer_const_constructors
                        Text("   Software Engineering 05",
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                        // ignore: prefer_const_constructors
                      ],
                    )),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                // ignore: prefer_const_constructors
              ]),
            ),

            // ignore: avoid_unnecessary_containers
          ],
        ),
      ),
    );
  }
}
