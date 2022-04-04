import 'package:flutter/material.dart';
import 'package:login_auth/pages/auth.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              context.read<Auth>().signOff();
            },
            icon: Icon(Icons.logout_rounded))
      ]),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
