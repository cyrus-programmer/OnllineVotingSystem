import 'package:flutter/material.dart';
import 'package:onlinevotingsystem/controller.dart';
import 'package:onlinevotingsystem/menu_drawer.dart';
import 'package:onlinevotingsystem/province.dart';

class ResultPage extends StatefulWidget {
  String cnic;
  ResultPage({Key? key, required this.cnic}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool check = false;
  Future<String>? lead;
  FutureBuilder _getResultData(BuildContext context) {
    return FutureBuilder<List<ProvinceModel>>(
      future: Controller().trigger(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProvinceModel>> snapshot) {
        if (snapshot.hasData) {
          List<ProvinceModel>? data = snapshot.data;
          return _parties(data, context);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListView _parties(data, BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
              child: _tile(
                  "${data[index].province_id}",
                  "${data[index].province_name}",
                  "${data[index].leading_party}",
                  context));
        });
  }

  InkWell _tile(
      String title, String subtitle, String id, BuildContext context) {
    return InkWell(
        child: Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 26, 121, 54),
          borderRadius: BorderRadius.circular(30)),
      height: MediaQuery.of(context).size.height / 9,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text(
              "Province Name : ${subtitle}",
              style: TextStyle(
                fontSize: 24,
                color: Colors.orangeAccent,
              ),
            ),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 550.0),
                child: Text(
                  "Leading Party : ${subtitle}",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }

  load(BuildContext context) async {
    check = await Controller().resultCheck();
    if (check == false) {
      return Text("Wait till all the people vote");
    } else {
      _getResultData(context);
    }
  }

  @override
  void initState() {
    super.initState();
    lead = Controller().calcuateLeader();
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
                "Results",
                style: TextStyle(fontSize: 24),
              ),
              backgroundColor: Color.fromARGB(255, 16, 70, 23),
              shadowColor: Color.fromARGB(255, 21, 153, 65),
            ),
            drawer: MenuDrawer(cnic: widget.cnic),
            body: Center(
              child: Column(children: [
                Text(
                  "Leader is ${lead}",
                  style: TextStyle(
                      color: Color.fromARGB(255, 21, 153, 65), fontSize: 24),
                ),
                _getResultData(context)
              ]),
            )));
  }
}
