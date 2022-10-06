import 'dart:math';

import 'package:flutter/material.dart';

class GameData with ChangeNotifier {
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

  void updatemat(int sign, List<int> newmat, index) {
    if (sign == 0) {
      updata = newmat;
      uppoint = updatePoint(updata);
    } else {
      downdata = newmat;
    }
    check(sign, index);
    notifyListeners();
    print("after the move the mat has been changed like this");
    print("up$updata");
    print("down$downdata");
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
}
