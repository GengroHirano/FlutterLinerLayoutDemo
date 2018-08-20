import 'package:flutter/material.dart';

class OrientationStyle {
  static const HORIZONTAL = "horizontal";
  static const VERTICAL = "vertical";
}

class OrientationControllWidget extends StatelessWidget {
  final String orientation;
  final OrientationSelection onSelectOrientation;
  OrientationControllWidget(
      {Key key, @required this.orientation, @required this.onSelectOrientation})
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
              "Orientation",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FlatButton(
                child: Text("Row",
                    style: TextStyle(
                      color: orientation == OrientationStyle.HORIZONTAL
                          ? Colors.white
                          : Colors.black,
                    )),
                onPressed: () {
                  _updateOrientation(OrientationStyle.HORIZONTAL);
                },
              ),
              FlatButton(
                child: Text("Colmun",
                    style: TextStyle(
                      color: orientation == OrientationStyle.VERTICAL
                          ? Colors.white
                          : Colors.black,
                    )),
                onPressed: () {
                  _updateOrientation(OrientationStyle.VERTICAL);
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

  void _updateOrientation(String newOrientation) {
    onSelectOrientation(newOrientation);
  }
}

typedef void OrientationSelection(String orientation);
