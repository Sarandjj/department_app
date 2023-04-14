
import 'package:flutter/material.dart';
import 'package:dep_app/pdf_screen.dart';

//import 'package:dep_app/pdf_viewer_screen.dart';

class ResultPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String result = 'result';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Page'),
        backgroundColor: const Color.fromARGB(255, 11, 5, 124),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Enter your roll number',
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final rollNum = _controller.text.trim().toUpperCase();
                if (rollNum.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a valid roll number')),
                  );
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfViewerScreen(
                        pdfFileName: '$rollNum.pdf', pdfPathName: result),
                  ),
                ).catchError((error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('No result found for this roll number')),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 21, 4, 113),
              ),
              child: const Text('View Result'),
//style: ButtonStyle(iconColor: const Color.fromARGB(0, 0,0,0)),
            ),
          ],
        ),
      ),
    );
  }
}
