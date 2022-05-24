import 'dart:async';

import 'package:chat_app/modal/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class AuthMethods{
final FirebaseAuth _auth=FirebaseAuth.instance;
UserModel? _userFromFirebaseUser(User user)
{
return user!=null ? UserModel(userId: user.uid):null;
}
Future signInWithEmailPassword(String email,String password) async {
try{
  User?  user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
  return _userFromFirebaseUser(user!);
}
catch(e)
  {
    print(e.toString());
  }
}
Future singUpWithEmailAndPassword(String email,String password) async
{
  try{
    User? user=(await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;
    return _userFromFirebaseUser(user!);
  }
  catch(e)
  {
    print(e.toString());
  }
}
Future resetPassword(String email) async{
  try{
    return await _auth.sendPasswordResetEmail(email: email);
  }
  catch(e)
  {
    print(e.toString());
  }
}
Future signOut() async
{
  try{
    return await _auth.signOut();
  }
  catch(e)
    {
      print(e.toString());
    }
}
}