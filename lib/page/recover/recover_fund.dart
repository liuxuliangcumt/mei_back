import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mei_back/constant/Constants.dart';

//环保基金分
class RecoverFund extends StatefulWidget {
  @override
  _RecoverFundState createState() => _RecoverFundState();
}

class _RecoverFundState extends State<RecoverFund> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          InkWell(
            child: Container(
              child: Text(
                '明细',
                style: TextStyle(color: Constants.mainColor, fontSize: 13),
              ),
            ),
          ),
          SizedBox(width: 20)
        ],
        centerTitle: true,
        title: Text('我的环保金'),
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 22, right: 22),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Text('环保金 ?'),
                            SizedBox(height: 20),
                            Text(
                              '0.00',
                              style:
                                  TextStyle(fontSize: 33, color: Colors.black),
                            ),
                            SizedBox(height: 50),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "请输入兑换数量",
                                      border: InputBorder.none,
                                      helperText: "1环保金可兑换1元人名币",
                                      helperStyle: TextStyle(
                                          fontSize: 10,
                                          color: Constants.mainColor),
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                    onPressed: () {},
                                    height: 28,
                                    minWidth: 82,
                                    shape: StadiumBorder(
                                        side: BorderSide(
                                            color: Constants.mainColor,
                                            width: 1)),
                                    textColor: Constants.mainColor,
                                    color: Colors.white,
                                    child: Text(
                                      "全部兑换",
                                      style: TextStyle(fontSize: 15),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 10,
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        color: Color(0xffF7F7F7),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 7, right: 7),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                '选择到账方式',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: Color(0xffD0D0D0),
                              ),
                            ),
                            Container(
                              color: Color(0xffF7F7F7),
                              height: 1,
                            ),
                            ListTile(
                              leading: Image.asset(
                                "assets/images/recover_card.png",
                                width: 30,
                                height: 30,
                              ),
                              title: Text(
                                '储蓄卡',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                              trailing: MaterialButton(
                                  onPressed: () {},
                                  height: 28,
                                  elevation: 0,
                                  minWidth: 60,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: Constants.mainColor,
                                          width: 1)),
                                  textColor: Constants.mainColor,
                                  color: Colors.white,
                                  child: Text(
                                    "添加",
                                    style: TextStyle(fontSize: 15),
                                  )),
                            ),
                            ListTile(
                              leading: Image.asset(
                                "assets/images/wechat_pay.png",
                                width: 30,
                                height: 30,
                              ),
                              title: Text(
                                '微信零钱',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                              trailing: MaterialButton(
                                  onPressed: () {},
                                  height: 28,
                                  elevation: 0,
                                  minWidth: 60,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: Constants.mainColor,
                                          width: 1)),
                                  textColor: Constants.mainColor,
                                  color: Colors.white,
                                  child: Text(
                                    "添加",
                                    style: TextStyle(fontSize: 15),
                                  )),
                            ),
                            ListTile(
                              leading: Image.asset(
                                "assets/images/ali_pay.png",
                                width: 30,
                                height: 30,
                              ),
                              title: Text(
                                '支付宝',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                              trailing: MaterialButton(
                                  onPressed: () {},
                                  height: 28,
                                  elevation: 0,
                                  minWidth: 60,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: Constants.mainColor,
                                          width: 1)),
                                  textColor: Constants.mainColor,
                                  color: Colors.white,
                                  child: Text(
                                    "添加",
                                    style: TextStyle(fontSize: 15),
                                  )),
                            ),
                            SizedBox(height: 40),
                            MaterialButton(
                                onPressed: () {},
                                height: 50,
                                minWidth: 200,
                                shape: StadiumBorder(),
                                textColor: Colors.white,
                                color: Color(0xffC3AB87),
                                child: Text(
                                  "确认兑换",
                                  style: TextStyle(fontSize: 15),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
