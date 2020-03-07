//import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class NumberDisplayDialogGray extends StatefulWidget {
  final String numberData;

  NumberDisplayDialogGray({Key key, this.numberData}) : super(key: key);

  @override
  _NumberDisplayDialogGrayState createState() => _NumberDisplayDialogGrayState();
}

class _NumberDisplayDialogGrayState extends State<NumberDisplayDialogGray> {
  _NumberDisplayDialogGrayState();

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
        backgroundColor: Color(0xffd1d5db),
        child: Container(
          // Diarog Outside
          //height: 860,
          //width: 700,
          //height: MediaQuery.of(context).size.height - 80,
          //width: MediaQuery.of(context).size.width - 10,
          height: 780,
          width: 608,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  //child: Container(
                  //  decoration: BoxDecoration(
                  //      borderRadius: BorderRadius.circular(10),
                  //      color: const Color(0xffd1d5db)),
                  //  alignment: Alignment.center,
                  //height: 780,
                  //width: 608,
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