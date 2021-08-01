import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  String id ="profile";


  String name ;
String prenom= '';
  String adress='';
  String wilaya;
  String type;
  List<dynamic> service;
  String tel ;
// String service ='';
//
  Profile(
      this.name,
      this.prenom,
      this.adress,
      this.wilaya,
      this.type,
      this.tel,
      this.service
//     this.service,
      );
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar:AppBar(
        title: Text('معلومات أكثر',

        ),
        centerTitle: true,
        leading: BackButton(
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16) ),

        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      )
      ,


      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex:5,
                child:Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple[800],Colors.deepPurpleAccent],
                    ),
                  ),
                  child: Column(
                      children: [
                        SizedBox(height: 110.0,),
                        CircleAvatar(
                          radius: 65.0,
                          backgroundImage: AssetImage('assets/images/user2.jpg'),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(height: 10.0,),
                        Text("${widget.name.toUpperCase()} ${widget.prenom.toUpperCase()}",
                            style: TextStyle(
                              color:Colors.white,
                              fontSize: 20.0,
                            )),
                        SizedBox(height: 10.0,),


                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(widget.wilaya.toUpperCase(),
                                style: TextStyle(
                                  color:Colors.white,
                                  fontSize: 16.0,
                                ),),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(Icons.location_pin,
                                color: Colors.white,),
                            ]),

                        ///////////////
                      ]
                  ),
                ),
              ),

              Expanded(
                flex:5,
                child: Container(
                  color: Colors.grey[200],
                  child: Center(

                    child: Card(

                        margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                        child: Container(
                            width: double.infinity,
                            height:250.0,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child:

                                    Text("المزيد",
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w800,
                                      ),),),
                                  Divider(color: Colors.grey[300],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.add_reaction,
                                        color: Colors.deepPurple[400],
                                        size: 30,
                                      ),
                                      SizedBox(width: 20.0,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(widget.type.compareTo('donneur')==0?'متبرع':'بائع',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                            ),),
                                          // Text("FairyTail, Magnolia",
                                          //   style: TextStyle(
                                          //     fontSize: 12.0,
                                          //     color: Colors.grey[400],
                                          //   ),)
                                        ],
                                      )

                                    ],
                                  ),
                                  SizedBox(height: 20.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: Colors.deepPurple[400],
                                        size: 35,
                                      ),
                                      SizedBox(width: 20.0,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(widget.tel.toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),),

                                        ],
                                      )

                                    ],
                                  ),
                                  SizedBox(height: 20.0,),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.home,
                                        color: Colors.deepPurple[400],
                                        size: 35,
                                      ),
                                      SizedBox(width: 20.0,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(widget.adress.toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),),

                                        ],
                                      )

                                    ],
                                  ),

                                ],
                              ),
                            )
                        )
                    ),

                  ),
                ),
              ),

            ],
          ),


          Positioned(
              top:MediaQuery.of(context).size.height*0.45,
              left: 20.0,
              right: 20.0,
              child: Card(
                  child: Padding(
                    padding:EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child:Column(
                              children: [
                                Text('خدمات',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 20.0
                                  ),),
                                SizedBox(height: 5.0,),
                                Container(
                                  // color: Colors.red,
                                  // height: 100,
                                  width: 150,
                                  child: ListView.builder(
                                      padding: EdgeInsets.only(top: 0.0,bottom: 5),
                                      shrinkWrap: true,
                                      itemCount:3 ,
                                      itemBuilder: (ctx, index){
                                        if(widget.service[index]!='#'){
                                          return Text(widget.service[index+3], textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 17),);
                                        }
                                        else{ return Container();}

                                      }),
                                ),
                                // Text('19 yrs',
                                //   style: TextStyle(
                                //     fontSize: 15.0,
                                //   ),)
                              ],
                            )
                        ),
                        Container(
                      //    color: Colors.green,
                            child:Column(
                              children: [
                                Text('ثمن',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 20.0
                                  ),),
                                SizedBox(height: 5.0,),
                                Container(
                                 // color: Colors.red,
                                 // height: 100,
                                  width: 120,
                                  child: ListView.builder(
                                      padding: EdgeInsets.only(top: 0.0,bottom: 5),
                                      shrinkWrap: true,
                                     itemCount:3 ,
                                   itemBuilder: (ctx, index){
                                       if(widget.service[index]!='#'){
                                           return Text("${widget.service[index].toString().toUpperCase()} DZD", textAlign: TextAlign.center,
                                           style: TextStyle(fontSize: 17),
                                           );
                                         }
                                       else{ return Container();}

                             }),
                                ),
                                // Text("$counter",
                                //   style: TextStyle(
                                //     fontSize: 15.0,
                                //   ),)
                              ],
                            )
                        ),

                        // Container(
                        //   child: Column(
                        //       children: [
                        //         Text('Birthday',
                        //           style: TextStyle(
                        //               color: Colors.grey[400],
                        //               fontSize: 14.0
                        //           ),),
                        //         SizedBox(height: 5.0,),
                        //         Text('April 7th',
                        //           style: TextStyle(
                        //             fontSize: 15.0,
                        //           ),)
                        //       ]),
                        // ),


                      ],
                    ),
                  )
              )
          )
        ],

      ),
    );
  }
}





