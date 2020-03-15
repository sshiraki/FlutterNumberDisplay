//import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.Dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'NumberDataModel.dart';

class NumberDisplay extends StatelessWidget {
  const NumberDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberDataModel = Provider.of<NumberDataModel>(context, listen: false);
    return Center(
      child: SizedBox(
        height: numberDataModel.isiPhone ? 80 : 180,
        width: numberDataModel.isiPhone ? 288 : 540,
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
    //final dataChange = Provider.of<NumberDataModel>(context, listen: false);
    return Consumer<NumberDataModel>(builder: (_, model, __) {
      return Padding(
        padding: EdgeInsets.all(4),
        child: SizedBox(
          width: model.isiPhone ? 40 : 80,
          height: model.isiPhone ? 50 : 98,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              model.numberData.substring(inx, inx + 1),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "SF Pro Display",
                fontSize: model.isiPhone ? 38 : 80,
                color: Color(0xff888888),
                //color: Colors.black,
              ),
            ),
          ),
        ),
      );
    });
  }
}

class NumberKeys extends StatelessWidget {
  const NumberKeys({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataChange = Provider.of<NumberDataModel>(context, listen: false);
    return Center(
      child: SizedBox(
        width: dataChange.isiPhone ? 290 : 582,
        height: dataChange.isiPhone ? 300 : 560,
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
    final dataChange = Provider.of<NumberDataModel>(context, listen: false);
    return SizedBox(
      width: dataChange.isiPhone ? 74 : 162,
      height: dataChange.isiPhone ? 72 : 140,
      child: Center(
        child: SizedBox(
          width: dataChange.isiPhone ? 70 : 145,
          height: dataChange.isiPhone ? 60 : 120,
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
                    top: dataChange.isiPhone ? 6 : 24,
                    left: dataChange.isiPhone ? 0 : 16,
                    width: dataChange.isiPhone ? 60 : 120,
                    height: dataChange.isiPhone ? 60 : 80,
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
    final dataChange = Provider.of<NumberDataModel>(context, listen: false);
    return SizedBox(
      width: dataChange.isiPhone ? 72 : 162,
      height: dataChange.isiPhone ? 144 : 280,
      child: Center(
        child: SizedBox(
          width: dataChange.isiPhone ? 70 : 145,
          height: dataChange.isiPhone ? 134 : 260,
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
                child: Text(
                  //'改行',
                  'Enter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    //fontSize: 52,
                    fontSize: dataChange.isiPhone ? 15 : 48,
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
    //final dataChange = Provider.of<NumberDataModel>(context, listen: false);
    return Consumer<NumberDataModel>(builder: (_, model, __) {
      return SizedBox(
        width: model.isiPhone ? 72 : 162,
        height: model.isiPhone ? 72 : 140,
        child: Center(
          child: SizedBox(
            width: model.isiPhone ? 70 : 142,
            height: model.isiPhone ? 60 : 120,
            child: FlatButton(
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
                  fontSize: model.isiPhone ? 42 : 80,
                  color: Color(0xff222222),
                ),
              ),
            ),
          ),
        ),
      );
    });
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
    //final dataChange = Provider.of<NumberDataModel>(context, listen: false);
    return Consumer<NumberDataModel>(builder: (_, model, __) {
      return SizedBox(
        width: model.isiPhone ? 72 : 140,
        height: model.isiPhone ? 72 : 140,
        child: Center(
          child: SizedBox(
            width: model.isiPhone ? 60 : 120,
            height: model.isiPhone ? 60 : 120,
            child: FlatButton(
            onPressed: () async {
                await model.setNumberData(keych);
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
                  fontSize: model.isiPhone ? 42 : 80,
                  color: Color(0xff222222),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
