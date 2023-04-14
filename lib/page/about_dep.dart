import 'package:flutter/material.dart';

class AboutDep extends StatefulWidget {
  const AboutDep({super.key});

  @override
  State<AboutDep> createState() => _AboutDepState();
}

class _AboutDepState extends State<AboutDep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Department',
          style: TextStyle(color: Color.fromARGB(235, 255, 255, 255)),
        ),
        backgroundColor: const Color.fromRGBO(25, 6, 109, 1),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(
              0.0,
            ),
            child: Image.asset(
              "images/dep_photos.png",
              height: 300,
              width: 600,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(2.0),
            child: Text(
              'About the Department:',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 70, 144, 67)),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'The Department of Computer Science was started in the Academic year 1988-89 to provide quality education for making the students competent to enter into the Global IT World as well as in the field of Research and Development with high moral, ethical and professional standards. It possesses dedicated and committed faculty members with rich experience and offers B.Sc, M.Phil and Ph.D. courses. These curriculum are well organized to provide a wide spectrum of choices to the student. The Department has well-equipped labs with latest configuration.',
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Vision:',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 70, 144, 67)),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'To renovate the rural students into high quality Software Professionals & Technologists by affording practical training as well as ethical and moral values',
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Mission:',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 70, 144, 67)),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'To offer strong theoretical foundation harmonized with extensive practical training.\nTo revamp the rural students into innovative, competent and high quality Computer professionals.\nTo enrich the talents of students to keep pace with the current industrial trends.\nTo provide the students with best job opportunities and environment for quality education, professional competencies and life skills.\nTo support students for their career development, professional growth and to sustain in lifelong learning.',
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Year of Establishment',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 70, 144, 67)),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'UG : 1988\nPG : 1999\nM.Phil : 2017\nPh.D. : 2018',
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16.0),
        ]),
      ),
    );
  }
}
