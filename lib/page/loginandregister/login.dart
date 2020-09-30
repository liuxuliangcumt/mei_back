import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mei_back/netUtil/NetUtil.dart';
import 'package:mei_back/netUtil/neturls.dart';
import 'package:mei_back/page/loginandregister/register.dart';
import 'package:mei_back/src/colors/themecolors.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import 'modifypassword.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  String phone = "";

  bool pwdLogin = true;
  bool isSendCode = false;
  int countdown = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            if (pwdLogin) {
              Navigator.pop(context);
            } else {
              setState(() {
                pwdLogin = true;
              });
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 30, left: 22.5, right: 22.5),
          child: pwdLogin == true ? passwordLogin() : codeLogin(),
        ),
      ),
    );
  }

  Widget codeLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("手机\n验证码登录",
            style: TextStyle(fontSize: 28.5, color: Color(0xff2f2f2f))),
        SizedBox(height: 65),
        TextField(
          controller: phoneController,
          decoration: InputDecoration(
            hintText: "请输入手机号",
            prefixIcon: Icon(Icons.phone_android),
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.green, //边框颜色为绿色
              width: 1, //宽度为5
            )),
          ),
          keyboardType: TextInputType.phone,
          maxLength: 11,
          style: TextStyle(fontSize: 15),
        ), //账号
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: codeController,
          decoration: InputDecoration(
            hintText: "请输入验证码",
            prefixIcon: Icon(Icons.security),
            suffixIcon: InkWell(
              onTap: () {
                if (countdown != 0) {
                  return;
                }
                phone = phoneController.text.toString();
                if (phone.length != 11) {
                  showToast("请输入11位手机号");
                  return;
                }

                sendCode();
              },
              child: Container(
                  width: 70,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Color(0x33C3A487),
                      border: Border.all(color: Color(0xffC3AB87), width: 1),
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: Text(countdown == 0 ? "验证码" : "$countdown",
                      style: TextStyle(color: Color(0xffC3AB87)))),
            ),
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.green, //边框颜色为绿色
              width: 1, //宽度为5
            )),
          ),
          keyboardType: TextInputType.phone,
          maxLength: 4,
          style: TextStyle(fontSize: 15),
        ), //密码
        Container(
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    pwdLogin = true;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child: Text('账号密码登录', style: TextStyle(fontSize: 10)),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ModifyPassword()));
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child: Text(
                    '忘记密码？',
                    style:
                        TextStyle(fontSize: 10, color: ThemeColors.colorTheme),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 40),
            child: Row(children: [
              Expanded(
                child: MaterialButton(
                    onPressed: () {
                      loginCode();
                    },
                    height: 50,
                    shape: StadiumBorder(),
                    textColor: Colors.white,
                    color: Color(0xffC3AB87),
                    child: Text(
                      "登录",
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ])), //button
      ],
    );
  }

  Widget passwordLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("欢迎\n来到美城茂",
            style: TextStyle(fontSize: 28.5, color: Color(0xff2f2f2f))),
        SizedBox(height: 65),
        TextField(
          controller: accountController,
          decoration: InputDecoration(
            hintText: "请输入账号",
            prefixIcon: Icon(Icons.phone_android),
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.green, //边框颜色为绿色
              width: 1, //宽度为5
            )),
          ),
          keyboardType: TextInputType.phone,
          style: TextStyle(fontSize: 15),
        ), //账号
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "请输入密码",
            prefixIcon: Icon(Icons.lock_outline),
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.green, //边框颜色为绿色
              width: 1, //宽度为5
            )),
          ),
          keyboardType: TextInputType.visiblePassword,
          style: TextStyle(fontSize: 15),
        ), //密码
        Container(
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    pwdLogin = false;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child: Text('手机验证码登录', style: TextStyle(fontSize: 10)),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ModifyPassword()));
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child: Text(
                    '忘记密码？',
                    style:
                        TextStyle(fontSize: 10, color: ThemeColors.colorTheme),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 40),
            child: Row(children: [
              Expanded(
                child: MaterialButton(
                    onPressed: () {
                      loginAccount();
                    },
                    height: 50,
                    shape: StadiumBorder(),
                    textColor: Colors.white,
                    color: Color(0xffC3AB87),
                    child: Text(
                      "登录",
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ])), //button

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
              child: Text("还没有账号？立即注册", style: TextStyle(fontSize: 7)),
            )
          ],
        ),
      ],
    );
  }

  void loginAccount() {
    String phone = accountController.text.toString();
    String pwd = passwordController.text.toString();
    if (phone.length == 0 || pwd.length == 0) {
      showToast("请输入账户和密码");
      return;
    }

    NetUtil.post(NetUrls.login, {"login_id": phone, "login_pass": pwd},
        (result) {
      saveLoginResult(result);
      Navigator.push(context, MaterialPageRoute(builder: (b) => MyHomePage()));
    }, (error) {
      showToast("登录失败");
    });
  }

  void saveLoginResult(data) async {
    print("登录结果保存前：   $data");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("login", data.toString());
  }

  void sendCode() {
    countdown = 1; //修改点击 不可点
    NetUtil.post(NetUrls.get_loginverify_code, {"mobile": phone}, (result) {
      //    {"code":8460,"msg":"短信发送成功"}
      String resMsg = result.data["msg"];
      if (resMsg.endsWith("短信发送成功")) {
        setState(() {
          isSendCode = true;
          countdown = 60;
        });
        startTimeCountDown();
        showToast(resMsg);
      }
    }, (error) {
      countdown = 0; //修改点击 可点
      showToast("请求错误");
      print("出错了");
      print(error);
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }

    super.dispose();
  }

  Timer _timer;

  void startTimeCountDown() {
    if (_timer != null && _timer.isActive) {
      return;
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
      });
      if (countdown == 0) {
        _timer.cancel();
      }
    });
  }

//验证码登录
  void loginCode() {
    String phone = phoneController.text.toString();
    String code = codeController.text.toString();
    if (phone.length == 0 || code.length == 0) {
      showToast("请输入手机号和密码");
      return;
    }

    NetUtil.post(NetUrls.phlogin, {"login_id": phone, "mobile_code": code},
        (result) {
      saveLoginResult(result);
      Navigator.pop(context, result.data);
    }, (error) {
      showToast("登录失败");
    });
  }
}
