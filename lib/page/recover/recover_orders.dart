import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mei_back/constant/Constants.dart';

//回收清单
class RecoverOrders extends StatefulWidget {
  @override
  _RecoverOrdersState createState() => _RecoverOrdersState();
}

class _RecoverOrdersState extends State<RecoverOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          InkWell(
            child: Container(
              child: Text(
                '管理',
                style: TextStyle(color: Constants.mainColor, fontSize: 13),
              ),
            ),
          ),
          SizedBox(width: 20)
        ],
        centerTitle: true,
        title: Text('回收清单'),
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
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: 5,
                      itemBuilder: listVIewItem,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget listVIewItem(BuildContext context, int index) {
    String category = "台式电脑";
    String size = "台式主机";
    String payNum = "1220";
    return Container(
      height: 122,
      margin: EdgeInsets.only(left: 22, right: 22),
      padding: EdgeInsets.only(top: 22, bottom: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            height: 83,
            width: 83,
            imageUrl: "",
          ),
          SizedBox(width: 14),
          Expanded(
            child: Text('类      型：$category\n规      格：$size\n预约保证金：payNum'),
          ),
          Text('X1')
        ],
      ),
    );
  }
}
