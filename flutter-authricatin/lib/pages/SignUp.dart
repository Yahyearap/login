import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mylogin_191/pages/login.dart';

import '../utility/imagewidget.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _fullname = TextEditingController();

  final _email = TextEditingController();

  final _password = TextEditingController();

  bool isloading = false;

  register() async {
    try {
      isloading = true;
      setState(() {});
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text, password: _password.text);
    } catch (e) {
      log(e.toString());
    }
    isloading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          ImageWidget(
            ImageAsset: 'images/signup.png',
            ImageHeight: 250,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
            child: Container(
              width: double.infinity,
              height: 450,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Sign Up',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: 'Email ID',
                      prefixIcon: Icon(
                        Icons.alternate_email_outlined,
                      ),
                    ),
                    // controller: email,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                        ),
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _fullname,
                    decoration: InputDecoration(
                      hintText: 'Full name',
                      prefixIcon: Icon(
                        Icons.perm_identity_rounded,
                      ),
                    ),
                    // controller: fullname,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    child: MaterialButton(
                      color: Color.fromARGB(227, 39, 94, 223),
                      minWidth: double.infinity,
                      height: 65,
                      onPressed: () {
                        register();
                      },
                      child: isloading
                          ? CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            )
                          : Text('REGISTOR'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Now Login? ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => LoginPage()),
                              ));
                        },
                        child: Text('LOGIN',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 28, 79, 248),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
