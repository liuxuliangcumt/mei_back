import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mei_back/customview/easyaround.dart';
import 'package:mei_back/page/recover/recoverman/recoverman_collect.dart';
import 'package:mei_back/page/recover/recoverman/recoverman_info.dart';
import 'package:mei_back/page/recover/recoverman/recoverman_profit.dart';
import 'package:mei_back/page/recover/recoverman/recoverman_sark.dart';

import 'grab_order.dart';
import 'orders.dart';

//回收员主页
class RecoverManHome extends StatefulWidget {
  @override
  _RecoverManHomeState createState() => _RecoverManHomeState();
}

class _RecoverManHomeState extends State<RecoverManHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('陌陌大师'),
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          InkWell(
            child: Icon(const IconData(0xe604, fontFamily: "ali"), size: 20),
            onTap: () {},
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 22, right: 22, top: 10),
                child: Column(
                  children: [
                    fourButton(),
                    SizedBox(height: 30),
                    InkWell(
                      child: Container(
                        height: 60,
                        child: Row(
                          children: [
                            Padding(
                              child: Image.asset(
                                'assets/images/pay_dill.png',
                                width: 25,
                              ),
                              padding: EdgeInsets.only(top: 5),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                '上门回收订单',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Color(0xffD0D0D0),
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Container(
                        height: 60,
                        child: Row(
                          children: [
                            Padding(
                              child: Image.asset(
                                'assets/images/pay_dill.png',
                                width: 25,
                              ),
                              padding: EdgeInsets.only(top: 5),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                '我的订单',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Color(0xffD0D0D0),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => MyOrder()));
                      },
                    ),
                    InkWell(
                      child: Container(
                        height: 60,
                        child: Row(
                          children: [
                            Padding(
                              child: Image.asset(
                                'assets/images/rec_h_3.png',
                                width: 25,
                              ),
                              padding: EdgeInsets.only(top: 5),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                '我的收益',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Color(0xffD0D0D0),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => RecoverManProfit()));
                      },
                    ),
                    InkWell(
                      child: Container(
                        height: 60,
                        child: Row(
                          children: [
                            Padding(
                              child: Image.asset(
                                'assets/images/rec_h_2.png',
                                width: 25,
                              ),
                              padding: EdgeInsets.only(top: 5),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                '我的柜子',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Color(0xffD0D0D0),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => RecoverManSark()));
                      },
                    ),
                    InkWell(
                      child: Container(
                        height: 60,
                        child: Row(
                          children: [
                            Padding(
                              child: Image.asset(
                                'assets/images/recoverman_storehouse.png',
                                width: 25,
                              ),
                              padding: EdgeInsets.only(top: 5),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                '附近仓储',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Color(0xffD0D0D0),
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Container(
                        height: 60,
                        child: Row(
                          children: [
                            Padding(
                              child: Image.asset(
                                'assets/images/recoverman.png',
                                width: 25,
                              ),
                              padding: EdgeInsets.only(top: 5),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                '个人信息',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Color(0xffD0D0D0),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => RecoverManInfo()));
                      },
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => GrabOrder()));
                        },
                        height: 50,
                        minWidth: 200,
                        shape: StadiumBorder(),
                        textColor: Colors.white,
                        color: Color(0xffC3AB87),
                        child: Text(
                          "去抢单",
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget fourButton() {
    return Container(
      height: 96,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 5.0), //阴影xy轴偏移量
              blurRadius: 10.0, //阴影模糊程度
              spreadRadius: 3.0 //阴影扩散程度
              )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          EasyAround(
            top: Image.asset("assets/images/me_scan.png", width: 22),
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '扫一扫',
              style: TextStyle(fontSize: 12, color: Color(0xff777777)),
            ),
          ),
          EasyAround(
            top: Image.asset("assets/images/recoverman_points.png", width: 22),
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '付积分',
              style: TextStyle(fontSize: 12, color: Color(0xff777777)),
            ),
          ),
          InkWell(
            child: EasyAround(
              top:
                  Image.asset("assets/images/recoverman_points.png", width: 22),
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '收积分',
                style: TextStyle(fontSize: 12, color: Color(0xff777777)),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => RecoverManCollect()));
            },
          ),
          EasyAround(
            top: Image.asset("assets/images/recoverman_points.png", width: 22),
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '充积分',
              style: TextStyle(fontSize: 12, color: Color(0xff777777)),
            ),
          )
        ],
      ),
    );
  }
}
