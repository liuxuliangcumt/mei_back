import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mei_back/beans/banners.dart';
import 'package:mei_back/constant/Constants.dart';
import 'package:mei_back/netUtil/NetUtil.dart';
import 'package:mei_back/page/recover/recover_address.dart';
import 'package:mei_back/page/recover/recover_bar.dart';
import 'package:mei_back/page/recover/recover_car.dart';
import 'package:mei_back/page/recover/recover_fund.dart';
import 'package:mei_back/page/recover/recover_myorders.dart';
import 'package:mei_back/page/recover/recover_ondoor.dart';
import 'package:mei_back/page/recover/recover_orders.dart';
import 'package:mei_back/page/recover/recover_scan.dart';
import 'package:mei_back/page/recover/recoverman/recoverman_home.dart';

//回收主页
class RecoverHome extends StatefulWidget {
  @override
  _RecoverHomeState createState() => _RecoverHomeState();
}

class _RecoverHomeState extends State<RecoverHome> {
  List swiperDataList = <MyBanner>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBannerData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('回收'),
        elevation: 0,
        actions: <Widget>[
          InkWell(
            child: Image.asset("assets/images/rec_h_loca.png", width: 20),
          ),
          SizedBox(width: 20)
        ],
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
              child: IntrinsicHeight(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 22, right: 22),
                  child: Column(
                    children: [
                      searchCon(),
                      fivePoint(),
                      Container(
                          height: 195,
                          child: firstBanner(swiperDataList),
                          margin: EdgeInsets.only(top: 26, bottom: 25)),
                      towButton(),
                      SizedBox(height: 10),
                      InkWell(
                        child: listItem("assets/images/rec_h_1.png", "附近回收车"),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => RecoverCar()));
                        },
                      ),
                      InkWell(
                        child: listItem("assets/images/rec_h_2.png", "附近回收柜"),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => RecoverBar()));
                        },
                      ),
                      InkWell(
                        child: listItem("assets/images/rec_h_3.png", "回收价格表"),
                        onTap: () {},
                      ),
                      InkWell(
                        child: listItem("assets/images/rec_h_4.png", "我的环保积分"),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => RecoverFund()));
                        },
                      ),
                      InkWell(
                        child: listItem("assets/images/rec_h_5.png", "积分兑换商城"),
                        onTap: () {},
                      ),
                      InkWell(
                        child: listItem("assets/images/rec_h_6.png", "加入美城回收"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => RecoverManHome()));
                        },
                      ),
                      InkWell(
                        child: listItem("assets/images/rec_h_8.png", "回收地址管理"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => RecoverAddress()));
                        },
                      ),
                      InkWell(
                        child: listItem("assets/images/rec_h_7.png", "我的回收订单"),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => RecoverMyOrder()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

//轮播图
  Widget firstBanner(List<MyBanner> swiperDataLists) {
    List swiperDataList = swiperDataLists;

    return Container(
        margin: EdgeInsets.only(left: 22.5, right: 22.5),
        child: ConstrainedBox(
          child: Swiper(
            outer: false,
            itemBuilder: (c, i) {
              if (swiperDataList != null) {
                return CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: "${swiperDataList[i].img}",
                  placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                );
              } else {
                return Container();
              }
            },
            pagination: new SwiperPagination(margin: new EdgeInsets.all(5.0)),
            itemCount: swiperDataList == null ? 0 : swiperDataList.length,
          ),
          constraints: new BoxConstraints.loose(
              new Size(MediaQuery.of(context).size.width, 320.0)),
        ));
  }

  void getBannerData() {
    NetUtil.post("http://www.bjxmqy.com:9501/index/wap_banner", {}, (result) {
      BannerList bannerList = BannerList.fromJson(result.data);
      setState(() {
        swiperDataList = bannerList.banners;
        print(swiperDataList.length);
      });
    }, (error) {
      print("出错了");
      print(error);
    });
  }

  // 关注 动态 广播 问答 视频
  //todo 点击事件
  Widget fivePoint() {
    return Container(
      margin: EdgeInsets.only(top: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: fivePointItem("assets/images/rec_parp.png", "纸类"),
          ),
          InkWell(
            onTap: () {},
            child: fivePointItem("assets/images/rec_metal.png", "金属"),
          ),
          InkWell(
            onTap: () {},
            child: fivePointItem("assets/images/rec_plastic.png", "塑料"),
          ),
          InkWell(
            onTap: () {},
            child: fivePointItem("assets/images/rec_fabrics.png", "织物"),
          ),
          InkWell(
            onTap: () {},
            child: fivePointItem("assets/images/rec_phone.png", "手机"),
          )
        ],
      ),
    );
  }

  Widget fivePointItem(String path, String name) {
    return Column(
      children: [
        SizedBox(child: Image.asset(path), height: 40, width: 40),
        Text(
          name,
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }

  Widget searchCon() {
    return Container(
      height: 36,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: Color(0xffF7F7F7)),
      child: Row(
        children: [
          Icon(Icons.search, color: Color(0xffBCBCBC)),
          Text(
            '搜索回收价格',
            style: TextStyle(fontSize: 14, color: Color(0xffBCBCBC)),
          )
        ],
      ),
    );
  }

  Widget towButton() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              child: Container(
                alignment: Alignment.center,
                height: 153,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2)
                ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/rec_ondoor.png",
                      width: 46,
                      height: 46,
                    ),
                    SizedBox(height: 10),
                    Text('上门回收', style: TextStyle(fontSize: 15)),
                    SizedBox(height: 10),
                    Text('一键呼叫, 在线下单',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff787878)))
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => RecoverOndoor()));
              },
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: InkWell(
              child: Container(
                alignment: Alignment.center,
                height: 153,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2)
                ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/rec_scan.png",
                      width: 46,
                      height: 46,
                    ),
                    SizedBox(height: 10),
                    Text('扫码投递', style: TextStyle(fontSize: 15)),
                    SizedBox(height: 10),
                    Text('垃圾分类，智能回收',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff787878)))
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (c) => RecoverScan()));
              },
            ),
          ),
        ],
      ),
    );
  }

  listItem(String img, String t) {
    return Container(
      height: 58,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Padding(
            child: Image.asset(img, width: 30, height: 30),
            padding: EdgeInsets.only(top: 5),
          ),
          SizedBox(width: 10),
          Expanded(
              child: Text(
            t,
            style: TextStyle(fontSize: 15),
          )),
          Icon(Icons.arrow_forward_ios, color: Color(0xffD0D0D0), size: 15)
        ],
      ),
    );
  }
}
