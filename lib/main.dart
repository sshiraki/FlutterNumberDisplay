//import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.Dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'NumberDisplayDialogGrey.dart';
import 'NumberDisplayBottomSheet.dart';
import 'NumberDataModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

enum DialogType {
  whiteFrame,
  greyFrame,
  bottomSheet,
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  static const routeName = 'animatedTheme';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String numberData = "000000";
  DialogType _dialogType;

  @override
  void initState() {
    // Initial Value
    //print("debug _MyHomepageState.numberData : $numberData");
    _dialogType = DialogType.whiteFrame;
    super.initState();
  }

  void _handleRadioButton(DialogType e) {
    // Initial Value
    setState(() {
      _dialogType = e;
    });
    print("debug _MyHomepageState._dialogType : $_dialogType");
  }

  @override
  Widget build(BuildContext context) {
    String result;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 500,
                    child: FlatButton(
                      child: Text("$numberData",
                          style: TextStyle(
                            fontFamily: "SF Pro Display",
                            fontSize: 94,
                            color: Color(0xff222222),
                          )),
                      onPressed: () async {
                        if (_dialogType == DialogType.bottomSheet) {
                          result = await showModalBottomSheet<String>(
                            context: context,
                            isDismissible: false,
                            builder: (BuildContext context) {
                              return NumberDisplayBottomSheet(
                                  numberData: "$numberData");
                            },
                          );
                          setState(() {
                            if (result != null) {
                              numberData = result;
                            }
                          });
                        } else {
                          result = await showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (_) {
                                if (_dialogType == DialogType.greyFrame) {
                                  return NumberDisplayDialogGrey(
                                      numberData: "$numberData");
                                } else {
                                  //_dialogType == DialogType.whiteFrame
                                  return NumberDisplayDialog(
                                      numberData: "$numberData");
                                }
                              });
                          setState(() {
                            numberData = result;
                          });
                        }
                        print("debug result : $result");
                      },
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Column(
                      children: <Widget>[
                        RadioListTile(
                            title: Text('白枠'),
                            value: DialogType.whiteFrame,
                            groupValue: _dialogType,
                            onChanged: _handleRadioButton),
                        RadioListTile(
                            title: Text("透過"),
                            value: DialogType.greyFrame,
                            groupValue: _dialogType,
                            onChanged: _handleRadioButton),
                        RadioListTile(
                            title: Text("ボトムシート"),
                            value: DialogType.bottomSheet,
                            groupValue: _dialogType,
                            onChanged: _handleRadioButton),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NumberDisplayDialog extends StatefulWidget {
  final String numberData;

  NumberDisplayDialog({Key key, this.numberData}) : super(key: key);

  @override
  _NumberDisplayDialogState createState() => _NumberDisplayDialogState();
}

class _NumberDisplayDialogState extends State<NumberDisplayDialog> {
  _NumberDisplayDialogState();

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
        child: Container(
          // Diarog Outside
          //height: 860,
          height: MediaQuery.of(context).size.height - 80,
          //width: 700,
          width: MediaQuery.of(context).size.width - 10,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
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
                    height: 780,
                    width: 608,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
    );
  }
}

class NumberDisplay extends StatelessWidget {
  const NumberDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 180,
        width: 540,
        child: Row(
          children: <Widget>[
            NumberDisplayText(
              inx: 0,
            ),
            NumberDisplayText(
              inx: 1,
            ),
            NumberDisplayText(
              inx: 2,
            ),
            NumberDisplayText(
              inx: 3,
            ),
            NumberDisplayText(
              inx: 4,
            ),
            NumberDisplayText(
              inx: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class NumberDisplayText extends StatelessWidget {
  const NumberDisplayText({
    Key key,
    this.inx,
  }) : super(key: key);

  final int inx;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: SizedBox(
        width: 80,
        height: 98,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            Provider.of<NumberDataModel>(context)
                .numberData
                .substring(inx, inx + 1),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "SF Pro Display",
              fontSize: 80,
              color: Color(0xff888888),
              //color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class NumberKeys extends StatelessWidget {
  const NumberKeys({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 582,
        height: 560,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                KeyButton(keych: "1"),
                                KeyButton(keych: "4"),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                KeyButton(keych: "2"),
                                KeyButton(keych: "5"),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            KeyButton(keych: "7"),
                            KeyButton(keych: "8"),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        KeyButton(keych: "3"),
                        KeyButton(keych: "6"),
                        KeyButton(keych: "9"),
                      ],
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    KeyButton(keych: ""),
                    KeyButton(keych: "0"),
                    KeyButton(keych: ""),
                  ],
                )
              ],
            ),
            Column(
              children: <Widget>[
                KeyButtonBS(),
                KeyButtonEnter(),
                KeyButtonClear()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class KeyButtonBS extends StatelessWidget {
  const KeyButtonBS({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 162,
      height: 140,
      child: Center(
        child: SizedBox(
          width: 145,
          height: 120,
          child: Consumer<NumberDataModel>(builder: (_, model, __) {
            return FlatButton(
              onPressed: () {
                model.delNumberData();
              },
              color: const Color(0xffa8afba),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 24,
                    left: 16,
                    width: 120,
                    height: 80,
                    child: SvgPicture.asset(
                      'assets/bs.svg',
                      //color: Color(0xff222222),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class KeyButtonEnter extends StatelessWidget {
  const KeyButtonEnter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 162,
      height: 280,
      child: Center(
        child: SizedBox(
          width: 145,
          height: 260,
          child: Consumer<NumberDataModel>(
            builder: (_, model, __) {
              return FlatButton(
                onPressed: () {
                  //print("debug ${model.getNumberData()}");
                  Navigator.of(context).pop("${model.getNumberData()}");
                },
                //onPressed: () => Navigator.of(context).pop,
                color: const Color(0xffa8afba),
                //color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  //'改行',
                  'Enter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    //fontSize: 52,
                    fontSize: 48,
                    color: Color(0xff222222),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class KeyButtonClear extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 162,
      height: 140,
      child: Center(
        child: SizedBox(
          width: 142,
          height: 120,
          child: Consumer<NumberDataModel>(builder: (_, model, __) {
            return FlatButton(
              onPressed: () {
                model.resetNumberData();
              },
              color: const Color(0xffa8afba),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "C",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 80,
                  color: Color(0xff222222),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class KeyButton extends StatelessWidget {
  final String keych;

  const KeyButton({
    Key key,
    this.keych,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Center(
        child: SizedBox(
          width: 120,
          height: 120,
          child: Consumer<NumberDataModel>(builder: (_, model, __) {
            return FlatButton(
              onPressed: () {
                model.setNumberData(keych);
              },
              color: const Color(0xffffffff),
              //color: const Color(0xffa8afba),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                this.keych,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 80,
                  color: Color(0xff222222),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
