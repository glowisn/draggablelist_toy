import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class DraggablePage extends StatefulWidget {
  const DraggablePage({Key? key}) : super(key: key);

  @override
  State<DraggablePage> createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  int fieldData = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Draggable Unit Test"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  fieldData = 0;
                });
              },
              icon: const Icon(Icons.restore))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: _draggables,
            ),
            DragTarget<int>(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.cyan,
                  child: Center(
                    child: Text('Data : $fieldData'),
                  ),
                );
              },
              onAccept: (int data) {
                setState(() {
                  fieldData += data;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  final List<Widget> _draggables = <Widget>[
    Draggable<int>(
      data: 1,
      feedback: Container(
        color: const Color.fromARGB(255, 65, 107, 18),
        height: 50,
        width: 50,
        child: const Text(
          "Item 1",
          style: TextStyle(fontSize: 14),
        ),
      ),
      child: Container(
        color: Colors.lightGreen,
        height: 50,
        width: 50,
        child: Text("Item 1"),
      ),
      childWhenDragging: Container(
        color: Colors.lightGreenAccent,
        height: 50,
        width: 50,
        child: Text("Item 1"),
      ),
    ),
    Draggable<int>(
      data: 2,
      feedback: Container(
        color: Color.fromARGB(255, 107, 24, 18),
        height: 50,
        width: 50,
        child: const Text(
          "Item 2",
          style: TextStyle(fontSize: 14),
        ),
      ),
      child: Container(
        color: Colors.red,
        height: 50,
        width: 50,
        child: Text("Item 2"),
      ),
      childWhenDragging: Container(
        color: Colors.redAccent,
        height: 50,
        width: 50,
        child: Text("Item 2"),
      ),
    ),
  ];
}
