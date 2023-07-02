import 'package:flutter/material.dart';
import 'package:untitled6/Services/auth.dart';
import 'package:untitled6/Shared/loading.dart';
class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});
  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  final AuthService _auth=AuthService();
  final _formKEy=GlobalKey<FormState>();
  bool loading=false;
  //Text field State
  String email=" ";
  String Password=" ";
  String error=" ";
  @override
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        title: const Text('Sign in to  Brew Crew'),
        backgroundColor: Colors.brown.shade400,
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(onPressed: (){
            widget.toggleView();
          },
              icon: Icon(Icons.person),
              label: Text('Sign in'))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 50),
        child:
        Center(
          child: Form(
            key:_formKEy,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration:InputDecoration(
                    hintText: 'Email',
                    fillColor: Colors.white,
                    filled:  true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 2.0)
                    ),
                      focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink,width: 2.0)
                )
                  ),
                  validator: (val)=> val!.isEmpty ?'Enter an Email':null,
                  onChanged: (val){
                    setState(() {
                      email=val;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration:InputDecoration(
                      hintText: 'Password',
                      fillColor: Colors.white,
                      filled:  true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white,width: 2.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink,width: 2.0)
                      )
                  ),
                  validator: (val)=> val!.length<6 ?'Enter a Password 6+chars long':null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() {
                      Password=val;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                ElevatedButton(
                    onPressed: ()async{
                      if(_formKEy.currentState!.validate()){
                        setState(() {
                          loading=true;
                        });
                        print(email);
                        print(Password);
                      dynamic result=await _auth.registerwithEmailPassword(email,Password);
                      if(result==null){
                        setState(() {
                          error='please supply a valid email';
                          loading=false;
                        });
                        }

                      }

                    },
                    child: Text('Register',style: TextStyle(color: Colors.white),
                    )
                ),
                SizedBox(height: 11,),
                Text(
                  error,style: TextStyle(color: Colors.red,fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
