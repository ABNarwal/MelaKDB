import 'package:http/http.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mgmt/main.dart';
import 'package:flutter/material.dart';
import 'package:mgmt/pages/home.dart';
import 'package:mgmt/pages/profile.dart';
import 'package:mgmt/pages/register.dart';
import 'package:mgmt/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  final emailEC = new TextEditingController();
  final passwordEC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailfield = TextFormField(
      autofocus: false,
      controller: emailEC,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "username cant be empty";
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter email",
        labelText: "email",
      ),
    );

    final passwordfield = TextFormField(
      autofocus: false,
      controller: passwordEC,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return "password cant be empty";
        }
        if (!regex.hasMatch(value)) {
          return ("password not valid");
        }
      },
      onSaved: (value) {
        passwordEC.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        hintText: "enter password",
        labelText: "password",
      ),
    );

    final loginbutton = Material(
      color: Color(0xff4a4e69),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          signIn(emailEC.text, passwordEC.text);
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: changebutton ? 75 : 300,
          height: 50,
          alignment: Alignment.center,
          child: const Text(
            'Login',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );

    final googleSignIn = Material(
      color: Color(0xff999999),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          signup(context);
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: changebutton ? 75 : 300,
          height: 50,
          alignment: Alignment.center,
          child: const Text(
            'Google Sign Up',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Color(0xff4a4e69),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const Text(
                  "Welcome",
                  // ignore: prefer_const_constructors
                  style: (TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      emailfield,
                      passwordfield,
                      const SizedBox(
                        height: 50,
                      ),
                      loginbutton,
                      const SizedBox(
                        height: 10,
                      ),
                      googleSignIn,
                      // Obx(() {
                      //   if (googlecontroller.googleAccount.value == null)
                      //     return ProfilePage();
                      //   else
                      //     return HomePage();
                      // }),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
