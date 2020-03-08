//import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'NumberDataModel.dart';

class NumberDisplayDialogGrey extends StatefulWidget {
  final String numberData;

  NumberDisplayDialogGrey({Key key, this.numberData}) : super(key: key);

  @override
  _NumberDisplayDialogGreyState createState() => _NumberDisplayDialogGreyState();
}

class _NumberDisplayDialogGreyState extends State<NumberDisplayDialogGrey> {
  _NumberDisplayDialogGreyState();

  String _numberData;

  @override
  void initState() {
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
    //return Dialog(
    return ChangeNotifierProvider<NumberDataModel>(
      create: (_) => NumberDataModel(numberData: _numberData),
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)), //this right here
        backgroundColor: Colors.black26,
        //backgroundColor: Color(0xffd1d5db),
        child: Container(
          height: 780,
          width: 608,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      NumberDisplay(),
                      NumberKeys(),
                    ],
                  ),
                ),
                //),
              ],
            ),
          ),
        ),
      ),
    );
  }
}