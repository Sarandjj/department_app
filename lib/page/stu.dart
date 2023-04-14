import 'package:flutter/material.dart';
//import 'package:flutter_pdf_viewer/flutter_pdf_viewer.dart';

//import 'stu_pdf.dart';

class StuPage extends StatefulWidget {
  const StuPage({Key? key}) : super(key: key);

  @override
  State<StuPage> createState() => _Stu();
}

class _Stu extends State<StuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sudent Details"),
          backgroundColor: const Color.fromARGB(255, 4, 23, 130),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "I Year",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Boys:20",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Girls:26",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "II Year",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Boys:13",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: Text(
                    "Girls:30",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "III Year",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Boys:13",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Girls:30",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
