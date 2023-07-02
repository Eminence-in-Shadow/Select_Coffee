import 'package:flutter/material.dart';
import 'package:untitled6/Screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled6/Services/auth.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/models/user.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Ussers?>.value(
      value: AuthService().user,
      catchError: (context, error) => null,
      initialData: null,
      child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.brown,
            ),
            home: const Wrapper(),
    ),);
  }
}
