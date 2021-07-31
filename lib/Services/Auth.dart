import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Auth {
Future<String> login(String email, String password)async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String errorMessage='success';
try{
  print(email);
  await auth.signInWithEmailAndPassword(email: email, password: password);

}
on FirebaseAuthException catch (e)  {
  print ("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee ${e.code}");
    switch(e.code){
      case "invalid-email":
        errorMessage = "يبدو انك اخطئت في كتابة البريد الالكتروني";
        break;
      case "wrong-password":
        errorMessage = "كلمة السر خاطئة";
        break;
      case "user-not-found":
        errorMessage = "لايوجد مستخدم مرفوق بهذا البريد الالكتروني";
        break;
      case "user-disabled":
        errorMessage = "حساب المستخدم معطل";
        break;

      default:
        errorMessage = "An undefined Error happened.";

    }
  }
  return errorMessage;
}
Future<String> SignUp(String email, String password)async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String errorMessage='success';
  try{
    print(email);
    await auth.createUserWithEmailAndPassword(email: email, password: password);

  }
  on FirebaseAuthException catch (e)  {
 //   print ("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee ${e.code}");
    switch(e.code){
      case "invalid-email":
        errorMessage = "يبدو انك اخطئت في كتابة البريد الالكتروني";
        break;
      case "email-already-in-use":
        errorMessage = "البريد الالكتروني محجوز بالفعل";
        break;
      case "operation-not-allowed":
        errorMessage = "عملية غير مسموحة";
        break;
      case "weak-password":
        errorMessage = "كلمة السر ضعيفة";
        break;

      default:
        errorMessage = "An undefined Error happened.";

    }
  }
  return errorMessage;
}
signOut ()async{
  FirebaseAuth auth = FirebaseAuth.instance;
await auth.signOut();
}

Future<bool> setState(bool state)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setBool('state', state);
}
}