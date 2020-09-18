import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mei_back/constant/Constants.dart';

//抢单
class GrabOrder extends StatefulWidget {
  @override
  _GrabOrderState createState() => _GrabOrderState();
}

class _GrabOrderState extends State<GrabOrder> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('回收员抢单页'),
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
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        child: TabBar(
                          tabs: [
                            Text('最新订单'),
                            Text('离我最近'),
                          ],
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Constants.mainColor,
                          labelStyle:
                          TextStyle(color: Color(0xff020202), fontSize: 18),
                          unselectedLabelStyle:
                          TextStyle(color: Color(0xffB5B5B5), fontSize: 17),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height-96,
                        child: TabBarView(children: [
                          Container(
                            child: ListView.builder(
                              itemBuilder: listViewItem,
                              itemCount: 6,
                            ),
                          ),
                          Container(
                            child: ListView.builder(
                              itemBuilder: listViewItem,
                              itemCount: 6,
                            ),
                          )
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      length: 2,
    );
  }

  Widget listViewItem(BuildContext context, int index) {
    return Container(
      height: 220,
      margin: EdgeInsets.only(left: 22, right: 22),
      padding: EdgeInsets.only(top: 20, bottom: 10),
      decoration: BoxDecoration(
          border:
          Border(bottom: BorderSide(color: Color(0xffF1F1F1), width: 1))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl:
              "http://www.meichengmall.com/wap/static/img/banner4.58e9237c.jpg",
              fit: BoxFit.cover,
              width: 52,
              height: 52,
            ),
          ),
          SizedBox(width: 15),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width - 111,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('李先生', style: TextStyle(fontSize: 15)),
                Row(
                  children: [
                    Text('2020-02-20  14:20'),
                    Icon(Icons.phone, color: Constants.mainColor, size: 15),
                    Text('电话卖家', style: TextStyle(color: Constants.mainColor)),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  '订单编号：012255445841577',
                  style: TextStyle(fontSize: 12, color: Color(0xff777777)),
                ),
                Text(
                  '物品类型：家用电器',
                  style: TextStyle(fontSize: 12, color: Color(0xff777777)),
                ),
                Text(
                  '备      注：还有些纸盒需要回收',
                  style: TextStyle(fontSize: 12, color: Color(0xff777777)),
                ),
                Text(
                  '上门地址：江苏省苏州市高新区金山路1144号501室内',
                  style: TextStyle(fontSize: 12, color: Color(0xff777777)),
                  maxLines: 2,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: MaterialButton(
                      onPressed: () {},
                      height: 26,
                      minWidth: 60,
                      shape: StadiumBorder(),
                      textColor: Colors.white,
                      color: Color(0xffC3AB87),
                      child: Text(
                        "抢单",
                        style: TextStyle(fontSize: 12),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
