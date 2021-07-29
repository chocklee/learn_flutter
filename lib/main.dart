import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/context_route.dart';
import 'package:flutter_app/couter_route.dart';
import 'package:flutter_app/cupertino_widget.dart';
import 'package:flutter_app/custom_scrollview_page.dart';
import 'package:flutter_app/echo.dart';
import 'package:flutter_app/new_route.dart';
import 'package:flutter_app/progress_page.dart';
import 'package:flutter_app/random_words.dart';
import 'package:flutter_app/router_test_route.dart';
import 'package:flutter_app/scaffold_page.dart';
import 'package:flutter_app/switch_checkbox.dart';
import 'package:flutter_app/tapbox.dart';
import 'package:flutter_app/textfield_form.dart';
import 'package:flutter_app/tip_route.dart';

import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

void collectLog(String line) {
  // 收集日志
}

void reportErrorAndLog(FlutterErrorDetails details) {
  // 上报错误和日志逻辑
}

FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
  // 构建错误信息
}

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    reportErrorAndLog(details);
  };
  runZoned(() {
    runApp(MyApp());
    // Debug
    // debugDumpApp();
    // debugDumpRenderTree();
    // debugDumpLayerTree();
  }, zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
    collectLog(line);
  }), onError: (Object obj, StackTrace stack) {
    var details = makeDetails(obj, stack);
    reportErrorAndLog(details);
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 应用名称
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // 主题颜色
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        // 注册路由表
        'new_page': (context) => NewRoute(),
        'tip_page': (context) =>
            TipRoute(text: ModalRoute.of(context).settings.arguments),
        'context_page': (context) => ContextRoute(),
        'couter_page': (context) => CouterRoute(),
        'stateful_context_page': (context) => StatefulContextRoute(),
        'cupertino_page': (context) => CupertinoTestRoute(),
        'textField_Page': (context) => TextFieldPage(),
        'form_page': (context) => FormTestPage(),
        'progress_page': (context) => ProgressPage(),
        'scaffold_page': (context) => ScaffoldPage(),
        'custom_scrollView_page': (context) => CustomScrollViewPage(),
      },
      // onGenerateRoute只会对命名路由生效
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其它情况则正常打开路由
          print(routeName);
        });
      },
      // 应用首页路由
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  static const textStyle = const TextStyle(fontFamily: 'PottaOne');

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  // 加载文本assets
  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/config.json');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    String icons = "";
    icons += "\uE914";
    icons += "\uE000";
    icons += "\uE90D";

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.red, fontSize: 16.0),
          textAlign: TextAlign.start,
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    '显示数字：',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0,
                      height: 1.2, // 用于指定行高，行高等于 fontSize * height
                      fontFamily: "Courier",
                      background: Paint()..color = Colors.yellow,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed,
                    ),
                  ),
                  Text(
                    '$_counter',
                    textScaleFactor: 1.2, // 代表文本相对于当前字体大小的缩放因子
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  RandomWordsWidget(),
                  Echo(text: 'Hello world'),
                  Text(
                    '引入的字体',
                    style: TextStyle(fontFamily: 'Potta One'),
                  ),
                ],
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Home:'),
                    TextSpan(
                      text: "https://flutterchina.club",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RouterTestRoute(),
                  Padding(padding: EdgeInsets.all(16.0)),
                  MaterialButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, 'couter_page'),
                    child: Text('Couter'),
                    color: Colors.grey,
                  ),
                  Padding(padding: EdgeInsets.all(16.0)),
                  ParentWidgetC(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                      child: Text('命名路由传参'),
                      // 命名路由传递参数
                      onPressed: () => Navigator.of(context)
                          .pushNamed('new_page', arguments: 'New Route')),
                  Padding(padding: EdgeInsets.all(16.0)),
                  RaisedButton.icon(
                      // 命名路由
                      onPressed: () => Navigator.pushNamed(context, 'new_page'),
                      icon: Icon(Icons.send),
                      label: Text('命名路由无参')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, 'context_page'),
                      child: Text('context测试')),
                  Padding(padding: EdgeInsets.all(16.0)),
                  FlatButton.icon(
                    icon: Icon(Icons.info),
                    label: Text("子树中获取State对象"),
                    onPressed: () =>
                        Navigator.pushNamed(context, 'stateful_context_page'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlineButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, 'cupertino_page'),
                    child: Text('iOS风格UI'),
                  ),
                  Padding(padding: EdgeInsets.all(16.0)),
                  OutlineButton.icon(
                      onPressed: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) {
                                      return NewRoute();
                                    },
                                    fullscreenDialog: true))
                            .then((value) => print('返回数据$value'));
                      },
                      icon: Icon(Icons.add),
                      label: Text('模态弹出页面')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: () {
                      Navigator.pushNamed(context, 'form_page');
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  RaisedButton(
                    color: Colors.blue,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text('输入框'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.pushNamed(context, 'textField_Page');
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      child: Text('CustomScrollView'),
                      // 命名路由传递参数
                      onPressed: () => Navigator.pushNamed(
                          context, 'custom_scrollView_page'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/bg.jpg',
                    width: 60.0,
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Image.network(
                    'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
                    width: 60,
                    height: 150,
                    color: Colors.blue,
                    colorBlendMode: BlendMode.difference,
                    repeat: ImageRepeat.repeatY,
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    icons,
                    style: TextStyle(
                        fontFamily: "MaterialIcons",
                        fontSize: 24.0,
                        color: Colors.green),
                  ),
                  Icon(
                    Icons.accessible,
                    color: Colors.green,
                  ),
                  Icon(
                    Icons.error,
                    color: Colors.green,
                  ),
                  Icon(
                    Icons.fingerprint,
                    color: Colors.green,
                  ),
                ],
              ),
              SwitchAndCheckBoxRoute(),
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              SizedBox(
                height: 3,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .5,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: [
                  CircularProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                  Padding(padding: EdgeInsets.only(right: 10)),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                      value: .5,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 10)),
                  RaisedButton(
                    child: Text('进度色动画'),
                    // 命名路由传递参数
                    onPressed: () =>
                        Navigator.of(context).pushNamed('progress_page'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      child: Text('Scaffold TabBar'),
                      // 命名路由传递参数
                      onPressed: () =>
                          Navigator.pushNamed(context, 'scaffold_page'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
