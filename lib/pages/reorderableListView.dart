import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReorderableListViewPage extends StatefulWidget {
  const ReorderableListViewPage({Key? key}) : super(key: key);

  @override
  State<ReorderableListViewPage> createState() =>
      _ReorderableListViewPageState();
}

class _ReorderableListViewPageState extends State<ReorderableListViewPage> {
  final List<int> _items = List<int>.generate(50, (int index) => index);
  bool _isOnReorderMode = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return Scaffold(
      appBar: AppBar(
        title: const Text("RLV widget test page"),
        actions: <Widget>[
          if (_isOnReorderMode)
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                setState(() {
                  _isOnReorderMode = false;
                });
              },
            )
          else
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                setState(() {
                  _isOnReorderMode = true;
                });
              },
            )
        ],
      ),
      body: _isOnReorderMode
          ? ReorderableListView(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              children: <Widget>[
                for (int index = 0; index < _items.length; index += 1)
                  ListTile(
                    key: Key('$index'),
                    tileColor:
                        _items[index].isOdd ? oddItemColor : evenItemColor,
                    title: Text('Item ${_items[index]}'),
                    trailing: const Icon(Icons.menu),
                  ),
              ],
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final int item = _items.removeAt(oldIndex);
                  _items.insert(newIndex, item);
                });
              },
            )
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              children: <Widget>[
                for (int index = 0; index < _items.length; index += 1)
                  ListTile(
                    key: Key('$index'),
                    tileColor:
                        _items[index].isOdd ? oddItemColor : evenItemColor,
                    title: Text('Item ${_items[index]}'),
                    onLongPress: () {
                      if (!_isOnReorderMode) {
                        setState(() {
                          _isOnReorderMode = true;
                        });
                      }
                    },
                  ),
              ],
            ),
    );
  }
}
