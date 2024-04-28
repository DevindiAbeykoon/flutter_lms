// ignore_for_file: prefer_const_constructors, unused_import, duplicate_ignore, unnecessary_import, implementation_imports, avoid_print, avoid_function_literals_in_foreach_calls, non_constant_identifier_names

import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
// ignore: unnecessary_import
import 'package:flutter/src/material/bottom_navigation_bar.dart';
import 'package:flutter/services.dart';

import 'package:flutter_lms/screens/homescreen.dart';
// ignore: unused_import
import 'package:flutter_lms/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../firestore.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

List<String> docIDs = [];

Future getDocId() async {
  print("D");
  await FirebaseFirestore.instance
      .collection('time_table')
      .get()
      .then((snapshot) => snapshot.docs.forEach((element) {
            print(element.reference.id);
            docIDs.add(element.reference.id);
          }));
}

class _CalendarState extends State<Calendar> {
  int int_currentIndex = 0;

  final List<Widget> intt_children = [
    const Home(),
  ];

  void onTabTapped(int index) {
    setState(() {
      // ignore: no_leading_underscores_for_local_identifiers, unused_local_variable
      int _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext content) {
    // ignore: prefer_const_constructors
    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 79, 120, 255),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          selectedItemColor: Colors.blue.shade800,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                label: '',
                icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  icon: Icon(Icons.home_sharp),
                )),
            BottomNavigationBarItem(
                label: '',
                icon: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Calendar()));
                    },
                    icon: Icon(Icons.calendar_month_outlined))),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PLYMOUTH UNIVERSITY',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: displayHeight * 0.006,
                          ),
                          Text(
                            'United Kingdom',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: displayHeight * 0.2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade800,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        // ignore: prefer_const_constructors
                        icon: Icon(
                          Icons.logout_rounded,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(children: [
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 35,
                    ),
                    SingleChildScrollView(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: FutureBuilder(
                            future: getDocId(),
                            builder: (context, snapshot) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: docIDs.length,
                                  itemBuilder: (context, index) {
                                    // return ListTile(
                                    //   title: FirestoreSnippets(documentId: docIDs[index]),
                                    // );
                                    if (true) {
                                      return Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: SingleChildScrollView(
                                              // height: 60,
                                              // width: 350,

                                              child: SizedBox(
                                            height: displayHeight * 0.08,
                                            width: displayWidth * 0.05,
                                            child: ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.blue.shade800,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                ),
                                                onPressed: () {},
                                                label: FirestoreSnippets2(
                                                    documentId: docIDs[index]),
                                                icon: Icon(
                                                  Icons.library_books_rounded,
                                                )),
                                          )));
                                    }
                                  });
                              //}
                            },
                          )),
                        ],
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 30,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
