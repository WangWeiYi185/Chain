import 'dart:js';

import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChainRegister {
  static ChainRegister register =  ChainRegister();
  static OverlayEntry entry = OverlayEntry(builder:(BuildContext context) {
       return Wrap(
         
       );

  });


  
  
}


class AppFloatBox extends StatefulWidget {
  @override
  _AppFloatBoxState createState() => _AppFloatBoxState();
}

class _AppFloatBoxState extends State<AppFloatBox> {
  Offset offset = Offset(10, kToolbarHeight + 100);

  Offset _calOffset(Size size, Offset offset, Offset nextOffset) {
    double dx = 0;
    //水平方向偏移量不能小于0不能大于屏幕最大宽度
    if (offset.dx + nextOffset.dx <= 0) { 
      dx = 0;
    } else if (offset.dx + nextOffset.dx >= (size.width - 50)) {
      dx = size.width - 50;
    } else {
      dx = offset.dx + nextOffset.dx;
    }
    double dy = 0;
     //垂直方向偏移量不能小于0不能大于屏幕最大高度
    if (offset.dy + nextOffset.dy >= (size.height - 100)) {
      dy = size.height - 100;
    } else if (offset.dy + nextOffset.dy <= kToolbarHeight) {
      dy = kToolbarHeight;
    } else {
      dy = offset.dy + nextOffset.dy;
    }
    return Offset(
      dx,
      dy,
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Positioned(
        left: offset.dx,
        top: offset.dy,
        child: GestureDetector(
          onPanUpdate: (detail) {
            setState(() {
              offset =
                  _calOffset(MediaQuery.of(context).size, offset, detail.delta); //替换getx
            });
          },
          onTap:() {

            Get(),

          },
          onPanEnd: (detail) {},
          child: Icon(Icons.accessible_forward)
      ),
    );
  }
}