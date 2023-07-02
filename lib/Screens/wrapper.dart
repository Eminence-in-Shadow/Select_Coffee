import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/Screens/Home/Home.dart';
import 'package:untitled6/Screens/authenticate/authenticate.dart';
import 'package:untitled6/models/user.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user= Provider.of<Ussers?>(context);
    print(user);
    //return either home or Authenticate the widget
    if(user==null) {
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}
