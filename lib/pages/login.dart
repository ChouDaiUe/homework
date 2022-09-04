import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/loginController.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  _loginsheet() async {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        builder: (context) {
          return Container(
            constraints: const BoxConstraints(maxHeight: 650),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode()); // 收起键盘
              },
              child: Container(
                  child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 340,
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.highlight_off,
                          size: 35,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "登录",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                    // 所有内容都设置向内55
                    padding: EdgeInsets.all(55),
                    // 垂直布局
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              // 输入学号
                              TextFormField(
                                autofocus: false,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    hintText: '请输入学号',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                validator: (value) {
                                  if (value!.length < 9) {
                                    return '请输入9位学号';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              // 输入密码
                              TextFormField(
                                obscureText: true,
                                autofocus: false,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    hintText: '请输入密码',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                // 输入框校验
                                validator: (value) {
                                  if (value!.length < 6) {
                                    return '请输入正确的密码';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            FlatButton(
                              child: Text(
                                '找回密码',
                                style: TextStyle(color: Colors.black54),
                              ),
                              onPressed: () {
                                print('找回密码');
                              },
                            ),
                            SizedBox(width: 100),
                            FlatButton(
                              child: Text(
                                '找回密码',
                                style: TextStyle(color: Colors.black54),
                              ),
                              onPressed: () {
                                print('找回密码');
                              },
                            ),
                          ],
                        ),
                        Container(
                          height: 44,
                          width: MediaQuery.of(context).size.width - 110,
                          decoration: BoxDecoration(
                              color: Colors.blue, //MTColors.main_color,
                              borderRadius: BorderRadius.circular(5)),
                          child: FlatButton(
                            child: Text(
                              '登录',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _login();
                              }
                            },
                          ),
                        ),
                        Container(
                          child: Center(
                            child: FlatButton(
                              child: Text('注册账号',
                                  style: TextStyle(color: Colors.black54)),
                              onPressed: () {
                                print('注册');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(LoginScreenController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Image.asset('images/login_back.png'),
            ElevatedButton(onPressed: _loginsheet, child: Text("login")),
          ],
        ),
      ),
    );
  }

  _login() {
    final _loginController = Get.find<LoginScreenController>();
    _loginController.login(context);
  }
}

//Image.asset('images/login_back.png')