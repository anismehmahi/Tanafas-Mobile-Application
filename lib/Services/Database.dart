import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBase{
  Future<void > saveInfos(Map<String, dynamic> data)async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    await firestore.collection('Users').doc(user.uid).set(data);
  }
  Future<Map<String, dynamic> > getInfo()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    DocumentSnapshot<Map<String, dynamic>> query = await firestore.collection('Users').doc(user.uid).get();
    return query.data();

  }
}