import 'package:flutter/material.dart';

//附近回收车
class RecoverCar extends StatefulWidget {
  @override
  _RecoverCarState createState() => _RecoverCarState();
}

class _RecoverCarState extends State<RecoverCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('车辆实时位置'),
        elevation: 0,
        actions: <Widget>[
          InkWell(
            child: Icon(
              Icons.phone,
              color: Colors.grey,
            ),
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
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
