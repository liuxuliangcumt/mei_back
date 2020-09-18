import 'package:flutter/material.dart';

//  在child控件的 上下左右添加控件  padding 为child的margin
class EasyAround extends StatelessWidget {
  Widget top;
  Widget left;
  Widget right;
  Widget bottom;
  Widget child;
  double height;
  double width;
  EdgeInsetsGeometry padding;
  MainAxisAlignment rowMainAxisAlignment;
  CrossAxisAlignment rowCrossAxisAlignment;
  CrossAxisAlignment columnCrossAxisAlignment;
  MainAxisAlignment columnMainAxisAlignment;
  BoxDecoration boxDecoration;
  EdgeInsetsGeometry outPadding;

  EasyAround(
      {this.top,
      this.padding,
      this.left,
      this.right,
      this.bottom,
      this.boxDecoration,
      this.outPadding,
      this.width,
      this.height,
      this.rowCrossAxisAlignment = CrossAxisAlignment.center,
      this.rowMainAxisAlignment = MainAxisAlignment.center,
      this.columnCrossAxisAlignment = CrossAxisAlignment.center,
      this.columnMainAxisAlignment = MainAxisAlignment.center,
      @required this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      width: width ?? width,
      height: height ?? height,
      decoration: boxDecoration ?? boxDecoration,
      padding: outPadding ?? outPadding,
      child: Column(
        mainAxisAlignment: columnMainAxisAlignment,
        crossAxisAlignment: columnCrossAxisAlignment,
        children: [
          top == null ? Container(height: 0) : top,
          Row(
            mainAxisAlignment: rowMainAxisAlignment,
            crossAxisAlignment: rowCrossAxisAlignment,
            children: [
              left == null ? Container(width: 0) : left,
              getChild(),
              right == null ? Container(width: 0) : right
            ],
          ),
          bottom == null ? Container(height: 0) : bottom,
        ],
      ),
    );
  }

  Widget getChild() {
    return Container(
      child: child,
      padding: padding,
    );
  }
}
