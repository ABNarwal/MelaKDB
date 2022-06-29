import 'package:flutter/material.dart';
import 'package:mgmt/pages/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();
  final nameEC = new TextEditingController();
  final emailEC = new TextEditingController();
  final passwordEC = new TextEditingController();
  final cnfpasswordEC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //name
    final nameField = TextFormField(
      autofocus: false,
      controller: nameEC,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Name can't be empty";
        }
      },
      onSaved: (value) {
        nameEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter Name",
        labelText: "Name",
      ),
    );

    //email
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEC,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Email can't be empty";
        }
      },
      onSaved: (value) {
        emailEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter Email",
        labelText: "Email",
      ),
    );

    //pasword
    final passwordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: passwordEC,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password can't be empty";
        }
      },
      onSaved: (value) {
        passwordEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter Password",
        labelText: "Password",
      ),
    );

    //confirm pasword
    final cnfpasswordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: cnfpasswordEC,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password can't be empty";
        }
      },
      onSaved: (value) {
        cnfpasswordEC.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        hintText: "confirm Password",
        labelText: "Confirm Password",
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Page'),
        backgroundColor: Color(0xff4a4e69),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text("Sign up, New User"),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      nameField,
                      const SizedBox(
                        height: 20,
                      ),
                      emailField,
                      const SizedBox(
                        height: 20,
                      ),
                      passwordField,
                      const SizedBox(
                        height: 20,
                      ),
                      cnfpasswordField,
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Material(
                        color: Color(0xff4a4e69),
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {},
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: 300,
                            height: 50,
                            // decoration: BoxDecoration(
                            //     color: Colors.deepPurple,
                            //     borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
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
}
