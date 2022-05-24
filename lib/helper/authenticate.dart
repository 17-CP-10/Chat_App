import 'package:chat_app/view/signin.dart';
import 'package:chat_app/view/signup.dart';
import 'package:flutter/material.dart';
class Athentiction extends StatefulWidget {
  const Athentiction({Key? key}) : super(key: key);

  @override
  State<Athentiction> createState() => _AthentictionState();
}

class _AthentictionState extends State<Athentiction> {
  bool showSignIn=true;
  toggleView()
  {
    setState(() {
      showSignIn=!showSignIn;
    });
  }
  @override
  Widget build(BuildContext context){
    if(showSignIn){
     return SingIn(toggle:toggleView()) ;
    }
    else{
      return SignUp(toggle:toggleView());
    }
  }
}
