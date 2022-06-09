// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import 'package:onlinevotingsystem/controller.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  register() async {
    Controller obj = Controller();
    var result = await obj.register(_controller.text, _controller1.text);
    if (result["Success"] == true) {
      Navigator.pop(context);
    }
    if (result["Message"] == "Successfully Registered") {
      Fluttertoast.showToast(
          msg: "Registered Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
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
                "Register",
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
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 7,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 21, 153, 65),
                        ),
                        onPressed: () {
                          register();
                        },
                        child: const Text("Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ))),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 7,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 21, 153, 65),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ))),
                ],
              )
            ]),
          ),
        );
      }),
    );
  }
}
