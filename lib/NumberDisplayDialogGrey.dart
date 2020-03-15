//import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xdtest/main.dart';
import 'NumberDisplay.dart';
import 'NumberDataModel.dart';

class NumberDisplayDialogGrey extends StatefulWidget {
  final String numberData;
  final bool isiPhone;
  final DialogType dialogType;

  NumberDisplayDialogGrey({Key key, this.numberData, this.isiPhone, this.dialogType})
      : super(key: key);

  @override
  _NumberDisplayDialogGreyState createState() =>
      _NumberDisplayDialogGreyState();
}

class _NumberDisplayDialogGreyState extends State<NumberDisplayDialogGrey> {
  _NumberDisplayDialogGreyState();

  String _numberData;
  DialogType _dialogType;

  @override
  void initState() {
    _numberData = widget.numberData;
    _dialogType = widget.dialogType;
    super.initState();
    //print("debug _numberData : $_numberData");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final dataChange = Provider.of<NumberDataModel>(context, listen: false);
    //return Dialog(
    return ChangeNotifierProvider<NumberDataModel>(
      create: (_) =>
          NumberDataModel(numberData: _numberData, isiPhone: widget.isiPhone),
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)), //this right here
        backgroundColor: _dialogType == DialogType.greyFrame ? Color(0xffd1d5db) : Colors.black26,
        child: SingleChildScrollView(
          child: Container(
            height: widget.isiPhone ? 388 : 780,
            width: 608,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        NumberDisplay(),
                        NumberKeys(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
