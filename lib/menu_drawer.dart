import 'package:flutter/material.dart';
import 'package:onlinevotingsystem/Home.dart';
import 'package:onlinevotingsystem/result.dart';
import 'package:onlinevotingsystem/values/colors.dart';
import 'package:onlinevotingsystem/votingPage.dart';

import 'LoginPage.dart';

class MenuDrawer extends StatefulWidget {
  String? cnic;
  MenuDrawer({Key? key, required this.cnic}) : super(key: key);

  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 21, 153, 65),
                      Color.fromARGB(255, 16, 70, 23),
                    ]),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 18.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6.0),
                      Column(
                        children: [
                          Container(
                            child: ListTile(
                              leading: const Icon(
                                Icons.dashboard,
                                color: Colors.white,
                              ),
                              title: Text(
                                "Home",
                                style:
                                    TextStyle(color: AppColors.foreGroundColor),
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(cnic: widget.cnic))),
                              selected: true,
                            ),
                          ),
                          Container(
                            child: ListTile(
                              leading: const Icon(
                                Icons.dashboard,
                                color: Colors.white,
                              ),
                              title: Text(
                                "Voting Page",
                                style:
                                    TextStyle(color: AppColors.foreGroundColor),
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VotingPage(
                                            cnic: widget.cnic,
                                          ))),
                              selected: true,
                            ),
                          ),
                          Container(
                            child: ListTile(
                              leading: const Icon(
                                Icons.content_paste_search_sharp,
                                color: Colors.white,
                              ),
                              title: Text(
                                "Result",
                                style:
                                    TextStyle(color: AppColors.foreGroundColor),
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultPage(
                                            cnic: widget.cnic!,
                                          ))),
                              selected: true,
                            ),
                          ),
                          Divider(
                            color: AppColors.shadowColor,
                          ),
                          Container(
                            child: ListTile(
                              leading: const Icon(
                                Icons.logout_rounded,
                                color: Colors.white,
                              ),
                              title: Text("Log Out",
                                  style: TextStyle(
                                      color: AppColors.foreGroundColor)),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage())),
                              selected: true,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
