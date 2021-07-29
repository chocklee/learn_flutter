import 'package:flutter/material.dart';

class TipRoute extends StatelessWidget {
  final String text;

  TipRoute({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('提示'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context, '我是返回值'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, '我是返回值'),
                child: Text('返回'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('hello world'),
                      Text('I am Jack'),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(" hello world "),
                      Text(" I am Jack "),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Text(" hello world "),
                      Text(" I am Jack "),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    verticalDirection: VerticalDirection.up,
                    children: <Widget>[
                      Text(
                        " hello world ",
                        style: TextStyle(fontSize: 30.0),
                      ),
                      Text(" I am Jack "),
                    ],
                  ),
                  ConstrainedBox(
                    // 更改宽度限制
                    constraints: BoxConstraints(minWidth: double.infinity),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('hi'),
                        Text('hello world'),
                      ],
                    ),
                  ),
                  // Flex的两个子widget按1：2来占据水平空间
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        // 弹性系数，如果为0或null，则child是没有弹性的，即不会被扩伸占用的空间
                        // 如果大于0，所有的Expanded按照其flex的比例来分割主轴的全部空闲空间
                        flex: 1,
                        child: Container(
                          height: 30.0,
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 30.0,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      height: 100.0,
                      // Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 30.0,
                              color: Colors.red,
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 30.0,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Wrap(
                spacing: 8.0, // 主轴(水平)方向间距
                runSpacing: 4.0, // 纵轴（垂直）方向间距
                alignment: WrapAlignment.center, //沿主轴方向居中
                children: [
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('A'),
                    ),
                    label: Text('Hamilton'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('J'),
                    ),
                    label: Text('Laurens'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('M'),
                    ),
                    label: Text('Lafayette'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('H'),
                    ),
                    label: Text('Mulligan'),
                  ),
                ],
              ),
              Flow(
                delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.red,
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.green,
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.brown,
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.purple,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
