
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnafes/needyOrgiver.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//
//     home: Searchpage(),
//     );
//     }
//
// }



//
// class Searchpage extends StatefulWidget {
//   //static String id ='Searchpage' ;
//
//   @override
//   _SearchpageState createState() => _SearchpageState();
// }
//
// class _SearchpageState extends State<Searchpage> {
//
//  // Profile profile = new Profile();
//   String _value ;
//   String newValue;
//
//   String _value2 ;
//   String newValue2;
//
//   List<String> besoins =[
//     "o2",
//     "haja o5ra",
//     "0.6",
//     "0.2",
//   ];
//
//   List<String> wilayas = [
//     "Adrar",
//     "Chlef",
//     "Laghouat",
//     "Oum El Bouaghi",
//     "Batna",
//     "Béjaïa",
//     "Biskra",
//     "Béchar",
//     "Blida",
//     "Bouïra",
//     "Tamanrasset",
//     "Tébessa",
//     "Tlemcen",
//     "Tiaret",
//     "Tizi Ouzou",
//     "Alger",
//     "Djelfa",
//     "Jijel",
//     "Sétif",
//     "Saïda",
//     "Skikda",
//     "Sidi Bel Abbès",
//     "Annaba",
//     "Guelma",
//     "Constantine",
//     "Médéa",
//     "Mostaganem",
//     "	M'Sila",
//     "Mascara",
//     "Ouargla",
//     "Oran",
//     "El Bayadh",
//     "Illizi",
//     "Bordj Bou Arréridj ",
//     "Boumerdès",
//     "El Tarf",
//     "Tindouf",
//     "Tissemsilt",
//     "El Oued",
//     " Khenchela",
//     "Souk Ahras",
//     "Tipaza",
//     "Mila",
//     "Aïn Defla",
//     "Naâma",
//     "Aïn Témouchent",
//     "Ghardaïa	",
//     "Relizane",
//     "El M'ghair",
//     "El Menia",
//     "Ouled Djellal",
//     " Bordj Baji Mokhtar",
//     " Béni Abbès",
//     " Timimoun  ",
//     "Touggourt",
//     ' Djanet',
//     "In Salah",
//     "In Guezzam"
//   ];
//   var selecteditem =null;
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Container(
//
//       color: Colors.black,
//       child: Scaffold(
//
//       appBar: AppBar(
//
//         title: Center(
//           child:   Text("Chercher votre Besoins",
//
//           style: TextStyle(color: Colors.black),
//
//           ),
//         ),
//
//       elevation: 0,
//       backgroundColor: Colors.white,
//       ),
//
//
//         body:
//          Container(
//
//           height: double.infinity,
//           width: double.infinity,
//
//           child: Column(
//
//                 children:<Widget> [
//
//                   Row(
//
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Expanded(
//                         child: Container(
//
//                           padding: EdgeInsets.only(left: 10),
//
//                           height: 50,
//                           child: DropdownButtonFormField<String>(
//                             value: _value,
//                             isExpanded: true,
//                             hint: Text('WILAYA'),
//                             icon: const Icon(Icons.arrow_downward),
//                             iconSize: 20,
//                             elevation: 16,
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 15,
//                             ),
//                             // underline: Container(
//                             //   margin: const EdgeInsets.only(
//                             //       left: 0, top: 20, right: 0, bottom: 0),
//                             //   child: Container(
//                             //     height: 1,
//                             //     color: Colors.grey,
//                             //   ),
//                             // ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'REQUIRED';
//                               } else {
//                                 return null;
//                               }
//                             },
//                             onChanged: (newValue) {
//                               setState(() {
//                                 _value = newValue;
//                                 // formKey.currentState.validate();
//                               });
//                             },
//                             items: wilayas
//                                 .map((e) => DropdownMenuItem<String>(
//                               value: e,
//                               child: Text(e),
//                               onTap: () {
//                                 setState(() {
//                                   _value = e;
//                                   FocusScope.of(context)
//                                       .requestFocus(new FocusNode());
//                                 });
//                               },
//                             ))
//                                 .toList(),
//
//
//                           ),
//
//                         ),
//                       ),
//
//
//
//
//                       SizedBox(
//
//                         width: 10,
//                       ),
//
//                       //?ta3 type de besoins
//
//                       Expanded(
//
//                         child: Container(
//                           padding: EdgeInsets.only(right: 10),
//                           height: 50,
//                           child: DropdownButtonFormField<String>(
//
//                             value: _value2,
//                             isExpanded: true,
//                             hint: Text('Besoin'),
//                             icon: const Icon(Icons.arrow_downward),
//                             iconSize: 20,
//                             elevation: 16,
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 15,
//                             ),
//                             // underline: Container(
//                             //   margin: const EdgeInsets.only(
//                             //       left: 0, top: 20, right: 0, bottom: 0),
//                             //   child: Container(
//                             //     height: 1,
//                             //     color: Colors.grey,
//                             //   ),
//                             // ),
//                             validator: (value2) {
//                               if (value2 == null || value2.isEmpty) {
//                                 return 'REQUIRED';
//                               } else {
//                                 return null;
//                               }
//                             },
//                             onChanged: (newValue2) {
//                               setState(() {
//                                 _value2 = newValue2;
//                                 // formKey.currentState.validate();
//                               });
//                             },
//                             items: besoins
//                                 .map((e) => DropdownMenuItem<String>(
//                               value: e,
//                               child: Text(e),
//                               onTap: () {
//                                 setState(() {
//                                   _value2 = e;
//                                   FocusScope.of(context)
//                                       .requestFocus(new FocusNode());
//                                 });
//                               },
//                             ))
//                                 .toList(),
//
//
//                           ),
//
//                         ),
//                       ),
//                     ],
//                   ),
//
//
//
//
//
//
//             // SizedBox(height: 100),
//
//
//             StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance.collection('Users').where('wilaya',
//                   isEqualTo: _value).where('service',isEqualTo: _value2)
//                   .snapshots(),
//               builder:  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//
//                 if (!snapshot.hasData) return new CircularProgressIndicator();
//
//                 return Expanded(
//
//                   child: ListView.builder(
//                     itemCount:snapshot.data.docs.length,
//                     itemBuilder: (context,index){
//                       DocumentSnapshot data = snapshot.data.docs[index];
//                       return Card(
//                         elevation: 5.0,
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(color: Colors.deepPurpleAccent, width: 1.5),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         margin: new EdgeInsets.symmetric(
//                             horizontal: 10.0, vertical: 4.0),
//                         child: Container(
//                           child: ListTile(
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 15.0, vertical: 5.0),
//                             leading:   CircleAvatar(
//                               radius: 25.0,
//                               backgroundImage: AssetImage('assets/user2.jpg'),
//                               backgroundColor: Colors.white,
//                             ),
//                             // leading:  Image.network(
//                             //   book.urlImage,
//                             //   fit: BoxFit.cover,
//                             //   width: 50,
//                             //   height: 50,
//                             // ),
//                             title: new Text(
//                               data['name'],
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.w400),
//                             ),
//                             subtitle: new Text(
//                               data['type'],
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.w300),
//                             ),
//                             trailing: Icon(Icons.keyboard_arrow_right_sharp,color: Colors.deepPurpleAccent,),
//                             enabled: true,
//                             dense: true,
//                             selected: false,
//                             // tileColor: Colors.green[400],
//                             focusColor: Colors.orangeAccent,
//                             hoverColor: Colors.blue,
//                             onTap: () {
//
//                               return Navigator.of(context)
//                                   .push(MaterialPageRoute(builder: (_) {
//                                 return Profile(
//                                   data['name'],
//                                   data['adress'],
//                                   data['wilaya'],
//                                   data['type'],
//                                   data['tel'],
//
//                                 );
//                               }));
//                               // print('thebookpageof '+  data['title'].toString(),);
//                             },
//                           ),
//                         ),
//                       );
//
//                     },),
//                 );
//               },),
//
//           ],
//         )
//
//         ),
//
//     ),
//     );
//
//   }
// }
//


class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool state=false;
  Future<bool> getState()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('state');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تنفس',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: NeedyGiver(),
      //home:state!=null && state? MyHomePage(): WelcomeScreen(),
    );
  }
}

