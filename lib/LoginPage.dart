// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:onlinevotingsystem/Home.dart';
import 'package:onlinevotingsystem/controller.dart';

import 'package:onlinevotingsystem/register.dart';
import 'package:onlinevotingsystem/votingPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  verifyUser(BuildContext context) async {
    Controller obj = Controller();
    var result = await obj.loginCheck(_controller.text, _controller1.text);
    if (result["success"] == true) {
      if (result["type"] == "voter") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      cnic: _controller.text,
                    )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Online Voting System",
      color: Color.fromARGB(255, 62, 16, 70),
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Online Voting System",
              style: TextStyle(fontSize: 18),
            ),
            backgroundColor: Color.fromARGB(255, 21, 153, 65),
            shadowColor: Color.fromARGB(255, 16, 70, 23),
          ),
          body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Login",
                style: TextStyle(
                    color: Color.fromARGB(255, 21, 153, 65), fontSize: 30),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 30,
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Identity Number",
                        prefix: Padding(
                          padding: const EdgeInsets.all(4),
                        )),
                    maxLength: 14,
                    keyboardType: TextInputType.text,
                    controller: _controller,
                  )),
              Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefix: Padding(
                          padding: const EdgeInsets.all(4),
                        )),
                    keyboardType: TextInputType.text,
                    controller: _controller1,
                    obscureText: true,
                  )),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                        color: Colors.blue[800],
                        decoration: TextDecoration.underline),
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 7,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 21, 153, 65),
                    ),
                    onPressed: () {
                      verifyUser(context);
                    },
                    child: const Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ))),
              )
            ]),
          ),
        );
      }),
    );
  }
}
