// ignore_for_file: unused_local_variable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreSnippets extends StatelessWidget {
  // final FirebaseFirestore db;
  final String documentId;

  FirestoreSnippets({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('lecture_materials');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(" ${snapshot.data?.id.toString()} ");
          }
          return Text("Loading....");
        }));
  }
}

class FirestoreSnippets2 extends StatelessWidget {
  // final FirebaseFirestore db;
  final String documentId;

  FirestoreSnippets2({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('time_table');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(
                "${(snapshot.data?.get("date") as Timestamp).toDate().toString().substring(0, 16)} \n ${snapshot.data?.get("name").toString()}");
          }
          return Text("Loading....");
        }));
  }
}

class FirestoreSnippets3 extends StatelessWidget {
  final String fileID;
  //const FirestoreSnippets1({super.key});
  FirestoreSnippets3({required this.fileID});
  @override
  Widget build(BuildContext context) {
    CollectionReference users1 =
        FirebaseFirestore.instance.collection('lecture_materials/docID');

    return FutureBuilder<DocumentSnapshot>(
        future: users1.doc(fileID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(" ${snapshot.data?.id.toString()} ");
          }
          return Text("Loading....");
        }));
  }
}
