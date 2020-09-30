import 'package:cached_network_image/cached_network_image.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mei_back/beans/banners.dart';
import 'package:mei_back/beans/homenews.dart';
import 'package:mei_back/netUtil/NetUtil.dart';

import 'ConsoleDeskOnline.dart';
import 'home_control.dart';

class HomeMagazine extends StatefulWidget {
  @override
  HomeMagazineState createState() => HomeMagazineState();
}

class HomeMagazineState extends State<HomeMagazine>
    with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;
  String address = "苏州·高新区";
  List swiperDataList = <MyBanner>[];
  List newBeans = <NewBean>[];

  @override
  void initState() {
    // TODO: implement initState
    getNewsList();
    getBannerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 44),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 142.5,
                  height: 40,
                  child: Image.asset("assets/images/home_magazine_top.png"),
                )
              ],
            ),
            SizedBox(height: 32.5),
            addressAndSearch(), //位置 搜索 扫码
            fivePoint(),
            Container(
                child: firstBanner(swiperDataList),
                margin: EdgeInsets.only(top: 26, bottom: 25)),

            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 22),
              child: Text(
                '管理控制台',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
              ),
            ),
            ConsoleDesk()
            //  homeNewsView(), //美食 等news
          ],
        ),
      ),
    );
  }

//位置 搜索  扫码
  Widget addressAndSearch() {
    return Container(
      height: 36,
      padding: EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
          color: Color(0xffF7F7F7), borderRadius: BorderRadius.circular(18)),
      margin: EdgeInsets.only(left: 22, right: 22),
      child: Row(
        children: [
          InkWell(
              child: Text(address, style: TextStyle(fontSize: 14)),
              onTap: () {
                showAddressPick();
              }),
          Icon(Icons.arrow_drop_down),
          SizedBox(width: 15),
          Container(color: Color(0xffEAEAEA), width: 1, height: 16),
          SizedBox(width: 15),
          SizedBox(child: Image.asset("assets/images/search.png"), width: 16.5),
          SizedBox(width: 7.5),
          Expanded(
            child: InkWell(
                child: Text("搜索您的美好生活",
                    style: TextStyle(color: Color(0xffBCBCBC), fontSize: 14)),
                onTap: () {}),
          ),
          SizedBox(child: Image.asset("assets/images/scan.png"), width: 16.5),
        ],
      ),
    );
  }

  // 关注 动态 广播 问答 视频
  //todo 点击事件
  Widget fivePoint() {
    return Container(
      margin: EdgeInsets.only(top: 28, right: 22.5, left: 22.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: fivePointItem("assets/images/home_scan.png", "扫一扫"),
          ),
          InkWell(
            onTap: () {},
            child: fivePointItem("assets/images/home_qr.png", "收付款"),
          ),
          InkWell(
            onTap: () {},
            child: fivePointItem("assets/images/me_order.png", "订单"),
          ),
          InkWell(
            onTap: () {},
            child: fivePointItem("assets/images/me_payed.png", "资产"),
          )
        ],
      ),
    );
  }

  Widget fivePointItem(String path, String name) {
    return Column(
      children: [
        SizedBox(child: Image.asset(path), height: 30, width: 20),
        Text(
          name,
          style: TextStyle(fontSize: 12),
        )
      ],
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

// 美食等新闻模块
  Widget homeNewsView() {
    return Container(
      child: new ListView.builder(
        physics: new NeverScrollableScrollPhysics(),
        shrinkWrap: true, //马勒戈壁的非常重要
        itemCount: newBeans.length,
        itemBuilder: homeNewsViewItem,
      ),
    );
  }

// 美食等新闻模块 item
  //todo 每个模块的点击事件
  Widget homeNewsViewItem(BuildContext content, int index) {
    NewBean bean = newBeans[index];

    return Container(
      child: Column(
        children: [
          Container(
            child: InkWell(
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    bean.board_title,
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  )),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xff777777),
                    size: 15,
                  )
                ],
              ),
              onTap: () {},
            ),
            padding:
                EdgeInsets.only(top: 20, right: 22.5, left: 22.5, bottom: 20),
          ),
          bean.ad_app == null
              ? Container()
              : Container(
                  child: firstBanner(bean.ad_app),
                  margin: EdgeInsets.only(bottom: 15)),
          horizontalScrolList(bean.list),
        ],
      ),
    );
  }

  // 横向滑动list
  Widget horizontalScrolList(List<ShopBean> shopBeans) {
    return Container(
      height: 300,
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: shopBeans.length,
        itemBuilder: (BuildContext context, int index) =>
            horizontalScrolListItem(context, shopBeans[index]),
      ),
    );
  }

  Widget horizontalScrolListItem(BuildContext context, ShopBean shopBean) {
    return Container(
      width: 215,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 215,
            height: 215,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: shopBean.cover,
              //  placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(shopBean.board_subject,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          SizedBox(
            height: 5,
          ),
          Text(shopBean.sub_title2,
              style: TextStyle(fontSize: 13, color: Color(0xff777777)),
              maxLines: 1),
        ],
      ),
      margin: EdgeInsets.only(left: 8, right: 8),
    );
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

  void getNewsList() {
    NetUtil.post("http://www.bjxmqy.com:9501/index/newslist", {"city": "成都市"},
        (result) {
      HomeNews homeNewBeans = HomeNews.fromJson(result.data);
      setState(() {
        newBeans = homeNewBeans.newBeans;
      });
    }, (error) {
      print("出错了");
      print(error);
    });
  }

//显示城市选择
  void showAddressPick() async {
    Result result = await CityPickers.showCityPicker(
      context: context,
    );
    print(result.toString());
    setState(() {
      address = result.cityName + "·" + result.areaName;
    });
    // type 2
    /*  Result result2 = await CityPickers.showFullPageCityPicker(
      context: context,
    );*/
  }

  Widget ConsoleDesk() {
    return Container(
      height: 160,
      margin: EdgeInsets.all(22),
      width: MediaQuery.of(context).size.width - 45,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.grey, offset: Offset(1.0, 1.0), blurRadius: 5)
      ]),
      child: Stack(
        children: [
          Positioned(
            child: deskItem("商家", () {}),
          ),
          Positioned(
            child: deskItem("网约工", () {
              /*   Navigator.push(context,
                  MaterialPageRoute(builder: (c) => ConsoleDeskOnline()));*/
            }),
            right: 0,
          ),
          Positioned(
            bottom: 0,
            child: deskItem("服务商", () {}),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: deskItem("城市站", () {}),
          ),
        ],
      ),
    );
  }

  Widget deskItem(String name, Function d) {
    return InkWell(
      onTap: () {
        d.call();
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => HomeControl()));
      },
      child: Container(
        height: 48,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "控制台",
                  style: TextStyle(color: Color(0xff787878), fontSize: 12),
                )
              ],
            ),
            Icon(
              Icons.games,
              size: 48,
            )
          ],
        ),
      ),
    );
  }
}
