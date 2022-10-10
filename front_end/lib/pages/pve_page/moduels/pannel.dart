import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_gorgeous_login/pages/pvp_page/provider/PvPprovider.dart';

class Pannel extends StatefulWidget {
  int position; // position 0 means the upper mat and the possition 1
  Pannel({Key key, this.position}) : super(key: key);

  @override
  State<Pannel> createState() => _PannelState();
}

class _PannelState extends State<Pannel> {
  @override
  Widget build(BuildContext context) {
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
        final data = Provider.of<PvPData>(context, listen: true);
        return DragTarget<int>(
          builder: (BuildContext context, List<dynamic> candidateData,
              List<dynamic> rejectedData) {
            return (widget.position == 0 ? data.upMat : data.downMat)[index] ==
                    0
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
                      (widget.position == 0 ? data.upMat : data.downMat)[index]
                          .toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
          },
          // onWillAccept: (int something) {
          //   print('onWillAccept:$something');
          //   return true;
          // },
          onAccept: (int something) {
            if ((widget.position == 0 ? data.upMat : data.downMat)[index] ==
                    0 &&
                data.turn == widget.position) {
              setState(() {
                (widget.position == 0 ? data.upMat : data.downMat)[index] =
                    something;
                data.updatemat(
                    widget.position,
                    (widget.position == 0 ? data.upMat : data.downMat),
                    index,
                    context);
                print((widget.position == 0 ? data.upMat : data.downMat));
              });
              print('onAccept:$something');
            }
          },
          // onLeave: (int something) {
          //   print('onLeave:$something');
          // },
        );
      },
    );
  }
}

class NumSource extends StatefulWidget {
  NumSource({Key key}) : super(key: key);

  @override
  State<NumSource> createState() => _NumSourceState();
}

class _NumSourceState extends State<NumSource> {
  @override
  Widget build(BuildContext context) {
    final gamedata = Provider.of<PvPData>(context, listen: true);
    if (gamedata.turn == 2) {
      return Container(
        height: MediaQuery.of(context).size.width * 1 / 7,
        width: MediaQuery.of(context).size.width * 1 / 7,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: DefaultTextStyle.merge(
          style: TextStyle(color: Colors.white, fontSize: 18),
          child: Text("0"),
        ),
      );
    }

    return Draggable<int>(
      data: gamedata.getNum,
      child: Container(
        height: MediaQuery.of(context).size.width * 1 / 7,
        width: MediaQuery.of(context).size.width * 1 / 7,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(10)),
        child: Text(
          gamedata.getNum.toString(),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      feedback: Container(
        height: MediaQuery.of(context).size.width * 1 / 7,
        width: MediaQuery.of(context).size.width * 1 / 7,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: DefaultTextStyle.merge(
          style: TextStyle(color: Colors.white, fontSize: 18),
          child: Text(gamedata.getNum.toString()),
        ),
      ),
    );
  }
}
