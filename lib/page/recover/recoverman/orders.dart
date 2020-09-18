import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mei_back/constant/Constants.dart';

//回收订单
class MyOrder extends StatefulWidget {
  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('我的回收订单'),
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
                  padding: EdgeInsets.only(left: 22, right: 22),
                  child: Column(
                    children: [
                      Container(
                        height: 95,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 22, right: 22),
                        child: TabBar(
                            indicatorColor: Constants.mainColor,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                            ),
                            unselectedLabelStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
                            tabs: [Text('待回收'), Text('待支付'), Text('已完成')]),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: listViewItem,
                        itemCount: 6,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      length: 3,
    );
  }

  Widget listViewItem(BuildContext context, int index) {
    return Container(
      height: 124,
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: 52,
              height: 52,
              imageUrl:
                  "http://www.meichengmall.com/wap/static/img/dd.d215e14f.jpg",
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 84,
              child: Stack(
                children: [
                  Positioned(
                    child: Text(
                      '李先生',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    child: Text(
                      '2020-02-20  14:20',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Text(
                      '订单编号：012255445841577\n上门地址：苏州市高新区金山路44号501室',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: MaterialButton(
                      onPressed: () {},
                      height: 24,
                      minWidth: 77,
                      shape: StadiumBorder(),
                      child: Text(
                        '拨打电话',
                        style:
                            TextStyle(color: Constants.mainColor, fontSize: 11),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
