import 'package:chat_app/widget/widget.dart';
import 'package:flutter/material.dart';
class SingIn extends StatefulWidget {
  final Function? toggle;
  const SingIn({Key? key,this.toggle}) : super(key: key);
  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  TextEditingController emailTextEditingController=TextEditingController();
  TextEditingController passwordTextEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:PreferredSize(
        preferredSize:Size.fromHeight(50),
        child: appBarMain(context),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height-100,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailTextEditingController,
                style: simpleTextStyle(),
                decoration: textFieldInputDecoration('Email')
              ),
              TextField(
                controller: passwordTextEditingController,
                style: simpleTextStyle(),
                decoration: textFieldInputDecoration("Password")
              ),
              SizedBox(height: 8,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.centerRight,
                child: Text("Forgot Password",style: simpleTextStyle(),),
              ),
              SizedBox(height: 8,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff007EF4),
                      Color(0xff2A75BC),
                    ]
                  )
                ),
                child: Text("Sign In",style: mediumTextStyle()),
              ),
              SizedBox(height: 16,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Text("Sign In with Google",style: TextStyle(
                  color: Colors.black87,
                  fontSize: 17
                )),
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account?",style: mediumTextStyle(),),
                  InkWell(
                    onTap: (){
                     widget.toggle!();
                    },
                    child: Text("Register Now",style:TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      decoration: TextDecoration.underline
                    ),),
                  )
                ],
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
