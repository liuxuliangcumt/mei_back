import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mei_back/constant/Constants.dart';

//回收地址管理
class RecoverAddress extends StatefulWidget {
  @override
  _RecoverAddressState createState() => _RecoverAddressState();
}

class _RecoverAddressState extends State<RecoverAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('地址管理'),
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
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: listViewItem),
                    Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(bottom: 35),
                      child: MaterialButton(
                          onPressed: () {},
                          height: 42,
                          shape: StadiumBorder(),
                          textColor: Colors.white,
                          color: Color(0xffC3AB87),
                          child: Text(
                            "新增回收地址",
                            style: TextStyle(fontSize: 15),
                          )),
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

  Widget listViewItem(BuildContext context, int index) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(left: 22, right: 22),
      padding: EdgeInsets.only(top: 30, bottom: 10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '默默大师',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  '18815698754',
                  style: TextStyle(color: Color(0xff787878), fontSize: 13),
                ),
              ),
              Visibility(
                child: Container(
                  height: 18,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0x20C3AB87),
                      borderRadius: BorderRadius.circular(9),
                      border:
                          Border.all(color: Constants.mainColor, width: 0.5)),
                  child: Text(
                    '默认',
                    style: TextStyle(fontSize: 11, color: Constants.mainColor),
                  ),
                ),
                visible: index == 0 ? true : false,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              '江苏省苏州市高新区金山路星韵花苑2期南组团8栋1204',
              style: TextStyle(fontSize: 12, color: Color(0xff787878)),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Text('设为默认',
                      style:
                          TextStyle(fontSize: 12, color: Color(0xff9C9C9C)))),
              Icon(const IconData(0xe647, fontFamily: "ali"),
                  size: 15, color: Color(0xff9C9C9C)),
              Text(
                '  编辑    |    ',
                style: TextStyle(fontSize: 12, color: Color(0xff9C9C9C)),
              ),
              SizedBox(width: 10),
              Icon(Icons.delete, size: 15, color: Color(0xff9C9C9C)),
              Text(
                '  删除',
                style: TextStyle(fontSize: 12, color: Color(0xff9C9C9C)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
