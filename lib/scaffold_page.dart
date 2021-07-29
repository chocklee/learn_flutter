import 'package:flutter/material.dart';
import 'package:flutter_app/clip_page.dart';
import 'package:flutter_app/gridview_page.dart';
import 'package:flutter_app/infinite_gridview_page.dart';
import 'package:flutter_app/infinite_listview_page.dart';
import 'package:flutter_app/listview_page.dart';
import 'package:flutter_app/single_chid_scrollView_page.dart';

class ScaffoldPage extends StatefulWidget {
  @override
  _ScaffoldPageState createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  TabController _tabController;
  List tabs = ['1', '2', '3', '4', '5', '6', '7', '8'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.dashboard),
              color: Colors.white,
              onPressed: () {
                // 打开抽屉菜单
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar:
          // BottomAppBar(
          //   color: Colors.white,
          //   shape: CircularNotchedRectangle(),
          //   child: Row(
          //     children: [
          //       IconButton(
          //         icon: Icon(Icons.home),
          //         onPressed: () {},
          //       ),
          //       SizedBox(),
          //       IconButton(
          //         icon: Icon(Icons.business),
          //         onPressed: () {},
          //       ),
          //     ],
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   ),
          // ),
          BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ClipPage(), // 裁剪
          SingleChildScrollViewPage(), // 单子组件滑动视图
          ListViewPage(), // ListView
          ListViewBuilderPage(), // ListViewBuilder
          ListViewSeparatedPage(), // ListViewSeparated
          InfiniteListView(), // 上拉加载列表
          GridViewPage(), // 纵轴固定数量的GridView
          InfiniteGridView(), // 上拉加载GridView
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}

  List tabBarViewChildren() {
    return tabs.map((e) {
      return Center(
        child: Text(
          e,
          textScaleFactor: 5,
        ),
      );
    }).toList();
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(Object context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 46),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.network(
                        'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    'Wendux',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 16),
                children: [
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add account'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Manage account'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
