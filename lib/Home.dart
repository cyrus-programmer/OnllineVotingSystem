// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:onlinevotingsystem/PersonModel.dart';
import 'package:onlinevotingsystem/controller.dart';

import 'menu_drawer.dart';

class HomePage extends StatefulWidget {
  String? cnic;
  HomePage({Key? key, required this.cnic}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FutureBuilder _getPersonData(BuildContext context) {
    return FutureBuilder(
      future: Controller().getPersonDetails(widget.cnic!),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          PersonModel? data = snapshot.data;
          return _person(data, context);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Container _person(data, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 400.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Name      :     ${data.name}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  width: 70,
                ),
                Text("CNIC NO      :     ${data.identity_number}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 400.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("District      :     ${data.district}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  width: 70,
                ),
                Text("Vote Status      :     ${data.vote_status}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color.fromARGB(255, 21, 153, 65),
      debugShowCheckedModeBanner: false,
      title: "Home",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Personal Details",
            style: TextStyle(fontSize: 24),
          ),
          backgroundColor: Color.fromARGB(255, 16, 70, 23),
          shadowColor: Color.fromARGB(255, 21, 153, 65),
        ),
        drawer: MenuDrawer(cnic: widget.cnic),
        body: Center(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: 400,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 21, 153, 65),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 160),
                child: Text("Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            _getPersonData(context)
          ],
        )),
      ),
    );
  }
}
