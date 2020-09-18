import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mei_back/constant/Constants.dart';
import 'package:mei_back/page/recover/sark/sark_setting.dart';

// 我的回收柜
class RecoverManSark extends StatefulWidget {
  @override
  _RecoverManSarkState createState() => _RecoverManSarkState();
}

class _RecoverManSarkState extends State<RecoverManSark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的回收柜'),
        elevation: 0,
        centerTitle: true,
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
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height - 56 - 90,
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 22, right: 22),
                      title: Text('当前取货实时价格'),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 10,
                      color: Color(0xffF7F7F7),
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemBuilder: listViewIiem,
                      itemCount: 3,
                    )),
                    MaterialButton(
                        onPressed: () {},
                        height: 45,
                        minWidth: 200,
                        shape: StadiumBorder(),
                        textColor: Colors.white,
                        color: Color(0xffC3AB87),
                        child: Text(
                          "添加回收柜",
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget listViewIiem(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(left: 22, right: 22),
      padding: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xffF1F1F1), width: 1))),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 40,
            child: Stack(
              children: [
                Positioned(
                  child: Text(
                    'PS123456',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  left: 0,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => SarkSetting()));
                      },
                      height: 18,
                      minWidth: 42,
                      shape: StadiumBorder(
                          side:
                              BorderSide(color: Constants.mainColor, width: 1)),
                      textColor: Constants.mainColor,
                      color: Colors.white,
                      child: Text(
                        "设置",
                        style: TextStyle(fontSize: 11),
                      )),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Row(
                    children: [
                      Icon(Icons.location_on,
                          color: Constants.mainColor, size: 15),
                      Text(
                        '中央财经地下车库1号回收机',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Container(
                width: 42,
                alignment: Alignment.center,
                height: 18,
                decoration: BoxDecoration(
                    color: Color(0xffFEF3F5),
                    borderRadius: BorderRadius.circular(9)),
                child: Text(
                  '未满',
                  style: TextStyle(fontSize: 11, color: Color(0xffFF6E71)),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Text(
                '塑料瓶：100个',
                style: TextStyle(fontSize: 12, color: Color(0xff777777)),
              )),
              Text(
                '￥15.33',
                style: TextStyle(fontSize: 12, color: Color(0xff777777)),
              )
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 42,
                alignment: Alignment.center,
                height: 18,
                decoration: BoxDecoration(
                    color: Color(0xffF3FBFE),
                    borderRadius: BorderRadius.circular(9)),
                child: Text(
                  '消毒',
                  style: TextStyle(fontSize: 11, color: Color(0xff50C5F9)),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Text(
                '塑料瓶：100个',
                style: TextStyle(fontSize: 12, color: Color(0xff777777)),
              )),
              Text(
                '￥15.33',
                style: TextStyle(fontSize: 12, color: Color(0xff777777)),
              )
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 42,
                alignment: Alignment.center,
                height: 18,
                decoration: BoxDecoration(
                    color: Color(0xffFEF9F3),
                    borderRadius: BorderRadius.circular(9)),
                child: Text(
                  '已满',
                  style: TextStyle(fontSize: 11, color: Color(0xffF9B350)),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Text(
                '塑料瓶：100个',
                style: TextStyle(fontSize: 12, color: Color(0xff777777)),
              )),
              Text(
                '￥15.33',
                style: TextStyle(fontSize: 12, color: Color(0xff777777)),
              )
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 42,
                alignment: Alignment.center,
                height: 18,
                decoration: BoxDecoration(
                    color: Color(0xffFEF9F3),
                    borderRadius: BorderRadius.circular(9)),
                child: Text(
                  '已满',
                  style: TextStyle(fontSize: 11, color: Color(0xffF9B350)),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Text(
                '塑料瓶：100个',
                style: TextStyle(fontSize: 12, color: Color(0xff777777)),
              )),
              Text(
                '￥15.33',
                style: TextStyle(fontSize: 12, color: Color(0xff777777)),
              )
            ],
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '合计/￥83.60',
              style: TextStyle(color: Constants.mainColor, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
