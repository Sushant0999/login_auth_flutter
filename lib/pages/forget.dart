import 'package:flutter/material.dart';

class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          const Image(
            height: 200,
            width: 400,
            image: AssetImage('asset/image/forget.png'),
          ),
          const SizedBox(
            child: Text(
              'Enter Registered Email',
              style: TextStyle(fontSize: 20),
            ),
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  RegExp regExp = RegExp(r'^.{6,10}$');
                  if (value!.isEmpty) {
                    return ("Required Password");
                  }
                  if (!regExp.hasMatch(value)) {
                    return ("Please Enter Min. 6 Characters and Max. 10");
                  }
                },
                autofocus: false,
                textInputAction: TextInputAction.done,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                setState(() async {
                  // signIn(emailController.text, passController.text);
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
        ],
      ),
    );
  }
}
