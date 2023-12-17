import 'package:flutter/material.dart';
import 'package:smartprices/model/IphoneList.dart';
import 'package:smartprices/model/MacbookList.dart';
import 'package:smartprices/model/ProfileView.dart';
import 'package:smartprices/model/homepage.dart';
import 'package:smartprices/model/onboardingpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMARTPRICES',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: OnboardingPage(),
    );
  }
}
