import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  TextEditingController _unnameController = TextEditingController();

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();
    // 2.通过controller监听
    // 设置默认文本
    _unnameController.text = 'hello world';
    // 选择文本
    _unnameController.selection = TextSelection(
        baseOffset: 2, extentOffset: _unnameController.text.length);
    // 监听输入改变
    _unnameController.addListener(() {
      print(_unnameController.text);
    });

    // 监听焦点变化
    focusNode1.addListener(() {
      print(focusNode1.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('输入框'),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          hintColor: Colors.grey[200], //定义下划线颜色
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.grey),
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // 输入框
              TextField(
                autofocus: true,
                focusNode: focusNode1, // 关联focusNode1
                controller: _unnameController,
                onChanged: (value) {
                  // 1.设置onChanged回调监听
                  print('onChanged: $value');
                },
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  prefixIcon: Icon(Icons.person),
                  // 未获得焦点下划线设为灰色
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  // 获得焦点下划线设为蓝色
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              TextField(
                focusNode: focusNode2, // 关联focusNode2
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '您的登录密码',
                    prefixIcon: Icon(Icons.lock)),
              ),
              Container(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: '电子邮件地址',
                    prefixIcon: Icon(Icons.email),
                    border: InputBorder.none,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[200],
                      width: 1.0,
                    ),
                  ),
                ),
              ),

              Builder(builder: (context) {
                return Column(
                  children: [
                    RaisedButton(
                      child: Text('移动焦点'),
                      onPressed: () {
                        //将焦点从第一个TextField移到第二个TextField
                        // 这是一种写法
                        // FocusScope.of(context).requestFocus(focusNode2);
                        // 这是第二种写法
                        if (null == focusScopeNode) {
                          focusScopeNode = FocusScope.of(context);
                        }
                        focusScopeNode.requestFocus(focusNode2);
                      },
                    ),
                    RaisedButton(
                      child: Text('隐藏键盘'),
                      onPressed: () {
                        // 当所有编辑框都失去焦点时键盘就会收起
                        focusNode1.unfocus();
                        focusNode2.unfocus();
                      },
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class FormTestPage extends StatefulWidget {
  @override
  _FormTestPageState createState() => _FormTestPageState();
}

class _FormTestPageState extends State<FormTestPage> {
  TextEditingController _unController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表单'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: _unController,
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  icon: Icon(Icons.person),
                ),
                // 校验用户名
                validator: (value) {
                  return value.trim().length > 0 ? null : '用户名不能为空';
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '您的登录密码',
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                // 校验密码
                validator: (value) {
                  return value.trim().length > 5 ? null : '密码不能少于6位';
                },
              ),
              // 登录按钮
              Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        child: Text('登录'),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          //在这里不能通过此方式获取FormState，context不对
                          //print(Form.of(context));

                          // 通过_formKey.currentState 获取FormState后，
                          // 调用validate()方法校验用户名密码是否合法，校验
                          // 通过后再提交数据。
                          // if ((_formKey.currentState as FormState).validate()) {
                          //   // 验证通过提交数据dd
                          // }
                          //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                          if (Form.of(context).validate()) {
                            //验证通过提交数据

                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
