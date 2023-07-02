import 'package:flutter/material.dart';
import 'package:untitled6/Screens/authenticate/Register.dart';
import 'package:untitled6/Screens/authenticate/sign_in.dart';

//import 'package:firebase_core/firebase_core.dart';
class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool ShowSignIn=true;
  void toggleView(){
    setState(() {
      ShowSignIn=!ShowSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {

    if(ShowSignIn) {
      return SignIn(toggleView:toggleView);
    }
    else{
      return Register(toggleView:toggleView);
    }
    }
  }

