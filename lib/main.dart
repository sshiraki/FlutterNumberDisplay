//import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.Dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  static const routeName = 'animatedTheme';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String numberData = "000000";

  @override
  void initState() {
    // Initial Value
    //print("debug _MyHomepageState.numberData : $numberData");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: FlatButton(
                child: Text("$numberData",
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      fontSize: 94,
                      color: Color(0xff222222),
                    )),
                onPressed: () async {
                  var result = await showDialog(
                      //onPressed: () {showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) {
                        return NumberDisplayDialog(numberData: "$numberData");
                      });
                  setState(() {
                    numberData = result;
                  });
                  //print("debug result : $result");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NumberDataModel extends ChangeNotifier {
  String numberData = "000000";

  NumberDataModel({Key key, this.numberData}) ; 

  String getNumberData() {
    return numberData;
    //print("debug  $numberData");
  }

  void setNumberData(String s) {
    if (numberData.substring(0, 1) == "0") {
      numberData = "${numberData.substring(1, 6)}$s";
      notifyListeners();
      //print("debug  $numberData");
    }
  }

  void delNumberData() {
    numberData = "0${numberData.substring(0, 5)}";
    notifyListeners();
    //print("debug $numberData");
  }

  void clrNumberData() {
    numberData = "000000";
    notifyListeners();
    //print("debug $numberData");
  }
}

class NumberDisplayDialog extends StatefulWidget {
  final String numberData;

  NumberDisplayDialog({Key key, this.numberData}) : super(key: key);

  @override
  _NumberDisplayDialogState createState() =>
      _NumberDisplayDialogState();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NumberDisplay(),
                NumberKeys(),
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
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffd1d5db)),
              alignment: Alignment.center,
              height: 140,
              width: 608,
              child: SizedBox(
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
                  )),
            ),
          ),
        ],
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
        // Odd Meter Box inside
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
      child: Container(
        decoration: BoxDecoration(
            //border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffd1d5db)),
        alignment: Alignment.center,
        width: 608,
        height: 600,
        //color: const Color(0xffd1d5db),
        child: Container(
          alignment: Alignment.center,
          width: 590,
          height: 580,
          color: const Color(0xffd1d5db),
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
    return Container(
      alignment: Alignment.center,
      width: 162,
      height: 140,
      color: const Color(0xffd1d5db),
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
    return Container(
      alignment: Alignment.center,
      width: 162,
      height: 280,
      color: const Color(0xffd1d5db),
      child: Center(
        child: SizedBox(
          width: 145,
          height: 260,
          child: Consumer<NumberDataModel>(
            builder: (_, model, __) {
              return FlatButton(
                onPressed: () {
                  //print("debug ${model.getNumberData()}");
                  Navigator.of(context)
                      .pop("${model.getNumberData()}");
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
    return Container(
      alignment: Alignment.center,
      width: 162,
      height: 140,
      color: const Color(0xffd1d5db),
      child: Center(
        child: SizedBox(
          width: 142,
          height: 120,
          child: Consumer<NumberDataModel>(builder: (_, model, __) {
            return FlatButton(
              onPressed: () {
                model.clrNumberData();
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
    return Container(
      alignment: Alignment.center,
      width: 140,
      height: 140,
      color: const Color(0xffd1d5db),
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
