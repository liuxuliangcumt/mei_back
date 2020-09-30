import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mei_back/netUtil/NetUtil.dart';
import 'package:mei_back/netUtil/neturls.dart';

//申请成为回收员
class ApplyRecycler extends StatefulWidget {
  @override
  _ApplyRecyclerState createState() => _ApplyRecyclerState();
}

class _ApplyRecyclerState extends State<ApplyRecycler> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController cardController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController areaController = new TextEditingController();

  TextEditingController eagerNameController = new TextEditingController();
  TextEditingController eagerPhoneController = new TextEditingController();
  String category = "请选择职业类别";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('申请成为回收员'),
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
                      height: 60,
                      child: Row(
                        children: [
                          Text(
                            '姓      名',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff787878)),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                hintText: "请输入姓名",
                                border: InputBorder.none,
                                labelStyle: TextStyle(fontSize: 16)),
                          ))
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        children: [
                          Text(
                            '手      机',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff787878)),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: TextField(
                            controller: phoneController,
                            decoration: InputDecoration(
                                hintText: "请输入手机号码",
                                border: InputBorder.none,
                                labelStyle: TextStyle(fontSize: 16)),
                          ))
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        children: [
                          Text(
                            '身 份 证',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff787878)),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: TextField(
                            controller: cardController,
                            decoration: InputDecoration(
                                hintText: "请输入身份证号码",
                                border: InputBorder.none,
                                labelStyle: TextStyle(fontSize: 16)),
                          ))
                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      child: Row(
                        children: [
                          Expanded(
                              child: Icon(
                            Icons.print,
                            size: 60,
                          )),
                          SizedBox(width: 30),
                          Expanded(
                              child: Icon(
                            Icons.print,
                            size: 60,
                          ))
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        children: [
                          Text(
                            '职业类别',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff787878)),
                          ),
                          SizedBox(width: 20),
                          /*  Expanded(
                              child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                hintText: "请选择回收类别",
                                border: InputBorder.none,
                                labelStyle: TextStyle(fontSize: 16)),
                          )),*/
                          Expanded(
                            child: DropdownButton(
                              items: [
                                DropdownMenuItem(
                                    child: Text('外卖配送员'), value: "外卖配送员"),
                                DropdownMenuItem(
                                    child: Text('同城快递员'), value: "同城快递员"),
                                DropdownMenuItem(
                                    child: Text('网约车司机'), value: "网约车司机"),
                                DropdownMenuItem(
                                    child: Text('环保回收员'), value: "环保回收员"),
                                DropdownMenuItem(
                                    child: Text('网约技能工'), value: "网约技能工")
                              ],
                              onChanged: (c) {
                                setState(() {
                                  category = c;
                                });
                              },
                              icon: Icon(
                                Icons.access_alarms,
                                color: Colors.white,
                              ),
                              hint: Text('$category'),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xffD0D0D0),
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      child: Container(
                        height: 60,
                        child: Row(
                          children: [
                            Text(
                              '申请区域',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff787878)),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                                child: TextField(
                              enabled: false,
                              controller: areaController,
                              decoration: InputDecoration(
                                  hintText: "请选择区域地址",
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(fontSize: 16)),
                            )),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xffD0D0D0),
                              size: 15,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showAddressPick();
                      },
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        children: [
                          Text(
                            '详细住址',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff787878)),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: TextField(
                            controller: addressController,
                            decoration: InputDecoration(
                                hintText: "请输入详细住址",
                                border: InputBorder.none,
                                labelStyle: TextStyle(fontSize: 16)),
                          )),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xffD0D0D0),
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        children: [
                          Text(
                            '紧急联系人',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff787878)),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: TextField(
                            controller: eagerNameController,
                            decoration: InputDecoration(
                                hintText: "如：张晓华",
                                border: InputBorder.none,
                                labelStyle: TextStyle(fontSize: 16)),
                          )),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xffD0D0D0),
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        children: [
                          Text(
                            '紧急联系电话',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff787878)),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: TextField(
                            controller: eagerPhoneController,
                            decoration: InputDecoration(
                                hintText: "",
                                border: InputBorder.none,
                                labelStyle: TextStyle(fontSize: 16)),
                          )),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xffD0D0D0),
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                        onPressed: () {
                          submit();
                        },
                        height: 44,
                        minWidth: 195,
                        shape: StadiumBorder(),
                        textColor: Colors.white,
                        color: Color(0xffC3AB87),
                        child: Text(
                          "提交",
                          style: TextStyle(fontSize: 15),
                        )),
                    SizedBox(
                      height: 50,
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

  String address;
  String cityId, areaId, provinceId;

  //显示城市选择
  void showAddressPick() async {
    Result result = await CityPickers.showCityPicker(
      context: context,
    );
    print(result.toString());
    setState(() {
      cityId = result.cityId;
      areaId = result.areaId;
      provinceId = result.provinceId;
      address = result.cityName + "·" + result.areaName;
      areaController.text = address;
    });
    // type 2
    /*  Result result2 = await CityPickers.showFullPageCityPicker(
      context: context,
    );*/
  }

  void submit() {
    String id_card = cardController.text;
    String mobile = phoneController.text;
    String adress = addressController.text;
    String link_name = eagerNameController.text;
    String link_mobile = eagerPhoneController.text;
    String real_name = nameController.text;

    NetUtil.post(
        "http://www.bjxmqy.com:9501/recovery/addRecovery",
        {
          "uid": "1733",
          "province_id": provinceId,
          "city_id": cityId,
          "area_id": areaId,
          "id_card": id_card,
          "mobile": mobile,
          "card_back": "ffds",
          "card_front": "sdf",
          "address": adress,
          "link_name": link_name,
          "link_mobile": link_mobile,
          "real_name": real_name,
        },
        (re) {},
        (err) {});
  }
}
