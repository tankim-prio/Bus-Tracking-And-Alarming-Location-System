import 'dart:async';

import 'package:drivers/screens/new_trip_screen.dart';
import 'package:flutter/material.dart';

import '../Assistants/assistant_methods.dart';
import '../global/global.dart';
import '../screens/login_screen.dart';
import '../screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimer() async {
    if(firebaseAuth.currentUser != null) {
      await AssistantMethods.readCurrentOnlineUserInfo();
      await AssistantMethods.readCurrentOnlineUserCarInfo();
      Timer(Duration(seconds: 5), () {
        //print("Car Type: ${carModelCurrentInfo!.type}");
        Navigator.push(context, MaterialPageRoute(builder: (c) => MainScreen()));
      });
    }
    else{
      Timer(Duration(seconds: 5), () {
        Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Trippo',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
