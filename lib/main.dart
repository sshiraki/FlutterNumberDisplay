//import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'NumberDisplayDialog.dart';
import 'NumberDisplayDialogGrey.dart';
import 'NumberDisplayBottomSheet.dart';

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
  opacityFrame,
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
  bool _isiPhone;

  @override
  void initState() {
    // Initial Value
    //print("debug _MyHomepageState.numberData : $numberData");
    _dialogType = DialogType.whiteFrame;
    super.initState();
    _isiPhone = false;
  }

  void didChangeDependencies() {
    print(
        "debug width, height : ${MediaQuery.of(context).size.width}, ${MediaQuery.of(context).size.height}");
    print("debug _MyHomepageState._isiPhone : $_isiPhone");
    final double iWidth =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height;
    _isiPhone = iWidth < 450 ? true : false;
  }

  void _handleRadioButton(DialogType e) {
    // Initial Value
    setState(() {
      _dialogType = e;
    });
    print("debug _MyHomepageState._dialogType : $_dialogType");
  }

  void _handleCheckBox(bool e) {
    // Initial Value
    setState(() {
      _isiPhone = e;
    });
    print("debug _MyHomepageState._isiPhone : $_isiPhone");
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
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: FlatButton(
                        child: Text("$numberData",
                            style: TextStyle(
                              fontFamily: "SF Pro Display",
                              fontSize: _isiPhone ? 40 : 94,
                              color: Color(0xff222222),
                            )),
                        onPressed: () async {
                          if (_dialogType == DialogType.bottomSheet) {
                            result = await showModalBottomSheet<String>(
                              context: context,
                              isDismissible: false,
                              builder: (BuildContext context) {
                                return NumberDisplayBottomSheet(
                                  numberData: "$numberData",
                                  isiPhone: _isiPhone,
                                );
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
                                      dialogType: _dialogType,
                                      numberData: "$numberData",
                                      isiPhone: _isiPhone,
                                    );
                                  } else if (_dialogType ==
                                      DialogType.opacityFrame) {
                                    //_dialogType == DialogType.whiteFrame
                                    return NumberDisplayDialogGrey(
                                      dialogType: _dialogType,
                                      numberData: "$numberData",
                                      isiPhone: _isiPhone,
                                    );
                                  } else {
                                    //_dialogType == DialogType.whiteFrame
                                    return NumberDisplayDialog(
                                      numberData: "$numberData",
                                      isiPhone: _isiPhone,
                                    );
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
                      height: 300,
                      width: 200,
                      child: Column(
                        children: <Widget>[
                          RadioListTile(
                            title: Text('白枠'),
                            value: DialogType.whiteFrame,
                            groupValue: _dialogType,
                            onChanged: _handleRadioButton,
                          ),
                          RadioListTile(
                            title: Text("グレイ"),
                            value: DialogType.greyFrame,
                            groupValue: _dialogType,
                            onChanged: _handleRadioButton,
                          ),
                          RadioListTile(
                            title: Text("透過"),
                            value: DialogType.opacityFrame,
                            groupValue: _dialogType,
                            onChanged: _handleRadioButton,
                          ),
                          RadioListTile(
                            title: Text("ボトムシート"),
                            value: DialogType.bottomSheet,
                            groupValue: _dialogType,
                            onChanged: _handleRadioButton,
                          ),
                          CheckboxListTile(
                            title: Text("iPhone"),
                            value: _isiPhone,
                            onChanged: _handleCheckBox,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
