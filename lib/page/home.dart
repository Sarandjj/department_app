// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:dep_app/page/about_dep.dart';
import 'package:dep_app/auth/login_page.dart';
import 'package:dep_app/page/event_add.dart';
import 'package:dep_app/page/fac_mem.dart';
import 'package:dep_app/page/result_page.dart';
import 'package:dep_app/page/stu.dart';
import 'package:dep_app/page/syllabus.dart';
import 'package:dep_app/page/time_table.dart';
import 'package:flutter/material.dart';
import 'event.dart';

import 'package:dep_app/helper/helper_function.dart';

import 'package:dep_app/service/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "";
  String email = "";
  String registerno = "";
  AuthService authService = AuthService();

  final bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  // string manipulation
  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperFunctions.getUserNameFromSF().then((val) {
      setState(() {
        userName = val!;
      });
    });
    // getting the list of snapshots in our stream
    await HelperFunctions.getUserRegNoFromSF().then((val) {
      setState(() {
        registerno = val!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SRNMC',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: const Color.fromARGB(255, 10, 8, 124),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'SRI S.RAMASAMY NAIDU MEMORIAL COLLEGE',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                '(An Autonomous and Linguistic Minority Institution,\nRe-Accredited with ‘A++’ Grade by NAAC)',
                style: TextStyle(
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'images/srnmc_logo.png', // replace with your college logo image path
                width: 350,
                height: 350,
              ),
              const SizedBox(height: 20),
              const Text(
                'Department of',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Computer Science',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50),
          children: <Widget>[
            // Icon(
            //   Icons.account_circle,
            //   size: 150,
            //   color: Colors.grey[700],
            // ),
            Image.asset(
              'images/srnmc_logo.png', // replace with your college logo image path
              width: 100,
              height: 120,
            ),
            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Name : $userName",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 7, 16, 97)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Register No : $registerno",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 7, 16, 97)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Email Id : $email",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 21, 162)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FacultyMembersPage()),
                );
              },
              selectedColor: Theme.of(context).primaryColor,
              selected: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              title: const Text(
                "Faculty Details",
                style: TextStyle(color: Color.fromARGB(255, 14, 154, 1)),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StuPage()),
                );
              },
              selectedColor: Theme.of(context).primaryColor,
              selected: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              title: const Text(
                "Student Details",
                style: TextStyle(color: Color.fromARGB(255, 14, 154, 1)),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Syllabus()),
                );
              },
              selectedColor: const Color.fromARGB(255, 135, 17, 214),
              selected: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              title: const Text(
                "Syllabus",
                style: TextStyle(color: Color.fromARGB(255, 14, 154, 1)),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Event()),
                );
              },
              selectedColor: Theme.of(context).primaryColor,
              selected: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              title: const Text(
                "Event",
                style: TextStyle(color: Color.fromARGB(255, 14, 154, 1)),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TimeTable()),
                );
              },
              selectedColor: Theme.of(context).primaryColor,
              selected: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              title: const Text(
                "Time Table",
                style: TextStyle(color: Color.fromARGB(255, 14, 154, 1)),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutDep()),
                );
              },
              selectedColor: Theme.of(context).primaryColor,
              selected: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              title: const Text(
                "About Department",
                style: TextStyle(color: Color.fromARGB(255, 14, 154, 1)),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage()),
                );
              },
              selectedColor: Theme.of(context).primaryColor,
              selected: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              title: const Text(
                "Result",
                style: TextStyle(color: Color.fromARGB(255, 14, 154, 1)),
              ),
            ),

            ListTile(
              onTap: () async {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          "Logout",
                        ),
                        content: const Text("Are you sure you want to logout?"),
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await authService.signOut();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                  (route) => false);
                            },
                            icon: const Icon(
                              Icons.done,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      );
                    });
              },
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              leading: const Icon(Icons.exit_to_app),
              title: const Text(
                "Logout",
                style: TextStyle(color: Color.fromARGB(255, 238, 0, 0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
