import'package:flutter/material.dart';
import 'package:untitled6/Services/database.dart';
import 'package:untitled6/Shared/constraints.dart';
import 'package:untitled6/Shared/loading.dart';
import 'package:untitled6/models/user.dart';
import 'package:provider/provider.dart';
class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey=GlobalKey<FormState>();
  final List<String> sugars=['0','1','2','3','4'];
  //Form Values
  late String _currentName='User';
  late String _currentSugars=sugars[0];
  late int _currentStrength=100;
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<Ussers?>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user!.uid).userData,
      builder: (context,snapshot) {
        if(snapshot.hasData) {
          UserData? userdata = snapshot.data;
          return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your Brew Settings',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    initialValue: userdata!.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                    val!.isEmpty
                        ? 'Please enter a name'
                        : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  //DropDown
                  DropdownButtonFormField(
                      decoration: textInputDecoration,
                      //value of drop down button itself
                      value: _currentSugars ?? userdata!.sugars,
                      items: sugars.map((sugar) {
                        return DropdownMenuItem(
                          //tracks value of actual value
                          value: sugar,
                          child: Text('$sugar sugars'),
                        );
                      }).toList(),
                      onChanged: (val) =>
                          setState(() => _currentSugars = val as String)
                  ),
                  SizedBox(height: 20,),
                  //Slider
                  Slider(
                    activeColor: Colors.brown[_currentStrength ?? userdata.strength],
                    inactiveColor: Colors.brown.shade100,
                    min: 100,
                    max: 900,
                    divisions: 8,
                    value: (_currentStrength ?? userdata.strength).toDouble(),
                    onChanged: (val) =>
                        setState(() => _currentStrength = val.round()),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                      ),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentSugars??userdata.sugars,
                              _currentName??userdata.name,
                              _currentStrength??userdata.strength,
                          );
                          Navigator.pop(context);
                        }
                        print(_currentName);
                        print(_currentSugars);
                        print(_currentStrength);
                      },
                      child: Text(
                        'Update', style: TextStyle(color: Colors.white),
                      )
                  )
                ],
              ));
        }
        else{
        return Loading();
        }
      });
  }
}
