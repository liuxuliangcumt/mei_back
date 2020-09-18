import 'package:flutter/material.dart';
import 'package:mei_back/constant/Constants.dart';

//收积分
class RecoverManCollect extends StatefulWidget {
  @override
  _RecoverManCollectState createState() => _RecoverManCollectState();
}

class _RecoverManCollectState extends State<RecoverManCollect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('收环保金'),
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

  Widget listViewItem(BuildContext context, int index) {
    return Container(
      height: 80,
      alignment: Alignment.centerLeft,
      child: ListTile(
        title: Text(
          '纸类10斤',
        ),
        subtitle: Text('2020-05-04  20:00    上门回收'),
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
