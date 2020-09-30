import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_verification_box/verification_box.dart';
import 'package:mei_back/netUtil/NetUtil.dart';
import 'package:mei_back/netUtil/neturls.dart';
import 'package:oktoast/oktoast.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String phone = "";
  TextEditingController controller = TextEditingController();
  bool isSendCode = false;
  int countdown = 0;
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (isSendCode) {
              setState(() {
                code = "";
                isSendCode = false;
              });
              return;
            }
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: isSendCode == true ? afterSendCode() : beforSendCode(),
      ),
    );
  }

  Widget beforSendCode() {
    return Container(
      padding: EdgeInsets.only(left: 22.5, right: 22.5, top: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("注册账号",
              style: TextStyle(fontSize: 28.5, color: Color(0xff2f2f2f))),
          SizedBox(height: 50),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "请输入手机号",
            ),
            maxLength: 11,
            keyboardType: TextInputType.phone,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                    onPressed: () {
                      phone = controller.text.toString();
                      if (phone.length != 11) {
                        showToast("请输入11位手机号");
                        return;
                      }
                      sendCode();
                    },
                    height: 50,
                    shape: StadiumBorder(),
                    textColor: Colors.white,
                    color: Color(0xffC3AB87),
                    child: Text(
                      "下一步",
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget afterSendCode() {
    return Container(
      padding: EdgeInsets.only(left: 22.5, right: 22.5, top: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("验证码已发送至",
              style: TextStyle(fontSize: 28.5, color: Color(0xff2f2f2f))),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Text(phone,
                    style: TextStyle(fontSize: 15, color: Color(0xff9C9C9C))),
              ),
              countdown != 0
                  ? Container(
                      height: 40,
                      child: Text(
                        "($countdown s)",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xffC3AB87)),
                      ),
                    )
                  : Container(
                      height: 40,
                      child: MaterialButton(
                          onPressed: () {
                            sendCode();
                          },
                          height: 35,
                          shape: StadiumBorder(),
                          textColor: Colors.white,
                          color: Color(0xffC3AB87),
                          child: Text(
                            "重新发送",
                            style: TextStyle(fontSize: 14),
                          )),
                    )
            ],
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 20),
            child: VerificationBox(
              count: 4,
              textStyle: TextStyle(color: Colors.black, fontSize: 30),
              type: VerificationBoxItemType.underline,
              onSubmitted: (value) {
                setState(() {
                  code = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                    onPressed: () {
                      if (code.length != 4) {
                        showToast("请输入验证码");
                        return;
                      }
                      registerAccount();
                    },
                    height: 50,
                    shape: StadiumBorder(),
                    textColor: Colors.white,
                    color: Color(0xffC3AB87),
                    child: Text(
                      "下一步",
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }

  void sendCode() {
    NetUtil.post(NetUrls.get_registerverify_code, {"mobile": phone}, (result) {
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
      setState(() {
        countdown = 0;
      });
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

  void registerAccount() {
    NetUtil.post(NetUrls.register,
        {"login_id": phone, "pass1": "123456", "mobile_code": code}, (result) {
//  {"user":{"login_id":"17310373503","mobile_code":"1491","login_pass":"e10adc3949ba59abbe56e057f20f883e","platform":"app","meicheng_sess_uid":1733,"meicheng_sess_id":"17310373503","nick":"17310373503","user_id":1733,"username":"17310373503","nickname":"17310373503","chatSessionId":"","meicheng_is_admin":0},"token":{"client_id":1733,"group_id":1,"username":"17310373503","rank_list":"board","corp_id":1,"client_type":1,"platform":"app","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJhcGkiLCJhdWQiOjE3MzMsImRhdGEiOnsiYSI6MTczMywidCI6MSwiZyI6MSwidSI6IjE3MzEwMzczNTAzIiwiciI6ImJvYXJkIn0sImV4cCI6MTU5NjAwNTA4Mywic2NvcGUiOiJhY2Nlc3MiLCJqdGkiOiI1ZjIwZmViYjE2YmU5In0.Jq1SjKzJ8qIu5xno_bajTViULZ5ySp7ZJX81KEfGR78","token_expires":1597293883,"refresh":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJhcGkiLCJhdWQiOjE3MzMsImRhdGEiOnsiYSI6MTczMywidCI6MSwiZyI6MSwidSI6IjE3MzEwMzczNTAzIiwiciI6ImJvYXJkIn0sImV4cCI6MTU5NzI5Mzg4Mywic2NvcGUiOiJyZWZyZXNoIiwian
      showToast("注册成功，账户为手机号，密码：123456", duration: Duration(seconds: 5));
      Navigator.pop(context);
    }, (error) {
      showToast("请求错误");
    });
  }
}
