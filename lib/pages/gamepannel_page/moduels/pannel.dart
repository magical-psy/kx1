import 'package:flutter/material.dart';

class Pannel extends StatefulWidget {
  Pannel({Key key}) : super(key: key);

  @override
  State<Pannel> createState() => _PannelState();
}

class _PannelState extends State<Pannel> {
  List<int> _dragData = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return _buildMap();
  }

  _buildMap() {
    return GridView.builder(
      itemCount: 9,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(3),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: MediaQuery.of(context).size.width * 1 / 40,
        crossAxisSpacing: MediaQuery.of(context).size.width * 1 / 8,
      ),
      itemBuilder: (context, index) {
        return DragTarget<int>(
          builder: (BuildContext context, List<dynamic> candidateData,
              List<dynamic> rejectedData) {
            print('candidateData:$candidateData,rejectedData:$rejectedData');
            return _dragData[index] == 0
                ? Container(
                    height: MediaQuery.of(context).size.width * 1 / 8,
                    width: MediaQuery.of(context).size.width * 1 / 8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red)),
                  )
                : Container(
                    height: MediaQuery.of(context).size.width * 1 / 8,
                    width: MediaQuery.of(context).size.width * 1 / 8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      _dragData[index].toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
          },
          onWillAccept: (int color) {
            print('onWillAccept:$color');
            return true;
          },
          onAccept: (int something) {
            setState(() {
              _dragData[index] = 4;
            });
            print('onAccept:$something');
          },
          onLeave: (int color) {
            print('onLeave:$color');
          },
        );
      },
    );
  }
}

class NumSource extends StatefulWidget {
  int data = 0;
  NumSource({Key key, this.data}) : super(key: key);

  @override
  State<NumSource> createState() => _NumSourceState();
}

class _NumSourceState extends State<NumSource> {
  @override
  Widget build(BuildContext context) {
    void update_data(int randomnum) {
      setState(() {
        widget.data = randomnum;
      });
    }

    return Draggable<int>(
      data: widget.data,
      child: Container(
        height: MediaQuery.of(context).size.width * 1 / 7,
        width: MediaQuery.of(context).size.width * 1 / 7,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(10)),
        child: Text(
          widget.data.toString(),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      feedback: Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: DefaultTextStyle.merge(
          style: TextStyle(color: Colors.white, fontSize: 18),
          child: Text(
            'moving',
          ),
        ),
      ),
    );
  }
}
