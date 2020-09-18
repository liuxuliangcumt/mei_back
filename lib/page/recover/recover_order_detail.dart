import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mei_back/constant/Constants.dart';
//订单详情

class RecoverOrderDetail extends StatefulWidget {
  @override
  _RecoverOrderDetailState createState() => _RecoverOrderDetailState();
}

class _RecoverOrderDetailState extends State<RecoverOrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          height: 180,
          imageUrl:
              "http://www.meichengmall.com/wap/static/img/dd.d215e14f.jpg",
        ),
        Scaffold(
          backgroundColor: Color(0x00ffffff),
          appBar: AppBar(
            backgroundColor: Color(0x00ffffff),
            elevation: 0,
            centerTitle: true,
            title: Text('订单详情'),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: InkWell(
                            child: Text(
                              '等待取件',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            onTap: () {
                              showConfigDialog();
                            },
                          ),
                          padding: EdgeInsets.only(left: 40, top: 20),
                          height: 100,
                        ),
                        Container(
                          height: 92,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(left: 22, right: 22),
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  width: 30,
                                  height: 30,
                                  imageUrl:
                                      "http://www.meichengmall.com/wap/static/img/dd.d215e14f.jpg",
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text('默默大师'),
                                        SizedBox(width: 10),
                                        Text(
                                          '86-15456985987',
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      '江苏省苏州市高新区金山路金色家园南组团9栋505室',
                                      maxLines: 2,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 10,
                          color: Color(0xfff1f1f1),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 22, right: 22),
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 45),
                              Text(
                                '商品信息',
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    '类      型\n规      格\n预约保证金\n预约时间\n备注信息',
                                    strutStyle: StrutStyle(height: 2),
                                    style: TextStyle(color: Color(0xff777777)),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      '台式电脑\n台式主机\n￥100 环保金\n2020-02-20 19:00:00\n无 ',
                                      strutStyle: StrutStyle(height: 2),
                                    ),
                                  ),
                                  MaterialButton(
                                      onPressed: () {
                                        showModifyDialog();
                                      },
                                      height: 25,
                                      minWidth: 45,
                                      shape: StadiumBorder(
                                          side: BorderSide(
                                              color: Constants.mainColor,
                                              width: 0.5)),
                                      textColor: Constants.mainColor,
                                      color: Colors.white,
                                      child: Text(
                                        "修改",
                                        style: TextStyle(fontSize: 11),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(
                              top: 22, left: 22, right: 22, bottom: 22),
                          child: GridView.builder(
                            itemCount: 9,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                            ),
                            itemBuilder: imageListViewItem,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  void showConfigDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          //return CupertinoButton();
          return AlertDialog(
            title: Text('确认完成'),
            content: Text('是否确认回收员已上门回收并支付了环保金？'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('取消'),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('确认'),
              ),
            ],
          );
        });
  }

  Widget imageListViewItem(BuildContext context, int index) {
    return Container(
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        width: 30,
        height: 30,
        imageUrl: "http://www.meichengmall.com/wap/static/img/dd.d215e14f.jpg",
      ),
    );
  }

  void showModifyDialog() {
  /*  showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Container(
            width: double.infinity,
            height: 300,
            padding: EdgeInsets.only(left: 22, right: 22, top: 35, bottom: 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '预估环保金',
                        style: TextStyle(fontSize: 21),
                      ),
                    ),
                    Icon(
                      Icons.clear,
                      size: 20,
                      color: Colors.black,
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                        prefix: Text(
                      "￥",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '注：请与回收员协商好本次回收金额后输入',
                  style: TextStyle(fontSize: 12, color: Color(0xff9C9C9C)),
                ),
                SizedBox(height: 35),
                Container(
                  alignment: Alignment.center,
                  child: MaterialButton(
                      onPressed: () {},
                      height: 45,
                      minWidth: 210,
                      shape: StadiumBorder(),
                      textColor: Colors.white,
                      color: Color(0xffC3AB87),
                      child: Text(
                        "确定",
                        style: TextStyle(fontSize: 15),
                      )),
                )
              ],
            ),
          );
        });*/
     showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 300,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  color: Colors.black54,
                ),
                Container(

                  width: double.infinity,
                  padding:
                      EdgeInsets.only(left: 22, right: 22, top: 35, bottom: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '预估环保金',
                              style: TextStyle(fontSize: 21),
                            ),
                          ),
                          Icon(
                            Icons.clear,
                            size: 20,
                            color: Colors.black,
                          )
                        ],
                      ),
                      TextField(
                        decoration: InputDecoration(
                            prefix: Text(
                          "￥",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '注：请与回收员协商好本次回收金额后输入',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff9C9C9C)),
                      ),
                      SizedBox(height: 35),
                      Container(
                        alignment: Alignment.center,
                        child: MaterialButton(
                            onPressed: () {},
                            height: 45,
                            minWidth: 210,
                            shape: StadiumBorder(),
                            textColor: Colors.white,
                            color: Color(0xffC3AB87),
                            child: Text(
                              "确定",
                              style: TextStyle(fontSize: 15),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
