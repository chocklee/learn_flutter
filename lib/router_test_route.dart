import 'package:flutter/material.dart';

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () async {
          // 打开`TipRoute`，并等待返回结果
          var result = await Navigator.pushNamed(context, 'tip_page',
              arguments: '我是提示xxx');
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return TipRoute(text: '我是提示xxx');
          //     },
          //   ),
          // );
          print('路由返回值:$result');
        },
        child: Text('打开提示页'),
      ),
    );
  }
}
