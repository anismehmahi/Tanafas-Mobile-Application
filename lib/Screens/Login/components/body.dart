

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tnafes/Screens/Loading/loading.dart';
import 'package:tnafes/Screens/Login/components/background.dart';
import 'package:tnafes/Screens/Signup/signup_screen.dart';
import 'package:tnafes/Screens/formulaire.dart';
import 'package:tnafes/Services/Auth.dart';
import 'package:tnafes/components/already_have_an_account_acheck.dart';
import 'package:tnafes/components/rounded_button.dart';
import 'package:tnafes/components/rounded_input_field.dart';
import 'package:tnafes/components/rounded_password_field.dart';

import '../../HomePage.dart';

class Body extends StatefulWidget {
   Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String password,email;
  bool loading=false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading?Loading(): SafeArea(
      child:
       Background(

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "تسجيل دخول",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  hintText: "بريد الكتروني",
                  onChanged: (value) {
                    email = value;
                  },
                ),
                RoundedPasswordField(
                  onChanged: (value) {
                    password = value;
                  },
                ),
                RoundedButton(
                  text: "تسجيل الدخول",
                  press: ()async {
                    // logique
                    setState(() {
                      loading=true;
                    });
                    Auth auth = new Auth();
                   String result=  await auth.login(email, password);

                    setState(() {
                      loading=false;
                    });
                    if(result=='success'){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MyHomePage(false);
                          },
                        ),
                       (route) => false,
                      );
                      await auth.setState(true);
                    }
                    else{
                      // show snack bar
                      Flushbar(

                        title:  '',
                        backgroundColor: Colors.red,
                        messageColor: Colors.white,
                        messageSize: 15,
                        message:  result,
                        duration:  Duration(seconds: 3),
                      )..show(context);
                    }
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),

    );
  }
}
