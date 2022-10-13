import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PvEData with ChangeNotifier {
  AIlogic ai = AIlogic();
  int turn = 1;
  int remember = 0;
  int uppoint = 0;
  int downpoint = 0;
  int randomNum = 0;
  List<int> updata = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<int> downdata = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  int get getNum => randomNum;
  List<int> get upMat => updata;
  List<int> get downMat => downdata;

  void aimove(context) {
    if (turn != 0) return;
    int index = ai.compute(getnum(), updata, downdata);
    updata[index] = getNum;
    check(0, index);

    downpoint = updatePoint(downdata);
    uppoint = updatePoint(updata);
    turn = 1;

    check_terminal(context);

    notifyListeners();
    // updatemat(0, upMat, index, context);
  }

  void reset(context) {
    turn = 0;
    remember = 0;
    uppoint = 0;
    downpoint = 0;
    randomNum = 0;
    updata = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    downdata = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    notifyListeners();
  }

  int getnum() {
    if (randomNum != 0) return randomNum;
    //generate a random number
    remember = turn;
    randomNum = Random().nextInt(6) + 1;
    notifyListeners();
    print(randomNum);
    return randomNum;
  }

  int updatePoint(List<int> mat) {
    randomNum = 0;
    int point = 0;
    for (int i = 0; i < 3; i++) {
      List<int> count = [mat[i], mat[3 + i], mat[6 + i]];
      count.sort();
      print(count);
      if (count[0] == count[1]) {
        //all of the three
        if (count[1] == count[2]) {
          point += 9 * count[0];
          // print("point+=9*${count[0]}");
        }
        //the first two equals
        else {
          point += (4 * count[0] + count[2]);
          // print("point+=4*${count[0]}+${count[2]}");
        }
      }
      //the last two
      else if (count[1] == count[2]) {
        point += (count[0] + 4 * count[1]);
        // print("point+=4*${count[1]}+${count[0]}");
      }
      //just three nums
      else {
        point += (count[0] + count[1] + count[2]);
        // print("point+=${count[1]}+${count[0]}+${count[2]}");
      }
    }
    print(point);
    return point;
  }

  void updatemat(List<int> newmat, index, context) {
    downdata = newmat;

    check(1, index);

    downpoint = updatePoint(downdata);
    uppoint = updatePoint(updata);
    turn = 0;

    check_terminal(context);

    notifyListeners();
    aimove(context);
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

  bool check_terminal(context) {
    int check1 = 0;
    int check2 = 0;
    for (int i = 0; i < 9; i++) {
      if (updata[i] == 0) check1 = 1;
      if (downdata[i] == 0) check2 = 1;
    }
    if (check1 == 0 || check2 == 0) {
      print("game over");

      showCupertinoDialog(
          context: context,
          builder: (context) {
            String result;
            print(uppoint + downpoint);
            if (uppoint > downpoint) {
              result = "游戏结束\n失败";
            }
            if (uppoint == downpoint) {
              result = "游戏结束\n平局";
            }
            if (uppoint < downpoint) {
              result = "游戏结束\n胜利";
            }
            return CupertinoAlertDialog(
              title: Text(result),
              content: Text("${uppoint}vs$downpoint"),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text('再来一局'),
                  onPressed: () {
                    turn = 1;
                    Navigator.of(context).pop();
                  },
                ),
                CupertinoDialogAction(
                  child: Text('离开'),
                  onPressed: () {
                    Navigator.of(context).pop("cancel");
                  },
                ),
              ],
            );
          });
      Future.delayed(Duration(milliseconds: 1000), () {
        reset(context);
      });
      turn = 3;
      return true;
    }
    return false;
  }
}

class AIlogic {
  int newnum;
  List<int> u1 = [0, 0, 0];
  List<int> u2 = [0, 0, 0];
  List<int> u3 = [0, 0, 0];
  List<int> d1 = [0, 0, 0];
  List<int> d2 = [0, 0, 0];
  List<int> d3 = [0, 0, 0];

  int sum(List<int> nums) {
    int count = 0;
    for (int i = 0; i < 3; i++) {
      count += nums[i];
    }
    return count;
  }

  int getslot(int column, List<int> mat) {
    for (int i = column; i < 9; i += 3) {
      if (mat[i] == 0) {
        return i;
      }
    }
  }

  int hasslot(List<int> slots) {
    int count = 0;
    for (int i = 0; i < 3; i++) {
      if (slots[i] == 0) {
        count++;
      }
    }
    return count;
  }

  int hassame(int num, List<int> slots) {
    int count = 0;
    for (int i = 0; i < 3; i++) {
      if (slots[i] == num) {
        count++;
      }
    }
    return count;
  }

  int compute(int num, List<int> up, List<int> down) {
    newnum = num;
    List<int> score = [1, 1, 1];
    int biggest = 0;
    List<int> u1 = [up[0], up[3], up[6]];
    List<int> u2 = [up[1], up[4], up[7]];
    List<int> u3 = [up[2], up[5], up[8]];
    List<List> us = [u1, u2, u3];

    List<int> d1 = [down[0], down[3], down[6]];
    List<int> d2 = [down[1], down[4], down[7]];
    List<int> d3 = [down[2], down[5], down[8]];
    List<List> ds = [d1, d2, d3];

    for (int i = 0; i < 3; i++) {
      if (hasslot(us[i]) == 0) {
        score[i] = 0;
        continue;
      }

      score[i] += num * hassame(num, us[i]);
      score[i] += num * hassame(num, ds[i]);
      if (score[i] > score[biggest]) {
        biggest = i;
      }
    }
    print("$biggest index=${getslot(biggest, up)}");
    return getslot(biggest, up);
  }
}
