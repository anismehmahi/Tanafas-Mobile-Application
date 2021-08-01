import 'package:flutter/material.dart';

import 'Signup/components/or_divider.dart';
class HireUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("للتواصل"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
            margin: EdgeInsets.fromLTRB(20, 80,20, 0),
            child: Column(
              children: [
                Center(child: Image(image: AssetImage('assets/hiring.png'), width: 200,height: 200,)),
                SizedBox(height: 50,),
               // Text("تواصلو معنا على ", textAlign: TextAlign.center,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
                SizedBox(height: 20,),

                Text("ja_mahmahi@esi.dz", textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                OrDivider(),
                Text("an.derrar@esi-sba.dz", textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

              ],
            )),
      ),
    );
  }
}
