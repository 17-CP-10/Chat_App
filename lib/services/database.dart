import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseMethod{
    getUserByUserName(String userName)
    {

    }
    uploadUserInfo(myMap){
      FirebaseFirestore.instance.collection('users').doc().set(myMap);
    }
}