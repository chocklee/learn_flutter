import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 只适用于子组件较少的情况
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      children: [
        const Text('I\'m dedicating every day to you'),
        const Text('Domestic life was never quite my style'),
        const Text('When you smile, you knock me out, I fall apart'),
        const Text('And I thought I was so smart'),
      ],
    );
  }
}

class ListViewBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('商品列表'),
        ),
        SizedBox(
          // Material设计规范中导航栏高度为56
          // iOS导航栏高度为44
          height: MediaQuery.of(context).size.height -
              34 - // 底部虚拟Home
              49 - // tabBar
              44 - // 状态栏
              56 - // 导航栏
              56 - //
              56, // ListTile高度
          child: ListView.builder(
            itemCount: 100,
            itemExtent: 50.0, // 强制高度为50.0
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('$index'),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ListViewSeparatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(color: Colors.blue);
    Widget divider2 = Divider(color: Colors.green);

    return ListView.separated(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('$index'),
        );
      },
      separatorBuilder: (context, index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }
}
