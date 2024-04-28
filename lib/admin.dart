// ignore_for_file: unused_import, use_key_in_widget_constructors, must_be_immutable, unused_field, unused_local_variable, implementation_imports, unnecessary_import, avoid_print, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_lms/screens/calendar.dart';
import 'package:flutter_lms/screens/homescreen.dart';
import 'package:flutter_lms/screens/login_screen.dart';

import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';

class PDFfile extends StatefulWidget {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> lectureData = [];

  @override
  State<PDFfile> createState() => _PDFfileState();
}

class _PDFfileState extends State<PDFfile> {
  List<Map<String, dynamic>> pdfData = [];

  void getAllPdf() async {
    final results = await FirebaseFirestore.instance.collection("pdfs").get();

    pdfData = results.docs.map((e) => e.data()).toList();

    print("D");
    print(pdfData[0]['name']);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllPdf();
  }

  @override
  Widget build(BuildContext context) {
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
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: GridView.builder(
                    itemCount: pdfData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => PdfViewerScreen(
                                      pdfURL: pdfData[index]['file'])),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/note.png',
                                  height: 120,
                                  width: 100,
                                ),
                                Text(
                                  pdfData[index]["name"],
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 19, 19, 19)),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class PdfViewerScreen extends StatefulWidget {
  final String pdfURL;
  const PdfViewerScreen({super.key, required this.pdfURL});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  PDFDocument? document;

  void initialisePdf() async {
    document = await PDFDocument.fromURL(widget.pdfURL);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initialisePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: document != null
            ? PDFViewer(
                document: document!,
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}






// class Admin extends State<_AdminState> {
//   //const Admin({super.key});
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   List<Map<String, dynamic>> lectureData = [];

//   // Future<String> uploadPdf(String fileName, File file) async {
//   //   final reference =
//   //       FirebaseStorage.instance.ref().child("lectures/docIDs/$fileName.pdf");
//   //   final UploadTask = reference.putFile(file);
//   //   await UploadTask.whenComplete(() {});
//   //   final downloadLink = await reference.getDownloadURL();
//   //   return downloadLink;
//   // }

//   // void pickFile() async {
//   //   final pickedFile = await FilePicker.platform.pickFiles(
//   //     type: FileType.custom,
//   //     allowedExtensions: ['pdf'],
//   //   );

//   //   if (pickedFile != null) {
//   //     String fileName = pickedFile.files[0].name;

//   //     File file = File(pickedFile[0].path);

//   //     final downloadLink = await uploadPdf(fileName, file);

//   //     await _firebaseFirestore.collection("pdfs").add({
//   //       "name": fileName,
//   //       "url": downloadLink,
//   //     });

//   //     print("pdf uploaded ");
//   //   }
//   // }

//   void getAllLec() async {
//     final results = await _firebaseFirestore.collection("pdfs").get();

//     lectureData = results.docs.map((e) => e.data()).toList();

//     setState(() {});
//   }

//   @override
//   initState() {
//     super.initState();
//     getAllLec();
//   }

//   @override
//   State<Admin> createState() => _AdminState();
// }

// class _AdminState extends State<Admin> {
//   @override
//   Widget build(BuildContext context) {
//     double displayWidth = MediaQuery.of(context).size.width;
//     double displayHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//         backgroundColor: Color.fromARGB(255, 79, 120, 255),
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Color.fromARGB(255, 255, 255, 255),
//           selectedItemColor: Colors.blue.shade800,
//           unselectedItemColor: Colors.black,
//           items: [
//             BottomNavigationBarItem(
//                 label: '',
//                 icon: IconButton(
//                   onPressed: () {
//                     Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(builder: (context) => Home()));
//                   },
//                   icon: Icon(Icons.home_sharp),
//                 )),
//             BottomNavigationBarItem(
//                 label: '',
//                 icon: IconButton(
//                     onPressed: () {
//                       Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(builder: (context) => Calendar()));
//                     },
//                     icon: Icon(Icons.calendar_month_outlined))),
//           ],
//         ),
//         body: SafeArea(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'PLYMOUTH UNIVERSITY',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(
//                             height: displayHeight * 0.006,
//                           ),
//                           Text(
//                             'United Kingdom',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w300,
//                             ),
//                           ),
//                         ]),
//                     SizedBox(
//                       height: displayHeight * 0.2,
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   color: Colors.white,
//                   child: GridView.builder(
//                     itemCount: ,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2),
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: InkWell(
//                           onTap: () {},
//                           child: Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Image.asset(
//                                   'assets/images/note.png',
//                                   height: 120,
//                                   width: 100,
//                                 ),
//                                 Text(
//                                   "pdf name",
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
