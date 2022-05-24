import 'package:chat_app/services/database.dart';
import 'package:chat_app/view/chatRoomsScreen.dart';
import 'package:chat_app/widget/widget.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';
class SignUp extends StatefulWidget {
  final Function? toggle;
  const SignUp({Key? key,this.toggle}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading=false;
  DatabaseMethod databaseMethod=DatabaseMethod();
  AuthMethods authMethods=new AuthMethods();
  final formKey=GlobalKey<FormState>();
  TextEditingController userNameTextEditingController=TextEditingController();
  TextEditingController emailTextEditingController=TextEditingController();
  TextEditingController passwordTextEditingController=TextEditingController();
  signMeUp()
  {
    if(formKey.currentState!.validate()){
      setState(() {
        isLoading=true;
      });
      authMethods.singUpWithEmailAndPassword
        (emailTextEditingController.text,
          passwordTextEditingController.text
      ).then((value){
        Map<String,String> myMap={
          'email':emailTextEditingController.text,
          'name':userNameTextEditingController.text
        };
        databaseMethod.uploadUserInfo(myMap);
      } );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChatRoom()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: appBarMain(context)),
       body:isLoading? Container(
         child: Center(
           child: CircularProgressIndicator(),
         ),
       ): SingleChildScrollView(
         child: Container(
           height: MediaQuery.of(context).size.height-100,
           padding: EdgeInsets.symmetric(horizontal: 24),
           alignment: Alignment.bottomCenter,
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Form(
                 key: formKey,
                 child: Column(
                   children: [
                     TextFormField(
                       validator: (value){
                         return value!.isEmpty  ? 'Please Provide a valid userName':null;
                       },
                       controller: userNameTextEditingController,
                       style: simpleTextStyle(),
                       decoration: textFieldInputDecoration('username'),
                     ),
                     SizedBox(height: 8,),
                     TextFormField(
                       validator: (value)
                       {
                         return RegExp(
                             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                             .hasMatch(value!) ? null:"Please Provide Valid Email ID";
                       },
                       controller: emailTextEditingController,
                       style: simpleTextStyle(),
                       decoration: textFieldInputDecoration('email'),
                     ),
                     SizedBox(height: 8,),
                     TextFormField(
                       obscureText: true,
                       validator: (value){
                         return value!.length > 6 ? null:'Please Provide 6+ character';
                       },
                       controller: passwordTextEditingController,
                       style: simpleTextStyle(),
                       decoration: textFieldInputDecoration('password'),
                     ),
                     SizedBox(height: 8,),
                   ],
                 ),
               ),
               Container(
                 padding: EdgeInsets.symmetric(vertical: 8),
                 alignment: Alignment.centerRight,
                 child: Text("Forgot Password",style: simpleTextStyle(),),
               ),
               SizedBox(height: 8,),
               GestureDetector(
                 onTap: (){
                   signMeUp();
                 },
                 child: Container(
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
                   child: Text("Sign Up",style: mediumTextStyle()),
                 ),
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
                 child: Text("Sign Up with Google",style: TextStyle(
                     color: Colors.black87,
                     fontSize: 17
                 )),
               ),
               SizedBox(height: 16,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("Already have account?",style: mediumTextStyle(),),
                   InkWell(
                     onTap: (){
                       widget.toggle!();
                     },
                     child: Text("SingIn Now",style:TextStyle(
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
