import 'package:flutter/material.dart';

class ClipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 头像
    Widget avatar = Image.network(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
        width: 60.0);

    return Center(
      child: Column(
        children: [
          avatar,
          ClipOval(
            child: avatar,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: avatar,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                child: avatar,
              ),
              Text("你好世界", style: TextStyle(color: Colors.green)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRect(
                // 将溢出部分剪裁
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                  child: avatar,
                ),
              ),
              Text("你好世界", style: TextStyle(color: Colors.green)),
            ],
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: ClipRect(
              clipper: MyClipper(),
              child: avatar,
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10, 15, 40, 30);

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;
}
