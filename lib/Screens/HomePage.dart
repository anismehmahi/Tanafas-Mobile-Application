import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tnafes/Screens/HireUs.dart';
import 'package:tnafes/Screens/Profile.dart';
import 'package:tnafes/Screens/Welcome/welcome_screen.dart';
import 'package:tnafes/Screens/formulaire.dart';
import 'package:tnafes/Services/Auth.dart';
import 'package:tnafes/Services/Database.dart';
import 'package:tnafes/needyOrgiver.dart';

import '../Donation.dart';
import '../my_drawer_header.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage(bool visiteur){
    this.visiteur=visiteur;
  }
  bool visiteur;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentPage = DrawerSections.nothing;
  Future<String > getName()async{
    DataBase db = DataBase();
    Map<String, dynamic> data=   await db.getInfo();
  return data['name'];

  }
  String nom='';
  String _value ;
  String newValue;

  String _value2 ;
  String newValue2;

  List<String> besoins =[
    "Bouteille d'oxygène",
    "Concentrateurs",
    "Lovenox",


  ];

  List<String> wilayas = [
    "Adrar",
    "Chlef",
    "Laghouat",
    "Oum El Bouaghi",
    "Batna",
    "Béjaïa",
    "Biskra",
    "Béchar",
    "Blida",
    "Bouïra",
    "Tamanrasset",
    "Tébessa",
    "Tlemcen",
    "Tiaret",
    "Tizi Ouzou",
    "Alger",
    "Djelfa",
    "Jijel",
    "Sétif",
    "Saïda",
    "Skikda",
    "Sidi Bel Abbès",
    "Annaba",
    "Guelma",
    "Constantine",
    "Médéa",
    "Mostaganem",
    "	M'Sila",
    "Mascara",
    "Ouargla",
    "Oran",
    "El Bayadh",
    "Illizi",
    "Bordj Bou Arréridj ",
    "Boumerdès",
    "El Tarf",
    "Tindouf",
    "Tissemsilt",
    "El Oued",
    " Khenchela",
    "Souk Ahras",
    "Tipaza",
    "Mila",
    "Aïn Defla",
    "Naâma",
    "Aïn Témouchent",
    "Ghardaïa	",
    "Relizane",
    "El M'ghair",
    "El Menia",
    "Ouled Djellal",
    " Bordj Baji Mokhtar",
    " Béni Abbès",
    " Timimoun  ",
    "Touggourt",
    ' Djanet',
    "In Salah",
    "In Guezzam"
  ];
  var selecteditem =null;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
   if(!widget.visiteur){
     getName().then((value) {
       setState(() {
         nom=value;
       });
     });
     Future.delayed(Duration(milliseconds: 200));
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('بحث'),
        centerTitle: true,
        actions: [
          IconButton(onPressed:() {
            Navigator.pop(context);
          }, icon: Icon(Icons.home_outlined))
        ],
      ),
      drawer:   SafeArea(
        child: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                widget.visiteur ?Container():MyHeaderDrawer(name: nom,),

                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(

          color: Colors.black,
          child: Scaffold(

            // appBar: AppBar(
            //
            //   title: Center(
            //     child:   Text("Chercher votre Besoins",
            //
            //       style: TextStyle(color: Colors.black),
            //
            //     ),
            //   ),
            //
            //   elevation: 0,
            //   backgroundColor: Colors.white,
            // ),


            body:
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,

                child: Column(

                  children:<Widget> [

                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            //padding: EdgeInsets.only(left: 10),


                            padding: EdgeInsets.only(left: 10),

                            height: 70,
                            child: SizedBox(
                              width: 100,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF6F35A5)))),
                                value: _value,
                                //isExpanded: true,
                                hint: Text('WILAYA',style:
                                  TextStyle(
                                    color: Colors.black
                                  ),),
                                icon: const Icon(Icons.keyboard_arrow_down_sharp,color: Color(0xFF6F35A5),),
                                iconSize: 20,
                                elevation: 16,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                // underline: Container(
                                //   margin: const EdgeInsets.only(
                                //       left: 0, top: 20, right: 0, bottom: 0),
                                //   child: Container(
                                //     height: 1,
                                //     color: Colors.grey,
                                //   ),
                                // ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'REQUIRED';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (newValue) {
                                  setState(() {
                                    _value = newValue;
                                    // formKey.currentState.validate();
                                  });
                                },
                                items: wilayas
                                    .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                  onTap: () {
                                    setState(() {
                                      _value = e;
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                    });
                                  },
                                ))
                                    .toList(),


                              ),
                            ),

                          ),
                        ),




                        SizedBox(

                          width: 10,
                        ),

                        //?ta3 type de besoins

                        Expanded(

                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            height: 70,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF6F35A5)))),

                              value: _value2,
                             // isExpanded: true,
                              hint: Text('Besoin',style:TextStyle(
                                  color: Colors.black
                            ),),
                          icon: const Icon(Icons.keyboard_arrow_down_sharp,color: Color(0xFF6F35A5),),
                          iconSize: 20,
                          elevation: 16,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                              // underline: Container(
                              //   margin: const EdgeInsets.only(
                              //       left: 0, top: 20, right: 0, bottom: 0),
                              //   child: Container(
                              //     height: 1,
                              //     color: Colors.grey,
                              //   ),
                              // ),
                              validator: (value2) {
                                if (value2 == null || value2.isEmpty) {
                                  return 'REQUIRED';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (newValue2) {
                                setState(() {
                                  _value2 = newValue2;
                                  // formKey.currentState.validate();
                                });
                              },
                              items: besoins
                                  .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                                onTap: () {
                                  setState(() {
                                    _value2 = e;
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                  });
                                },
                              ))
                                  .toList(),


                            ),

                          ),
                        ),
                      ],
                    ),


                    _value==null || _value2==null ? Container(
                      height: MediaQuery.of(context).size.height*0.5,
                      width: double.infinity,

                      child: Center(child: Text('يرجى اختيار ولاية و الحاجة للبحث')),
                    ):StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('Users').where('wilaya',
                          isEqualTo: _value).where('service',arrayContainsAny: [_value2])
                          .snapshots(),
                      builder:  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                        if (!snapshot.hasData) return new CircularProgressIndicator();

                        return Expanded(

                          child: ListView.builder(
                            itemCount:snapshot.data.docs.length,
                            itemBuilder: (context,index){
                              DocumentSnapshot data = snapshot.data.docs[index];
                              return Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.deepPurpleAccent, width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: new EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 4.0),
                                child: Container(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 5.0),
                                    leading:   CircleAvatar(
                                      radius: 25.0,
                                      backgroundImage: AssetImage('assets/images/user2.jpg'),
                                      backgroundColor: Colors.white,
                                    ),
                                    // leading:  Image.network(
                                    //   book.urlImage,
                                    //   fit: BoxFit.cover,
                                    //   width: 50,
                                    //   height: 50,
                                    // ),
                                    title: new Text(
                                      data['name'].toString().toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20, fontWeight: FontWeight.w400),
                                    ),
                                    subtitle: new Text(
                                      data['type'].toString().compareTo('donneur')==0? 'متبرع': "بائع",
                                      style: TextStyle(
                                          fontSize: 17, fontWeight: FontWeight.w300),
                                    ),
                                    trailing: Icon(Icons.keyboard_arrow_right_sharp,color: Colors.deepPurpleAccent,),
                                    enabled: true,
                                    dense: true,
                                    selected: false,
                                    // tileColor: Colors.green[400],
                                    focusColor: Colors.orangeAccent,
                                    hoverColor: Colors.blue,
                                    onTap: () {

                                      return Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (_) {
                                        return Profile(
                                          data['name'],
                                          data['prenom'],
                                          data['rue'],
                                          data['wilaya'],
                                          data['type'],
                                          data['tel'],
                                          data['service'] ,

                                        );
                                      }));
                                      // print('thebookpageof '+  data['title'].toString(),);
                                    },
                                  ),
                                ),
                              );

                            },),
                        );
                      },),

                  ],
                )

            ),

          ),
        ),
      ),
    );
  }
  Widget MyDrawerList() {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Color(0xff353535),
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [


         widget.visiteur==true? Container(height: 0,): menuItem(1, "تعديل الحساب", Icons.person,
              currentPage == DrawerSections.photo ? true : false),
          // menuItem(2, "Edit Password", Icons.security,
          //     currentPage == DrawerSections.password ? true : false),

          // menuItem(3, "Edit phone number", Icons.phone_android,
          //     currentPage == DrawerSections.number ? true : false),
          widget.visiteur==true? Container(height: 0,):  menuItem(4, "تسجيل الخروج", Icons.logout,
              currentPage == DrawerSections.logout ? true : false),
          Divider(),
          menuItem(5, "للتواصل", Icons.contact_mail,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(6, "دعم المطورين ", Icons.monetization_on,
              currentPage == DrawerSections.send_feedback ? true : false),
          Divider(),
        ],
      ),
    );
  }
  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return InkWell(

      onTap: () {
        Navigator.pop(context);
        setState(() {
          if (id == 1) {
            currentPage = DrawerSections.photo;
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Formulaire(firstTime: false,)));

          } else if (id == 2) {
            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => ResetScreen()));
          } else if (id == 3) {
            currentPage = DrawerSections.number;
          } else if (id == 4) {
            final _auth = Auth();
            _auth.setState(false);
            _auth.signOut();
            currentPage = DrawerSections.logout;
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return NeedyGiver();
                },
              ),
                  (route) => false,
            );
          } else if (id == 5) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HireUs()));
          } else if (id == 6) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Donation()));
          }
          // } else if (id == 7) {
          //   currentPage = DrawerSections.privacy_policy;
          // } else if (id == 8) {
          //   currentPage = DrawerSections.send_feedback;
          // }
        });
      },
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
enum DrawerSections {
  nothing,
  photo,
  password,
  number,
  logout,
  privacy_policy,
  send_feedback,
}

