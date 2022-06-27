import 'package:draggablelist_toy/pages/dragAndDropLists.dart';
import 'package:draggablelist_toy/pages/reorderableList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Router'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.to(ReorderableListViewPage());
              },
              child: const Text("ReorderableListView Class"),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(DragAndDropListPage());
                },
                child: const Text("Drag and Drop List Package <Deprecated>"),
                style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                ),
          ],
        ),
      ),
    );
  }
}
