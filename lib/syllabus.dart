import 'package:dep_app/pdf_screen.dart';
import 'package:flutter/material.dart';

//import 'stu_pdf.dart';
class Syllabus extends StatefulWidget {
  const Syllabus({Key? key}) : super(key: key);

  @override
  State<Syllabus> createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    const String pdf = 'pdfs';
    return Scaffold(
        appBar: AppBar(
          title: const Text("Syllbuse"),
          backgroundColor: const Color.fromARGB(255, 19, 6, 102),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PdfViewerScreen(
                              pdfFileName: 'B.sc(Syllabus).pdf',
                              pdfPathName: 'pdfs'),
                        ),
                      );
                    },
                    child: Container(
                      height: 70,
                      width: 350,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 22, 13, 120),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'B.Sc Computer Science',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PdfViewerScreen(
                              pdfFileName: 'M.sc(Syllabus).pdf',
                              pdfPathName: 'pdfs'),
                        ),
                      );
                    },
                    child: Container(
                      height: 70,
                      width: 350,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 19, 4, 118),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'M.Sc Computer Science',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
