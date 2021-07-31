import 'package:flutter/material.dart';

class Donation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('دعم'),
          centerTitle: true,
          elevation: 0,
        ),
          body: Container(
              margin: EdgeInsets.fromLTRB(20, 80,20, 0),
              child: Column(
                children: [
                  Image(image: AssetImage('assets/images/paypal.png'), width: 200,height: 200,),
                  SizedBox(height: 50,),
                  Text(" اذا كنت تريد دعم مطوري التطبيق يرجـى ارسال تبرعاتكم على حساب البايبال الأتي", textAlign: TextAlign.center,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
                  SizedBox(height: 20,),

                  Text("achrafzeroloze@gmail.com", textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                ],
              )),
      ),
    );
  }
}
