import 'package:flutter/material.dart';

//附近回收柜
class RecoverBar extends StatefulWidget {
  @override
  _RecoverBarState createState() => _RecoverBarState();
}

class _RecoverBarState extends State<RecoverBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('附近回收柜'),
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
