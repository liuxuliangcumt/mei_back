import 'package:flutter/material.dart';
import 'package:mei_back/page/recover/recover_home.dart';
import 'package:mei_back/page/recover/recoverman/recoverman_home.dart';

//网约工控制台
class ConsoleDeskOnline extends StatefulWidget {
  @override
  _ConsoleDeskOnlineState createState() => _ConsoleDeskOnlineState();
}

class _ConsoleDeskOnlineState extends State<ConsoleDeskOnline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网约工控制台'),
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
                padding: EdgeInsets.all(22),
                child: Column(
                  children: [
                    fivePoint(),
                    Container(
                      child: Row(
                        children: [partCT("回收", "", () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (c) => RecoverManHome()));
                        })],
                      ),
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
            child: fivePointItem("assets/images/me_payed.png", "付款"),
          ),
          InkWell(
            onTap: () {},
            child: fivePointItem("assets/images/me_order.png", "收款"),
          ),
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

  Widget partCT(String name, String image, Function f) {
    return InkWell(
      child: Container(
        height: 110,
        width: MediaQuery.of(context).size.width / 2 - 23,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              child: Icon(Icons.print),
              left: 50,
              top: 40,
            ),
            Positioned(
                right: 50,
                top: 30,
                child: Column(
                  children: [
                    Text(
                      '回收    ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    Text('控制台'),
                  ],
                ))
          ],
        ),
      ),
      onTap: () {
        f.call();
      },
    );
  }
}
