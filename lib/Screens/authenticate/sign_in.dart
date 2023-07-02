import 'package:flutter/material.dart';
import 'package:untitled6/Services/auth.dart';
import 'package:untitled6/Shared/constraints.dart';
import 'package:untitled6/Shared/loading.dart';
class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  final AuthService _auth=AuthService();
  final _formKEy=GlobalKey<FormState>();
  bool loading =false;
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
              label: Text('Register'))
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
                  decoration:textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val)=> val!.isEmpty ?'Enter an Email':null,
                  onChanged: (val){
                    setState(() {
                      email=val;
                    });
                    },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration:textInputDecoration.copyWith(hintText: 'Password'),
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
                    //color:Colors.pink.shade400,
                    onPressed: ()async{
                      if(_formKEy.currentState!.validate()){
                        setState(() => loading=true);
                        dynamic result=await _auth.SignwithEmailPassword(email, Password);
                        print('valid');
                        if(result==null){
                          setState(() {
                            error='COULD NOT SIGN IN WITH THOSE CREDENTIALS';
                            loading=false;
                          });

                        }
                      }
                     },
                    child: Text('Sign in',style: TextStyle(color: Colors.white),
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
