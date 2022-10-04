import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

class Pannel extends StatefulWidget {
  Pannel({Key key}) : super(key: key);

  @override
  State<Pannel> createState() => _PannelState();
}

class _PannelState extends State<Pannel> {
  List<Widget> _tiles;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _iconSize = MediaQuery.of(context).size.width * 1 / 6;
    _tiles = <Widget>[
      Icon(Icons.filter_1, size: _iconSize),
      Icon(Icons.filter_2, size: _iconSize),
      Icon(Icons.filter_3, size: _iconSize),
      Icon(Icons.filter_4, size: _iconSize),
      Icon(Icons.filter_5, size: _iconSize),
      Icon(Icons.filter_6, size: _iconSize),
      Icon(Icons.filter_7, size: _iconSize),
      Icon(Icons.filter_8, size: _iconSize),
      Icon(Icons.filter_9, size: _iconSize),
    ];
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _tiles.removeAt(oldIndex);
        _tiles.insert(newIndex, row);
      });
    }

    var wrap = ReorderableWrap(
        maxMainAxisCount: 3,
        spacing: 8.0,
        runSpacing: 4.0,
        padding: const EdgeInsets.all(8),
        children: _tiles,
        onReorder: _onReorder,
        onNoReorder: (int index) {
          //this callback is optional
          debugPrint(
              '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
        },
        onReorderStarted: (int index) {
          //this callback is optional
          debugPrint(
              '${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
        });

    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        wrap,
        // ButtonBar(
        //   alignment: MainAxisAlignment.start,
        //   children: <Widget>[
        //     IconButton(
        //       iconSize: 50,
        //       icon: Icon(Icons.add_circle),
        //       color: Colors.deepOrange,
        //       padding: const EdgeInsets.all(0.0),
        //       onPressed: () {
        //         var newTile = Icon(Icons.filter_9_plus, size: _iconSize);
        //         setState(() {
        //           _tiles.add(newTile);
        //         });
        //       },
        //     ),
        //     IconButton(
        //       iconSize: 50,
        //       icon: Icon(Icons.remove_circle),
        //       color: Colors.teal,
        //       padding: const EdgeInsets.all(0.0),
        //       onPressed: () {
        //         setState(() {
        //           _tiles.removeAt(0);
        //         });
        //       },
        //     ),
        //   ],
        // ),
      ],
    );

    return SingleChildScrollView(
      child: column,
    );
  }
}
