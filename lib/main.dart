import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:notes_app/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: '',
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      primaryColor: Colors.white,
    ),
    home: Loginpage(),
  ));
}
