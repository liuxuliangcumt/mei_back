import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class stores {
  // body
  Widget baseView() {
    LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Container(
                child: Column(
                  children: [],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget bottomDailog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                color: Colors.black54,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )),
              ),
            ],
          );
        });
  }
}
