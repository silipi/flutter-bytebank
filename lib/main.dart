import 'package:alura_bytebank_sqflite/database/app_database.dart';
import 'package:alura_bytebank_sqflite/models/contact.dart';
import 'package:alura_bytebank_sqflite/screens/contact_form.dart';
import 'package:alura_bytebank_sqflite/screens/contacts_list.dart';
import 'package:alura_bytebank_sqflite/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}

