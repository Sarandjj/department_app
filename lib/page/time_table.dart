import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time Table"),
      ),
    body: PhotoView(imageProvider: const AssetImage('images/Time_tabel.png'),),
    
    
    );
  }
}
