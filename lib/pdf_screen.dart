
// ignore_for_file: depend_on_referenced_packages, unnecessary_string_interpolations, use_build_context_synchronously, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PdfViewerScreen extends StatefulWidget {
  final String pdfFileName;
  final String pdfPathName;

  const PdfViewerScreen({super.key, required this.pdfFileName, required this.pdfPathName});

  @override
  // ignore: library_private_types_in_public_api
  _PdfViewerScreenState createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  bool _isLoading = true;
  String _pdfPath = '';
  int _currentPage = 0;
  int _totalPages = 0;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    final directory = await getTemporaryDirectory();
    final localFile = File('${directory.path}/${widget.pdfFileName}');
    final ref = FirebaseStorage.instance
        .ref()
        .child('${widget.pdfPathName}')
        .child('${widget.pdfFileName}');
    bool fileExists = await localFile.exists();

    if (fileExists) {
      setState(() {
        _isLoading = false;
        _pdfPath = localFile.path;
      });
    } else {
      try {
        await ref.writeToFile(localFile);
        setState(() {
          _isLoading = false;
          _pdfPath = localFile.path;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error loading file.'),
        ));
      }
    }
  }


  Future<void> _downloadPdf() async {
    final directory = await getExternalStorageDirectory();
    final localFile = File('${directory!.path}/${widget.pdfFileName}');
    final ref = FirebaseStorage.instance
        .ref()
        .child('pdfs')
        .child('${widget.pdfFileName}');
    bool fileExists = await localFile.exists();

    if (fileExists) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('File already downloaded.'),
      ));
      setState(() {
        _isLoading = false;
        _pdfPath = localFile.path;
      });
    } else {
      try {
        await ref.writeToFile(localFile);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('File downloaded to Downloads folder.'),
        ));
        setState(() {
          _isLoading = false;
          _pdfPath = localFile.path;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error downloading file.'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pdfFileName),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: _downloadPdf,
          )
        ],
        backgroundColor: const Color.fromARGB(255, 25, 6, 132),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: <Widget>[
                Expanded(
                  child: PDFView(
                    filePath: _pdfPath,
                    enableSwipe: true,
                    swipeHorizontal: true,
                    autoSpacing: true,
                    pageFling: true,
                    onError: (e) {
                      print(e);
                    },
                    onPageChanged: (int? page, int? total) {
                      setState(() {
                        _currentPage = page ?? 0;
                        _totalPages = total ?? 0;
                      });
                    },
                  ),
                ),
                Container(
                  color: Colors.grey[300],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: _currentPage > 0
                            ? () {
                                print("$_totalPages");
                                setState(() {
                                  _currentPage -= 1;
                                });
                              }
                            : null,
                      ),
                      Text('Page ${_currentPage + 1} of $_totalPages'),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: _currentPage < _totalPages - 1
                            ? () {
                                setState(() {
                                  _currentPage += 1;
                                });
                              }
                            : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
