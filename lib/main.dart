import 'package:flutter/material.dart';
import 'widget/orientation_controller.dart';
import 'widget/size_controller.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LinearLayoutScreen(
        orientation: OrientationStyle.VERTICAL,
        size: MainAxisSize.max,
      ),
    );
  }
}

class LinearLayoutScreen extends StatefulWidget {
  final String orientation;
  final MainAxisAlignment alignment;
  final MainAxisSize size;
  final CrossAxisAlignment crossAxis;

  LinearLayoutScreen(
      {Key key, this.orientation, this.alignment, this.size, this.crossAxis});

  @override
  State<StatefulWidget> createState() =>
      LinearLayoutScreenState(orientation, alignment, size, crossAxis);
}

class LinearLayoutScreenState extends State<LinearLayoutScreen> {
  String _orientation;
  MainAxisAlignment _alignment;
  MainAxisSize _size;
  CrossAxisAlignment _crossAxis;

  LinearLayoutScreenState(
      this._orientation, this._alignment, this._size, this._crossAxis);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("LinearLayoutSample"),
        bottom: PreferredSize(
          preferredSize: Size(0.0, 80.0),
          child: Container(
            color: Colors.redAccent,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _buildMenu(),
              ],
            ),
          ),
        ),
      ),
      body: _buildTargetScreen(),
    );
  }

  Widget _buildMenu() => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: OrientationControllWidget(
              orientation: _orientation,
              onSelectOrientation: (newOrientation) {
                setState(() {
                  _orientation = newOrientation;
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: SizeControllWidget(
              mainAxisSize: _size,
              onSelectSize: (newSize) {
                setState(() {
                  _size = newSize;
                });
              },
            ),
          ),
        ],
      );

  Widget _buildTargetScreen() {
    if (_orientation == OrientationStyle.HORIZONTAL) {
      return Container(
        color: Colors.yellowAccent,
        child: Row(
          mainAxisSize: _size,
          children: <Widget>[
            Icon(Icons.person),
            Icon(Icons.person),
            Icon(Icons.person),
          ],
        ),
      );
    } else {
      return Container(
        color: Colors.blueAccent,
        child: Column(
          mainAxisSize: _size,
          children: <Widget>[
            Icon(Icons.person_outline),
            Icon(Icons.person_outline),
            Icon(Icons.person_outline),
          ],
        ),
      );
    }
  }
}
