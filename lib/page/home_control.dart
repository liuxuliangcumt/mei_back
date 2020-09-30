import 'package:flutter/material.dart';
import 'package:mei_back/page/recover/apply_recycler.dart';

import 'ConsoleDeskOnline.dart';

class HomeControl extends StatefulWidget {
  @override
  _HomeControlState createState() => _HomeControlState();
}

class _HomeControlState extends State<HomeControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('控制台'),
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
            child: Icon(const IconData(0xe604, fontFamily: "ali"), size: 20),
            onTap: () {},
          )
        ],
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
                      ConsoleDesk(),
                      Container(
                        height: 127,
                        padding: EdgeInsets.only(left: 14),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 5)
                            ]),
                        child: Stack(
                          children: [
                            Positioned(
                              child: Text(
                                '还没加入？',
                                style: TextStyle(fontSize: 18),
                              ),
                              top: 35,
                            ),
                            Positioned(
                              child: Text(
                                '即刻入驻，开启智慧商业新时代',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff787878)),
                              ),
                              bottom: 35,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => ApplyRecycler()));
                        },
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          '网约工入驻',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        leading: Icon(Icons.message, size: 20),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Color(0xffD0D0D0),
                        ),
                      )
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

  Widget ConsoleDesk() {
    return Container(
      height: 160,
      margin: EdgeInsets.only(top: 22, bottom: 22),
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
            SizedBox(width: 25),
            Icon(
              Icons.camera,
              size: 48,
            )
          ],
        ),
      ),
    );
  }
}
