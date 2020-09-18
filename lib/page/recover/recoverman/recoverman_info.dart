import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//个人信息
class RecoverManInfo extends StatefulWidget {
  @override
  _RecoverManInfoState createState() => _RecoverManInfoState();
}

class _RecoverManInfoState extends State<RecoverManInfo> {
  TextStyle style1 = TextStyle(color: Color(0xff777777), fontSize: 15);
  TextStyle style2 = TextStyle(fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('回收员信息'),
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
            child: Icon(const IconData(0xe618, fontFamily: "ali"), size: 20),
            onTap: () {},
          ),
          SizedBox(width: 22)
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
                padding: EdgeInsets.only(left: 22, right: 22),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 60,
                              child: Text(
                                '紧急联系电话',
                                style: style1,
                              )),
                          SizedBox(width: 46),
                          Text(
                            '默默大师',
                            style: style2,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 60,
                              child: Text(
                                '姓      名',
                                style: style1,
                              )),
                          SizedBox(width: 46),
                          Text('默默大师', style: style2)
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 60,
                              child: Text(
                                '性      别',
                                style: style1,
                              )),
                          SizedBox(width: 46),
                          Text(
                            '男',
                            style: style2,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 60,
                              child: Text(
                                '电      话',
                                style: style1,
                              )),
                          SizedBox(width: 46),
                          Text(
                            '15152657845',
                            style: style2,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 60,
                              child: Text(
                                '紧急联系人',
                                style: style1,
                              )),
                          SizedBox(width: 46),
                          Text(
                            '张晓华',
                            style: style2,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 60,
                              child: Text(
                                '详细住址',
                                style: style1,
                              )),
                          SizedBox(width: 46),
                          Text(
                            '江苏省苏州市高新区金山路44栋12楼',
                            style: style2,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 60,
                              child: Text(
                                '回收类别',
                                style: style1,
                              )),
                          SizedBox(width: 46),
                          Text(
                            '玻璃/纸/金属',
                            style: style2,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 60,
                              child: Text(
                                '负责区域',
                                style: style1,
                              )),
                          SizedBox(width: 46),
                          Text(
                            '江苏省苏州市高新区',
                            style: style2,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 60,
                              child: Text(
                                '身份证号',
                                style: style1,
                              )),
                          SizedBox(width: 46),
                          Text(
                            '325266587954845126',
                            style: style2,
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 60,
                              child: Text(
                                '身份认证',
                                style: style1,
                              )),
                          SizedBox(width: 46),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                children: [
                                  CachedNetworkImage(
                                    height: 160,
                                    fit: BoxFit.cover,
                                    width: 200,
                                    imageUrl:
                                        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599626344886&di=14b1a1a6bd875341778524c8cee8f6f1&imgtype=0&src=http%3A%2F%2Fs9.rr.itc.cn%2Fr%2FwapChange%2F20165_29_10%2Fa3vwtv5815261661352.jpg",
                                  ),
                                  SizedBox(height: 20),
                                  CachedNetworkImage(
                                    height: 160,
                                    fit: BoxFit.cover,
                                    width: 200,
                                    imageUrl:
                                        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599626344886&di=14b1a1a6bd875341778524c8cee8f6f1&imgtype=0&src=http%3A%2F%2Fs9.rr.itc.cn%2Fr%2FwapChange%2F20165_29_10%2Fa3vwtv5815261661352.jpg",
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
