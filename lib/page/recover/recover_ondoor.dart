import 'package:flutter/material.dart';
import 'package:mei_back/constant/Constants.dart';

//上门回收
class RecoverOndoor extends StatefulWidget {
  @override
  _RecoverOndoorState createState() => _RecoverOndoorState();
}

class _RecoverOndoorState extends State<RecoverOndoor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('添加回收物品'),
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
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 22, right: 22),
                      title: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 20,
                            color: Constants.mainColor,
                          ),
                          SizedBox(width: 10),
                          Text('新竹城2期南组团7#1208')
                        ],
                      ),
                      subtitle: Text('中年少女(女士)15150124062'),
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 15, color: Color(0xffD0D0D0)),
                    ),
                    Container(height: 10, color: Color(0xffF7F7F7)),
                    
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
