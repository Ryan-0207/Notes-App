import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Addnote extends StatefulWidget {
  @override
  _AddnoteState createState() => _AddnoteState();
}

class _AddnoteState extends State<Addnote> {
  String title;
  String desc;

  void add() async {
    //save to cloud
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('notes');

    var data = {
      'title': title,
      'description': desc,
      'created': DateTime.now(),
    };
    await ref.add(data);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey[700]),
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(12.0)),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          add();
                        },
                        child: Text('Save'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey[700]),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(12.0)),
                        )),
                  ],
                ),
                SizedBox(height: 15.0),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Title',
                        ),
                        style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                        onChanged: (_val) {
                          title = _val;
                        },
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Notes Description',
                        ),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        onChanged: (_val) {
                          desc = _val;
                        },
                        maxLines: 10,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
