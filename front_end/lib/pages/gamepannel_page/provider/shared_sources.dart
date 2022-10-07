import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameData with ChangeNotifier {
  int turn = 0;
  int uppoint = 0;
  int downpoint = 0;
  int randomNum = 0;
  List<int> updata = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<int> downdata = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  int get getNum => randomNum;
  List<int> get upMat => updata;
  List<int> get downMat => downdata;

  void getnum() {
    randomNum = Random().nextInt(6) + 1;
    notifyListeners();
    print(randomNum);
  }

  int updatePoint(List<int> mat) {
    int point = 0;
    for (int i = 0; i < 3; i++) {
      List<int> count = [mat[i], mat[3 + i], mat[6 + i]];
      count.sort();
      if (count[0] == count[1]) {
        //all of the three
        if (count[1] == count[2]) {
          point += 9 * count[0];
        }
        //the first two equals
        else {
          point += (4 * count[0] + count[2]);
        }
      }
      //the last two
      else if (mat[1] == mat[2]) {
        point += (count[0] + 4 * count[1]);
      }
      //just three nums
      else {
        point += (count[0] + count[1] + count[2]);
      }
    }
    return point;
  }

  void updatemat(int sign, List<int> newmat, index, context) {
    if (sign == 0) {
      updata = newmat;
    } else {
      downdata = newmat;
    }
    check(sign, index);

    downpoint = updatePoint(downdata);
    uppoint = updatePoint(updata);
    turn == 0 ? turn = 1 : turn = 0;
    check_terminal(context);
    print(turn);
    notifyListeners();
  }

  void check(int sign, int position) {
    if (sign == 0) {
      for (int i = position % 3; i < 9; i += 3) {
        if (downMat[i] == upMat[position]) {
          downMat[i] = 0;
        }
      }
    } else {
      for (int i = position % 3; i < 9; i += 3) {
        if (upMat[i] == downMat[position]) {
          upMat[i] = 0;
        }
      }
    }
  }

  void check_terminal(context) {
    int check1 = 0;
    int check2 = 0;
    for (int i = 0; i < 9; i++) {
      if (updata[i] == 0) check1 = 1;
      if (updata[i] == 0) check2 = 1;
    }
    if (check1 == 0 || check2 == 0) {
      turn = 2;
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('hint'),
              content: Text('are you sure about it'),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text('cancel'),
                  onPressed: () {
                    Navigator.of(context).pop('cancel');
                  },
                ),
                CupertinoDialogAction(
                  child: Text('leave'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }
}
