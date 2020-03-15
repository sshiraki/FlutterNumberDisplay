//import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'NumberDisplay.dart';
import 'NumberDataModel.dart';

class NumberDisplayDialog extends StatefulWidget {
  final String numberData;
  final bool isiPhone;

  NumberDisplayDialog({Key key, this.numberData, this.isiPhone})
      : super(key: key);

  @override
  _NumberDisplayDialogState createState() => _NumberDisplayDialogState();
}

class _NumberDisplayDialogState extends State<NumberDisplayDialog> {
  _NumberDisplayDialogState();

  String _numberData;
  double _mediaWidh;

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
    //final dataChange = Provider.of<NumberDataModel>(context, listen: false);
    //return Dialog(
    return ChangeNotifierProvider<NumberDataModel>(
      create: (_) =>
          NumberDataModel(numberData: _numberData, isiPhone: widget.isiPhone),
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)), //this right here
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              // Diarog Outside
              height: widget.isiPhone ? 440 : 860,
              //height: MediaQuery.of(context).size.height,
              width: widget.isiPhone ? 360 : 700,
              //width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffd1d5db)),
                        alignment: Alignment.center,
                        height: widget.isiPhone ? 416 : 780,
                        width: widget.isiPhone ? 416 : 608,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            NumberDisplay(),
                            NumberKeys(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
