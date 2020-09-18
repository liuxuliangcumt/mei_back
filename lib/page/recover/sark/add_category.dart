import 'package:flutter/material.dart';
import 'package:mei_back/constant/Constants.dart';

//新增分类
class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类设置'),
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
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '保存',
                style: TextStyle(color: Constants.mainColor),
              ),
            ),
          ),
          SizedBox(width: 20)
        ],
      ),
    );
  }
}
