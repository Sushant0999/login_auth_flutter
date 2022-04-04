import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_auth/pages/auth.dart';
import 'package:login_auth/utils/routes.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Image(
              height: 150,
              width: 400,
              image: AssetImage('asset/image/login.png'),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: const Text(
                'Proceed with your',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: const Text(
                'Login ',
                style: TextStyle(fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    context.read<Auth>().signIn(
                        email: emailController.text,
                        password: passwordController.text);
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoute.forgetRoute);
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('New User?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoute.signupRoute);
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
