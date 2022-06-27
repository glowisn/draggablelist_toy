import 'package:flutter/material.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:drag_and_drop_lists/drag_and_drop_item.dart';

class DragAndDropListPage extends StatefulWidget {
  const DragAndDropListPage({Key? key}) : super(key: key);

  @override
  State<DragAndDropListPage> createState() => _DragAndDropListPageState();
}

class _DragAndDropListPageState extends State<DragAndDropListPage> {
  late List<DragAndDropList> _contents;

  @override
  void initState() {
    super.initState();

    _contents = List.generate(10, (index) {
      return DragAndDropList(
        //header: Text('Header $index'),

        // children: <DragAndDropItem>[
        //   DragAndDropItem(
        //     child: Text('$index.1'),
        //   ),
        //   DragAndDropItem(
        //     child: Text('$index.2'),
        //   ),
        //   DragAndDropItem(
        //     child: Text('$index.3'),
        //   ),
        // ],

        children: <DragAndDropItem>[
          DragAndDropItem(
            child: Container(
              color: Colors.blue,
              child: Center(child:Text('Item $index'),),
            ),
          ),
        ],
      );
    });
  }

  _onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
      _contents[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _contents.removeAt(oldListIndex);
      _contents.insert(newListIndex, movedList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Drag and Drop Lists Package test <Deprecated>")),
      body: DragAndDropLists(
        children: _contents,
        onItemReorder: _onItemReorder,
        onListReorder: _onListReorder,
      ),
    );
  }
}
