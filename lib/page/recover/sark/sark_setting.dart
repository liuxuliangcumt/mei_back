import 'package:flutter/material.dart';

import 'add_category.dart';

//回收柜设置
class SarkSetting extends StatefulWidget {
  @override
  _SarkSettingState createState() => _SarkSettingState();
}

class _SarkSettingState extends State<SarkSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('回收柜设置'),
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
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: listViewItem,
                    ),
                    SizedBox(height: 50),
                    MaterialButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => AddCategory()));
                        },
                        height: 45,
                        minWidth: 200,
                        shape: StadiumBorder(),
                        textColor: Colors.white,
                        color: Color(0xffC3AB87),
                        child: Text(
                          "新增分类",
                          style: TextStyle(fontSize: 15),
                        ))
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
      height: 70,
      alignment: Alignment.centerLeft,
      child: ListTile(
        title: Text('默认分类一'),
        leading: Icon(Icons.queue, size: 50),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 15,
          color: Color(0xffD0D0D0),
        ),
      ),
    );
  }
}
