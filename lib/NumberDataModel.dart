import 'package:flutter/material.dart';

class NumberDataModel extends ChangeNotifier {
  final String _numberData_default = "000000";
  String numberData;
  final bool isiPhone;

  NumberDataModel({Key key, this.numberData, this.isiPhone});

  String getNumberData() {
    print("debug  $numberData");
    return numberData;
  }

  void setNumberData(String s) {
    if (numberData.substring(0, 1) == "0") {
      numberData = "${numberData.substring(1, 6)}$s";
      notifyListeners();
      print("debug  $numberData");
    }
  }

  void delNumberData() {
    numberData = "0${numberData.substring(0, 5)}";
    notifyListeners();
    print("debug $numberData");
  }

  void resetNumberData() {
    numberData = _numberData_default;
    notifyListeners();
    print("debug $numberData");
  }
}
