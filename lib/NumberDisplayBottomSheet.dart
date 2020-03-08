//import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'NumberDataModel.dart';

class NumberDisplayBottomSheet extends StatefulWidget {
  final String numberData;

  NumberDisplayBottomSheet({Key key, this.numberData}) : super(key: key);

  @override
  _NumberDisplayBottomSheetState createState() =>
      _NumberDisplayBottomSheetState();
}

class _NumberDisplayBottomSheetState extends State<NumberDisplayBottomSheet> {
  _NumberDisplayBottomSheetState();

  String _numberData;

  @override
  void initState() {
    _numberData = widget.numberData;
    super.initState();
    //print("debug _numberData : $_numberData");
  }

  void setNumber() {
    _numberData = widget.numberData;
    super.initState();
    //print("debug _numberData : $_numberData");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NumberDataModel>(
      create: (_) => NumberDataModel(numberData: _numberData),
      child: Container(
        color: Color(0xffd1d5db),
        height: 608,
        width: 800,
        child: Center(
          child: NumberKeys(),
        ),
      ),
    );
  }
}
