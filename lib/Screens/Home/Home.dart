//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Screens/Home/Settings_form.dart';
import 'package:untitled6/Services/auth.dart';
import 'package:untitled6/Services/database.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/models/Brew.dart';
import 'Brew_List.dart';
class Home extends StatelessWidget {
  final AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    void _ShowSettingsPannel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }
    return StreamProvider<List<Brew>?>.value(
      value: DatabaseService(uid: '').brews,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown.shade400,
          elevation: 0.0,
          actions: <Widget>[
          ElevatedButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: ()async{
            await _auth.signOut();
          }, ),
        ElevatedButton.icon(
        icon:Icon(Icons.settings),
            label: Text('Settings'),
        onPressed:(){
          return _ShowSettingsPannel();
        },
        ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/roasted-coffee-beans.jpg'),
              fit: BoxFit.fitHeight,
            ),
          ),
            child: BrewList()
        ),
      ),
    );
  }
}
