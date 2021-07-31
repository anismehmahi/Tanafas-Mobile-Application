import 'package:flutter/material.dart';
import 'package:tnafes/Screens/HomePage.dart';
import 'package:tnafes/Screens/Signup/signup_screen.dart';
import 'package:tnafes/Screens/Welcome/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/HomePage.dart';
import 'components/rounded_button.dart';

class NeedyGiver extends StatefulWidget {
  @override
  _NeedyGiverState createState() => _NeedyGiverState();
}

class _NeedyGiverState extends State<NeedyGiver> {
  bool state=false;
  Future<bool> getState()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('state');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getState().then((value) {
      setState(() {
        state=value;
      });
    });
    Future.delayed(Duration(milliseconds: 400));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(' :هل انت ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Center(
              child: RoundedButton(
                text: "محتاج",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MyHomePage(true)));

                },
              ),
            ),
            Center(
              child: RoundedButton(
                text: "متبرع او بائع ",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>state!=null && state?MyHomePage(false): WelcomeScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
