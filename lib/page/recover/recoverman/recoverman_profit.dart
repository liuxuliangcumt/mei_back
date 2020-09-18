import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mei_back/constant/Constants.dart';
import 'package:mei_back/customview/easyaround.dart';

//回收员 我的收益
class RecoverManProfit extends StatefulWidget {
  @override
  _RecoverManProfitState createState() => _RecoverManProfitState();
}

class _RecoverManProfitState extends State<RecoverManProfit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的收益'),
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
            child: Icon(Icons.list, size: 20),
            onTap: () {},
          ),
          SizedBox(width: 25),
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
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Stack(
                      children: [
                        Image.asset(
                          "assets/images/r_profit_bg.png",
                          fit: BoxFit.fitWidth,
                          height: 130,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Positioned(
                          child: Text(
                            '可用环保积分',
                            style: TextStyle(
                                fontSize: 14, color: Constants.mainColor),
                          ),
                          left: 45,
                          top: 20,
                        ),
                        Positioned(
                          child: Text(
                            '500.25',
                            style: TextStyle(
                                fontSize: 33, color: Constants.mainColor),
                          ),
                          top: 50,
                          left: 45,
                        )
                      ],
                    ),
                    threeChoise(),
                    timeAndTotal(),
                    ListView.builder(
                      itemBuilder: listViewItem,
                      itemCount: 10,
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

  Widget threeChoise() {
    return Container(
      padding: EdgeInsets.only(top: 40, bottom: 25, left: 22, right: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: EasyAround(
              padding: EdgeInsets.only(top: 10),
              top: Image.asset("assets/images/pay_recharge.png", width: 21),
              child: Text('充值',
                  style: TextStyle(fontSize: 12, color: Color(0xff787878))),
            ),
          ),
          InkWell(
            child: EasyAround(
              padding: EdgeInsets.only(top: 10),
              top: Image.asset("assets/images/pay_trans.png", width: 21),
              child: Text(
                '转账',
                style: TextStyle(fontSize: 12, color: Color(0xff787878)),
              ),
            ),
            onTap: () {},
          ),
          InkWell(
            child: EasyAround(
              padding: EdgeInsets.only(top: 10),
              top: Image.asset("assets/images/pay_cashout.png", width: 21),
              child: Text(
                '提现',
                style: TextStyle(fontSize: 12, color: Color(0xff787878)),
              ),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }

  Widget timeAndTotal() {
    return Container(
      color: Color(0xffF7F7F7),
      height: 51,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 22, right: 22),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 26,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(13)),
            child: Text('本月'),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                '￥52.5\n收入￥752.5',
                style: TextStyle(fontSize: 12, color: Color(0xff777777)),
              ),
            ),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: Color(0xffD0D0D0),
          )
        ],
      ),
    );
  }

  Widget listViewItem(BuildContext context, int index) {
    return Container(
      height: 80,
      alignment: Alignment.centerLeft,
      child: ListTile(
        title: Text(
          '上门回收',
        ),
        subtitle: Text('05-04  20:00'),
        //  assets/images/r_pay.png
        leading:
            Image.asset("assets/images/r_on_door.png", width: 42, height: 42),
        trailing: Text(
          '+15',
          style: TextStyle(fontSize: 20, color: Constants.mainColor),
        ),
      ),
    );
  }
}
