import 'package:flutter/material.dart';

class CouterWidget extends StatefulWidget {
  const CouterWidget({Key key, this.initValue: 0}) : super(key: key);

  final int initValue;

  @override
  _CouterWidgetState createState() => _CouterWidgetState();
}

class _CouterWidgetState extends State<CouterWidget> {
  int _couter;

  @override
  void initState() {
    super.initState();
    _couter = widget.initValue;
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('couter'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          //未定位widget占满Stack整个空间
          // fit: StackFit.expand,
          children: [
            // 被遮住
            Positioned(
              left: 18.0,
              child: Text('I am Jack'),
            ),
            Container(
              child: Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),
            Positioned(
              top: 18.0,
              child: Text('Your friend'),
            ),
            Positioned(
              bottom: 18.0,
              child: FlatButton(
                color: Colors.grey,
                child: Text('$_couter'),
                onPressed: () => setState(() => ++_couter),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant CouterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}
