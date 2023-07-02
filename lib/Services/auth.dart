import 'package:firebase_auth/firebase_auth.dart';
import 'package:auth/auth.dart';
import 'package:untitled6/Services/database.dart';
import 'package:untitled6/models/user.dart';
class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  //create user obj based on User
  Ussers? _userFromUssers(User user){
    return user != null ? Ussers(uid: user.uid) : null;
  }
  //auth change user stream
  Stream<Ussers?> get user{
    return _auth.authStateChanges().map((User? user)=>_userFromUssers(user!));
        //.map(_userFromUssers) ;
  }

  //Sign in Anon
  Future signInAnon() async{
    try{
    UserCredential result= await _auth.signInAnonymously();//AuthResult
      User? user=result.user ;//FirebaseUser
     //return user;
      return _userFromUssers(user as User);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  //Sign in with email and password
  Future SignwithEmailPassword(String email,String Password) async{
    try{
      UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: Password);
      User? user=result.user;
      return _userFromUssers(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register to email and password
  Future registerwithEmailPassword(String email,String Password) async{
    try{
      UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: Password);
      User? user=result.user;
      //create a new document for the user with uid
      await DatabaseService(uid: user!.uid).updateUserData('0', 'new crew member',100);
      return _userFromUssers(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

}
