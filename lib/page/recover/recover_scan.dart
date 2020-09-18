import 'package:flutter/material.dart';

//扫码
class RecoverScan extends StatefulWidget {
  @override
  _RecoverScanState createState() => _RecoverScanState();
}

class _RecoverScanState extends State<RecoverScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        /* actions: <Widget>[
          InkWell(
            child: Image.asset("assets/images/rec_h_loca.png", width: 20),
          ),
          SizedBox(width: 20)
        ],*/
        centerTitle: true,
        title: Text(''),
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return DefaultTabController(
              length: 2,
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 100,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Color(0xffF7F7F7),
                            child: TabBarView(children: [
                              Container(
                                child: Column(
                                  children: [
                                    Icon(Icons.games),
                                    Text('将二维码放置到扫码口即可扫描')
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    top: 56, bottom: 56, left: 42, right: 42),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.queue_music,
                                      size: 200,
                                    ),
                                    SizedBox(height: 66),
                                    Text(
                                      '将二维码放置到扫码口即可扫描',
                                      style: TextStyle(fontSize: 13),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Container(
                          height: 65,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 100),
                            width: MediaQuery.of(context).size.width - 150,
                            child: TabBar(
                              indicatorColor: Colors.black,
                              onTap: (index) {},
                              tabs: [Text('扫码投递'), Text('二维码投递')],
                              labelColor: Colors.white,
                              unselectedLabelColor: Color(0xff9C9C9C),
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 15),
                              unselectedLabelStyle: TextStyle(
                                  color: Color(0xff9C9C9C), fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
