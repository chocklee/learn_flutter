import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ContextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));
    return Scaffold(
      appBar: AppBar(
        // -- Context测试
        title: Text('Context测试'),
        actions: [
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Builder(
              builder: (context) {
                // -- Context测试
                // 在Widget树中向上查找最近的父级‘Scaffold’ Widget
                Scaffold scaffold =
                    context.findAncestorWidgetOfExactType<Scaffold>();
                // 直接返回 AppBar的title， 此处实际上是Text("Context测试")
                return (scaffold.appBar as AppBar).title;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Center(
                    child: Text('xxx'),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Center(
                    widthFactor: 1,
                    heightFactor: 1,
                    child: Text('xxx'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            //上下左右各添加16像素补白
            padding: EdgeInsets.all(16.0),
            child: Column(
              //显式指定对齐方式为左对齐，排除对齐干扰
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  //左边添加8像素补白
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Hello world'),
                ),
                Padding(
                  //上下各添加8像素补白
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Hello world'),
                ),
                Padding(
                  // 分别指定四个方向的补白
                  padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, .0),
                  child: Text("Your friend"),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                // 宽度尽可能大
                minWidth: double.infinity,
                // 最小高度为50像素
                minHeight: 50.0,
              ),
              child: Container(
                height: 5,
                child: redBox,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                //
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: redBox,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                // 有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的。实际上，只有这样才能保证父限制与子限制不冲突。
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90, minHeight: 20), // 父
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minWidth: 60, minHeight: 60), // 子
                    child: redBox,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
                  //“去除”父级限制
                  // UnconstrainedBox对父组件限制的“去除”并非是真正的去除
                  child: UnconstrainedBox(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                      child: redBox,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.orange[700]],
                    ),
                    borderRadius: BorderRadius.circular(3.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  color: Colors.black,
                  child: Transform(
                    alignment: Alignment.topRight,
                    transform: Matrix4.skewY(0.3),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.deepOrange,
                      child: Text('Apartment for rent!'),
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// 注意: Transform的变换是应用在绘制阶段, 而并不是应用在布局(layout)阶段,
          ///所以无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的
          ///因为这些是在布局阶段就确定的
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  // 平移
                  child: Transform.translate(
                    offset: Offset(-20, -5),
                    child: Text('Hello world'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  // 旋转
                  child: Transform.rotate(
                    angle: pi / 2,
                    child: Text('Hello world'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.scale(
                    scale: 1.5,
                    child: Text('Hello world'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.scale(
                    scale: 1.5,
                    child: Text("Hello world"),
                  )),
              Text(
                "你好",
                style: TextStyle(color: Colors.green, fontSize: 18.0),
              ),
            ],
          ),

          /// RotatedBox和Transform.rotate功能相似，它们都可以对子组件进行旋转变换，
          /// 但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: RotatedBox(
                  quarterTurns: 1, //旋转90度(1/4圈)
                  child: Text('Hello world'),
                ),
              ),
              Text(
                "你好",
                style: TextStyle(color: Colors.green, fontSize: 18.0),
              ),
            ],
          ),
          Container(
            // 容器外填充
            margin: EdgeInsets.only(top: 10.0, left: 40.0),
            // 卡片大小
            constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.red, Colors.orange],
                center: Alignment.topLeft,
                radius: .98,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0,
                ),
              ],
            ),
            transform: Matrix4.rotationZ(.2), // 卡片倾斜变换
            alignment: Alignment.center,
            child: Text(
              '5.20',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatefulContextRoute extends StatefulWidget {
  @override
  _StatefulContextState createState() => _StatefulContextState();
}

class _StatefulContextState extends State<StatefulContextRoute> {
  static GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        // -- 子树中获取State对象
        title: Text('子树中获取State对象'),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            // -- 子树中获取State对象
            return RaisedButton(
              onPressed: () {
                // 查找父级最近的Scaffold对应的ScaffoldState对象
                // ScaffoldState _state =
                //     context.findAncestorStateOfType<ScaffoldState>();

                // 直接通过of静态方法来获取ScaffoldState
                // ScaffoldState _state = Scaffold.of(context);

                // 通过GlobalKey来获取State对象
                ScaffoldState _state = _globalKey.currentState;
                _state.showSnackBar(SnackBar(content: Text('我是SnackBar')));
              },
              child: Text('显示SnackBar'),
            );
          },
        ),
      ),
    );
  }
}
