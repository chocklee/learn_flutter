import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取路由参数
    var agrs = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(agrs.toString()),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue[50],
                child: Align(
                  alignment: Alignment.topRight,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
              Container(
                color: Colors.blue[50],
                child: Align(
                  widthFactor: 2, // width = 2 * 60
                  heightFactor: 2, // height = 2 * 60
                  alignment: Alignment.topRight,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
              Container(
                color: Colors.blue[50],
                child: Align(
                  widthFactor: 2, // width = 2 * 60
                  heightFactor: 2, // height = 2 * 60
                  alignment: Alignment(2, 0.0),
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
              Container(
                color: Colors.blue[50],
                child: Align(
                  widthFactor: 2, // width = 2 * 60
                  heightFactor: 2, // height = 2 * 60
                  alignment: FractionalOffset(0.2, 0.6),
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('hello world'),
                          Text('I am Jack'),
                        ],
                      ),
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
