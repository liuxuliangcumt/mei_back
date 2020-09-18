import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mei_back/constant/Constants.dart';
import 'package:mei_back/page/recover/recover_order_detail.dart';

//我的订单
class RecoverMyOrder extends StatefulWidget {
  @override
  _RecoverMyOrderState createState() => _RecoverMyOrderState();
}

class _RecoverMyOrderState extends State<RecoverMyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('我的订单'),
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return DefaultTabController(
              length: 4,
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height - 56,
                    child: Column(
                      children: [
                        towButton(),
                        SizedBox(height: 20),
                        Visibility(
                          child: TabBar(
                            isScrollable: true,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Constants.mainColor,
                            tabs: [
                              Text('全部订单'),
                              Text('待取件'),
                              Text('订单完成'),
                              Text('已取消')
                            ],
                            labelColor: Colors.black,
                            unselectedLabelColor: Color(0xffB5B5B5),
                            labelStyle: TextStyle(fontSize: 18),
                            unselectedLabelStyle: TextStyle(fontSize: 15),
                          ),
                          visible: onDoor,
                        ),
                        Visibility(
                            child: SizedBox(height: 10), visible: onDoor),
                        Visibility(
                            child: Expanded(
                              child: TabBarView(
                                children: [
                                  listView1(),
                                  listView1(),
                                  listView1(),
                                  listView1(),
                                ],
                              ),
                            ),
                            visible: onDoor),
                        Visibility(
                          child: Expanded(
                            child: ListView.builder(
                              itemCount: 6,
                              itemBuilder: listViewItemRecycle,
                            ),
                          ),
                          visible: !onDoor,
                        )
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }

  bool onDoor = true;

  Widget towButton() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              onPressed: () {
                setState(() {
                  onDoor = !onDoor;
                });
              },
              height: 30,
              minWidth: 90,
              shape: onDoor
                  ? StadiumBorder(
                      side: BorderSide(color: Constants.mainColor, width: 1))
                  : StadiumBorder(),
              textColor: onDoor ? Constants.mainColor : Colors.black,
              color: Color(0xffF1F1F1),
              child: Text(
                "上门回收",
                style: TextStyle(fontSize: 13),
              )),
          SizedBox(width: 28),
          MaterialButton(
              onPressed: () {
                setState(() {
                  onDoor = !onDoor;
                });
              },
              height: 30,
              minWidth: 90,
              shape: StadiumBorder(),
              textColor: onDoor ? Colors.black : Constants.mainColor,
              color: Color(0xffF1F1F1),
              child: Text(
                "智能回收",
                style: TextStyle(fontSize: 13),
              )),
        ],
      ),
    );
  }

  Widget listView1() {
    return Container(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: listViewItem1,
      ),
    );
  }

  Widget listViewItem1(BuildContext context, int index) {
    String category = "台式电脑";
    String size = "台式主机";
    String payNum = "1220";
    String time = "2020-02-20 19:00:00";
    return Container(
      padding: EdgeInsets.only(left: 22, right: 22, top: 20, bottom: 15),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 10, color: Color(0xffF7F7F7)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [Expanded(child: Text('订单编号:11120502000')), Text('交易成功')],
          ),
          Container(
            margin: EdgeInsets.only(top: 9),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  height: 83,
                  width: 83,
                  imageUrl:
                      "http://www.meichengmall.com/wap/static/img/b2.4b82763c.png",
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Text(
                    '类      型：$category\n规      格：$size\n预约保证金：$payNum\n预约时间：$time',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Text('X1')
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                  onPressed: () {},
                  height: 26,
                  minWidth: 80,
                  shape: StadiumBorder(
                      side: BorderSide(color: Color(0xffF1F1F1), width: 0.5)),
                  textColor: Colors.black,
                  color: Colors.white,
                  child: Text(
                    "取消订单",
                    style: TextStyle(fontSize: 13),
                  )),
              SizedBox(width: 28),
              MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => RecoverOrderDetail()));
                  },
                  height: 26,
                  minWidth: 80,
                  shape: StadiumBorder(
                      side: BorderSide(color: Constants.mainColor, width: 0.5)),
                  textColor: Constants.mainColor,
                  color: Colors.white,
                  child: Text(
                    "查看详情",
                    style: TextStyle(fontSize: 13),
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget listViewItemRecycle(BuildContext context, int index) {
    String numBer = "P05523654";
    String address = "北京朝阳呼家楼";
    String type = "台式电脑";
    String num = "4";
    String payNum = "100";
    String time = "2020-02-23 19:00:00";
    return Container(
      height: 300,
      padding: EdgeInsets.only(left: 22, right: 22, bottom: 18, top: 36),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 10, color: Color(0xfff1f1f1)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '订单编号:11120502000',
            style: TextStyle(
                color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 35),
          Text(
            '回收柜编号                $numBer\n回收柜地址                $address\n类      型                      $type\n数      量                      $num\n实际回收环保金        $payNum\n回收时间                    $time',
            strutStyle: StrutStyle(height: 2),
          )
        ],
      ),
    );
  }
}
