

import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tnafes/Model/Service.dart';
import 'package:tnafes/Screens/HomePage.dart';
import 'package:tnafes/Services/Database.dart';
import 'package:tnafes/components/rounded_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../constants.dart';

class Formulaire extends StatefulWidget {
  bool firstTime;
Formulaire({bool firstTime}){
  this.firstTime=firstTime;
}

  @override
  _FormulaireState createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {

  String _value;
  String asset;
  HashSet services = new HashSet<Service>();
  HashSet services2 = new HashSet<Service>();

  String type='donneur';
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

  TextEditingController num = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController rue = TextEditingController();
  TextEditingController prix0 = TextEditingController();
  TextEditingController prix1 = TextEditingController();
  TextEditingController prix2 = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool checkedValue0 = false;
  bool checkedValue1 = false;
  bool checkedValue2 = false;
  int currentindex = 0;
  bool afficher=false;
  Future<Map<String, dynamic>>data ;
void getData()async{
  // if(widget.firstTime!=null && widget.firstTime==false) {
  //
  // }

    DataBase db = DataBase();
    Map<String, dynamic> data=   await db.getInfo();
setState(() {
  num.text=data['tel'];
  name.text=data['name'];
  prenom.text=data['prenom'];
  rue.text= data['rue'];
  _value=data['wilaya'];
  type= data['type'];
  print(type);
  if(type=='donneur'){currentindex=0;}
  else{currentindex=1;}
  List<String> hh = new List(6);
  hh[0]= data['service'][0];
  hh[1]= data['service'][1];
  hh[2]= data['service'][2];

  for(int i=0;i<3;i++){
   if(type=='donneur'){
     if(hh[i]=='gratuit'){
       switch (i){
         case 0:
           checkedValue0=true;
           hh[3]="Bouteille d'oxygène";
           break;
         case 1:
           checkedValue1=true;
           hh[4]="Concentrateurs";
           break;
         case 2:
           checkedValue2=true;
           hh[5]="Lovenox";
           break;
       }
     }
   }else{
      if(hh[i]!="#"){
        switch (i){
          case 0:
            checkedValue0=true;
            prix0.text=hh[i];
            hh[3]="Bouteille d'oxygène";
            break;
          case 1:
            checkedValue1=true;
            prix1.text=hh[i];
            hh[4]="Concentrateurs";
            break;
          case 2:
            checkedValue2=true;
            prix2.text=hh[i];
            hh[5]="Lovenox";
            break;
        }
      }

   }
   // switch(x){
   //   case "Bouteille d'oxygène":
   //     checkedValue0=true;
   //     prix0.text=x.value;
   //    services2.add(Service(nom:"Bouteille d'oxygène",prix: x.value ));
   //     break;
   //   case "Lovenox":
   //     checkedValue2=true;
   //     prix2.text=x.value;
   //    services2.add(Service(nom:"Lovenox",prix: x.value ));
   //
   //     break;
   //   case "Concentrateurs":
   //     checkedValue1=true;
   //     prix1.text=x.value;
   //     services2.add(Service(nom:"Concentrateurs",prix: x.value ));
   //
   //     break;
   // }
 }
});
    //return data;
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.firstTime!=null && widget.firstTime==false){

    getData();
    Future.delayed(Duration(seconds: 1));

    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        //resizeToAvoidBottomInset: false,

        extendBody: true,
        appBar: AppBar(
          // backgroundColor: Colors.amberAccent,
          title: Text(
            "معلومات شخصية",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,

          brightness: Brightness.light,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 2, 14, 0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: _value == null ? 10 : 0,
                    ),
                    Container(
                      height: 60,
                      child: TextFormField(
                        onChanged: (val) {
                          //formKey.currentState.validate();
                        },
                        validator: (value) {
                          if (value.isNotEmpty) {
                            return null;
                          } else {
                            return "REQUIRED";
                          }
                        },
                        controller: name,
                        decoration: InputDecoration(
                            hintText: "Nom",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    Container(
                      height: 60,
                      child: TextFormField(
                        onEditingComplete: (){

                        },
                        validator: (value) {
                          if (value.isNotEmpty) {
                            return null;
                          } else {
                            return "REQUIRED";
                          }
                        },
                        controller: prenom,
                        decoration: InputDecoration(
                            hintText: "Prenom",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    Container(
                      height: 60,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: num,
                        onChanged: (val) {
                          //formKey.currentState.validate();
                        },
                        validator: (value) {
                          if (value.isNotEmpty) {
                            return null;
                          } else {
                            return "REQUIRED";
                          }
                        },
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Phone Number",
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      child: TextFormField(
                        onChanged: (val) {
                          //formKey.currentState.validate();
                        },
                        validator: (value) {
                          if (value.isNotEmpty) {
                            return null;
                          } else {
                            return "REQUIRED";
                          }
                        },
                        controller: rue,
                        decoration: InputDecoration(
                            hintText: "Rue",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    Container(
                      height: 60,
                      child: DropdownButtonFormField<String>(
                        value: _value,

                        isExpanded: true,
                        hint: Text('WILAYA'),
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
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

                        // [
                        //   DropdownMenuItem<String>(
                        //     value: 'MOTO',
                        //     onTap: () {
                        //       setState(() {
                        //         _value = "moto";
                        //        // asset = moto;
                        //         FocusScope.of(context).requestFocus(new FocusNode());
                        //
                        //       });
                        //     },
                        //     child: Text('MOTO'),
                        //   ),
                        //   DropdownMenuItem<String>(
                        //     value: "SPORT",
                        //     onTap: () {
                        //       setState(() {
                        //         _value = 'sport';
                        //         //asset = sport;
                        //         FocusScope.of(context).requestFocus(new FocusNode());
                        //
                        //       });
                        //     },
                        //     child: Text("SPORT"),
                        //   ),
                        //   DropdownMenuItem<String>(
                        //     value: "4X4",
                        //     onTap: () {
                        //       setState(() {
                        //         _value = "4x4";
                        //       //  asset = x4x;
                        //         FocusScope.of(context).requestFocus(new FocusNode());
                        //
                        //       });
                        //     },
                        //     child: Text("4X4"),
                        //   )
                        // ]
                      ),
                    ),
                    ToggleSwitch(
                      minWidth: 100,
                      initialLabelIndex: currentindex,
                      totalSwitches: 2,
                      labels: ['Donneur', 'Vendeur'],
                      onToggle: (index) {
                        setState(() {
                          currentindex = index;
                        });
                        if(index==0){
                          type='donneur';
                        }else{
                          type='vendeur';
                        }
                        prix0.clear();
                        prix1.clear();
                        prix2.clear();
                        // for(Service x in services){
                        //   print(x.nom); print(x.prix);
                        // };
                        print('switched to: $index');
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          //  width: MediaQuery.of(context).size.width*0.7,
                          child: CheckboxListTile(
                            title: Text("Bouteille d'oxygène"),
                            activeColor:kPrimaryColor,

                            value: checkedValue0,
                            onChanged: (newValue) {
                              setState(() {
                                checkedValue0 = newValue;
                              });
                              // if(newValue){
                              //  // services.removeWhere((element) => element?.nom=="Bouteille d'oxygène");
                              //   services.add(Service(nom: "Bouteille d'oxygène", prix: prix0.text));
                              //
                              // }
                              // else{
                              //   services.removeWhere((element) => element?.nom=="Bouteille d'oxygène");
                              // }
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                        ),
                        (currentindex == 1 && checkedValue0)

                            ? SizedBox(
                          child: TextFormField(
                            controller: prix0,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (currentindex == 1) {
                                if (value.isNotEmpty) {
                                  // print('is empty ${services.isEmpty}');
                                  // for(Service x in services){
                                  //   print(x.nom); print(x.prix);
                                  // };
                                  // bool ll=   services.add(Service(nom: "Bouteille d'oxygène", prix: prix0.text));
                                  // print('skaaaaaaaaaaa ${prix0.text } $ll');
                                  return null;
                                } else {
                                  return "REQUIRED";
                                }
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'prix',
                                suffixText: 'DZD',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black))),
                          ),
                          width: 90,
                        )
                            :(currentindex == 1 && !checkedValue0)? Container() :Container(
                          child: Text(
                            'gratuit',
                            style: TextStyle(fontSize: 18),
                          ),
                          width: 60,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          //width: MediaQuery.of(context).size.width*0.7,
                          child: CheckboxListTile(
                            activeColor:kPrimaryColor,
                            title: Text("Concentrateurs"),
                            value: checkedValue1,
                            onChanged: (newValue) {
                              setState(() {
                                checkedValue1 = newValue;
                              });

                              // if(newValue){
                              // //  services.removeWhere((element) => element?.nom=="Bouteille d'oxygène");
                              //
                              //   services.add(Service(nom: "Concentrateurs", prix: prix1.text));
                              // }
                              // else{
                              //   services.removeWhere((element) => element.nom=="Concentrateurs");
                              // }
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                        ),
                        (currentindex == 1 && checkedValue1)
                            ? SizedBox(
                          child: TextFormField(
                            controller: prix1,

                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (currentindex == 1) {
                                if (value.isNotEmpty) {
                                //  services.add(Service(nom: "Concentrateurs", prix: prix1.text));

                                  return null;
                                } else {
                                  return "REQUIRED";
                                }
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'prix',
                                suffixText: 'DZD',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black))),
                          ),
                          width: 90,
                        )
                            : (currentindex == 1 && !checkedValue1)? Container():Container(
                          child: Text(
                            'gratuit',
                            style: TextStyle(fontSize: 18),
                          ),
                          width: 60,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          //width: MediaQuery.of(context).size.width*0.7,
                          child: CheckboxListTile(
                            title: Text("Lovenox"),
                            activeColor:kPrimaryColor,

                            value: checkedValue2,
                            onChanged: (newValue) {
                              setState(() {
                                checkedValue2 = newValue;
                              });
                              // if(newValue){
                              //  // services.removeWhere((element) => element?.nom=="Bouteille d'oxygène");
                              //
                              //   services.add(Service(nom: "Lovenox", prix: prix2.text));
                              // }
                              // else{
                              //   services.removeWhere((element) => element.nom=="Lovenox");
                              // }
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                        ),
                        (currentindex == 1 && checkedValue2)
                            ? SizedBox(
                          child: TextFormField(
                            controller: prix2,

                            validator: (value){
                              if(currentindex==1){
                                if(value.isNotEmpty){
                                  services.add(Service(nom: "Lovenox", prix: prix2.text));

                                  return null;
                                }

                                else{
                                  return "REQUIRED";
                                }
                              }else{ return null;}
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'prix',
                                suffixText: 'DZD',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black))),
                          ),
                          width: 90,
                        )
                            : !checkedValue2&&currentindex == 1? Container():Container(
                          child: Text(
                            'gratuit',
                            style: TextStyle(fontSize: 18),
                          ),
                          width: 60,
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    afficher==false?Container():Text('Vous devez choisir un service ', style: TextStyle(
                        color: Colors.red,
                        fontSize: 15
                    ),),


                    RoundedButton(
                      text: "Confirmer",
                      press: () async{
                        bool good= formKey.currentState.validate();
                        if(!checkedValue0&&!checkedValue2&&!checkedValue1){
                          setState(() {
                            afficher =true;
                          });
                        }else{
                          setState(() {
                            afficher =false;
                          });
                        }
                        if(good && !afficher){
                          DataBase db = DataBase();
                          List<String> hh= new List(6);
                          if(checkedValue0){
                            hh[3]="Bouteille d'oxygène";

                            if(currentindex==0){
                              hh[0]='gratuit';
                            }else{ hh[0]=prix0.text;}
                          }else{

                            hh[0]='#';
                          }
                          if(checkedValue1){
                            hh[4]="Concentrateurs";

                            if(currentindex==0){
                              hh[1]='gratuit';
                            }else{ hh[1]=prix1.text;}
                          }
                          else{
                            hh[1]='#';
                          }
                          if(checkedValue2){
                            hh[5]="Lovenox";

                            if(currentindex==0){
                              hh[2]='gratuit';
                            }else{ hh[2]=prix2.text;}
                          }else{
                            hh[2]='#';
                          }

                          Map <String , dynamic> data = {
                            'name':name.text,
                            'prenom':prenom.text,
                            'tel':num.text,
                            'rue':rue.text,
                            'wilaya':_value,
                            'type':type,
                            'service': hh
                          };
                          await db.saveInfos(data);
                          if(widget.firstTime){
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (ctx)=>MyHomePage(false)));

                          }else{
                            Navigator.pop(context);
                          }
                        }
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return LoginScreen();
                        //     },
                        //   ),
                        // );
                      },
                    ),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    // InkWell(
                    //   borderRadius: BorderRadius.circular(30),
                    //   onTap: () async {
                    //
                    //
                    //     if(formKey.currentState.validate() && barCode!="-1"){
                    //
                    //
                    //     }
                    //     // print(SaveUserInfo.id);
                    //   },
                    //   child: Ink(
                    //       height: 50,
                    //       width: MediaQuery.of(context).size.width * 0.9,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(30),
                    //         color: Colors.amberAccent,
                    //       ),
                    //       child: Center(child: Text('SAVE VEHICLE'))),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
