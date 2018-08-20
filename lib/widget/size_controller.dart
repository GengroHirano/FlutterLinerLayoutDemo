import 'package:flutter/material.dart';

class SizeControllWidget extends StatelessWidget {
  final MainAxisSize mainAxisSize;
  final SizeSelection onSelectSize;
  SizeControllWidget(
      {Key key, @required this.mainAxisSize, @required this.onSelectSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange.shade700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Wrap/Match",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FlatButton(
                child: Text("Min",
                    style: TextStyle(
                      color: mainAxisSize == MainAxisSize.min
                          ? Colors.white
                          : Colors.black,
                    )),
                onPressed: () {
                  _updateSize(MainAxisSize.min);
                },
              ),
              FlatButton(
                child: Text("Max",
                    style: TextStyle(
                      color: mainAxisSize == MainAxisSize.max
                          ? Colors.white
                          : Colors.black,
                    )),
                onPressed: () {
                  _updateSize(MainAxisSize.max);
                },
              )
            ],
          ),
          Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  void _updateSize(MainAxisSize newSize) {
    onSelectSize(newSize);
  }
}

typedef void SizeSelection(MainAxisSize newSize);
