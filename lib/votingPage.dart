import 'package:flutter/material.dart';
import 'package:onlinevotingsystem/PartyModel.dart';
import 'package:onlinevotingsystem/classes/party.dart';
import 'package:onlinevotingsystem/controller.dart';
import 'package:onlinevotingsystem/menu_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VotingPage extends StatefulWidget {
  String? cnic;
  VotingPage({Key? key, required this.cnic}) : super(key: key);

  @override
  State<VotingPage> createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {
  @override
  voted(String party_id) {
    Controller obj = new Controller();
    var data = obj.vote(widget.cnic!, party_id);
    if (data["message"] == "Voted Successfully") {
      Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  FutureBuilder _getpartyData(BuildContext context) {
    return FutureBuilder<List<PartyModel>>(
      future: Party().getPartyDetails(),
      builder:
          (BuildContext context, AsyncSnapshot<List<PartyModel>> snapshot) {
        print(snapshot);
        if (snapshot.hasData) {
          List<PartyModel>? data = snapshot.data;
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
                  "${data[index].partyName}",
                  "${data[index].leaderName}",
                  "${data[index].party_id}",
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
              "Party Name : ${title}",
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
                  "Leader Name : ${subtitle}",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 450.0),
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.orangeAccent),
                    onPressed: () {
                      voted(id);
                    },
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RichText(
                          // ignore: prefer_const_constructors
                          text: TextSpan(
                              style: const TextStyle(
                                color: Color.fromARGB(255, 26, 121, 54),
                              ),
                              children: [
                            TextSpan(text: "Vote"),
                            WidgetSpan(
                                child: Icon(
                              Icons.how_to_vote_outlined,
                              color: Color.fromARGB(255, 26, 121, 54),
                            ))
                          ])),
                    )),
              ),
            ],
          )
        ],
      ),
    ));
  }

  // @override
  // @override
  // void initState() {
  //   super.initState();
  //   List<PartyModel> parties1 = _load();
  //   // ignore: unused_local_variable
  //   for (PartyModel p in parties1) {
  //     print(p.leaderName);
  //   }
  // }

  _load() async {
    List<PartyModel> parties = await Party().getPartyDetails();
    return parties;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Online Voting System",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Voting Page",
            style: TextStyle(fontSize: 24),
          ),
          backgroundColor: Color.fromARGB(255, 21, 153, 65),
          shadowColor: Color.fromARGB(255, 16, 70, 23),
        ),
        drawer: MenuDrawer(
          cnic: widget.cnic,
        ),
        body: Center(
          child: _getpartyData(context),
        ),
      ),
    );
  }
}
