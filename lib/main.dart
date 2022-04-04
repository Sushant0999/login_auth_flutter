import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_auth/pages/signup.dart';
import 'package:login_auth/pages/home.dart';
import 'package:login_auth/pages/login.dart';
import 'package:login_auth/pages/forget.dart';
import 'package:login_auth/utils/routes.dart';
import 'package:provider/provider.dart';
import 'package:login_auth/pages/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return
    return MultiProvider(
      providers: [
        Provider<Auth>(create: (_) => Auth(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) => context.read<Auth>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthWrapper(),
        routes: {
          MyRoute.homeRoute: (context) => const Home(),
          MyRoute.loginRoute: (context) => const Login(),
          MyRoute.forgetRoute: (context) => const Forget(),
          MyRoute.signupRoute: (context) => const Signup(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    // ignore: unnecessary_null_comparison
    if (firebaseUser != null) {
      return const Home();
    }
    return const Login();
  }
}
