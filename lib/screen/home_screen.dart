import 'dart:js_interop';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notebook/screen/note_reder.dart';
import 'package:notebook/style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notebook/widgets/notes_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("NOTESBOOK"),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your recent Notes",
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(child: 
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("Notes").snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2)
                      children: 
                      snapshot.data!.docs
                      .map((note) => notecard(() {Navigator.push(context,MaterialPageRoute(builder: (context)=>NotereaderScreen(note),
                      ));
                      },note
                      ))
                      .toList(),
                          );

                }
                return Text(
                  "thre's no Notes",
                  style: GoogleFonts.nunito(color: Colors.white),
                );
              },
            )
        )],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () {},
      label: Text("Add Note"),
      icon: Icon(Icons.add),
      ),
    );
  }
}
