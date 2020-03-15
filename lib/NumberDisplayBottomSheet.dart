//import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'NumberDisplay.dart';
import 'NumberDataModel.dart';

class NumberDisplayBottomSheet extends StatefulWidget {
  final String numberData;
  final bool isiPhone;

  NumberDisplayBottomSheet({Key key, this.numberData, this.isiPhone})
      : super(key: key);

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
    //final dataChange = Provider.of<NumberDataModel>(context, listen: false);
    return ChangeNotifierProvider<NumberDataModel>(
      create: (_) =>
          NumberDataModel(numberData: _numberData, isiPhone: widget.isiPhone),
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Color(0xffd1d5db),
            height: widget.isiPhone ? 408 : 608,
            width: 1024,
            child: Center(
              child: NumberKeys(),
            ),
          ),
        ),
      ),
    );
  }
}
