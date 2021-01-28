import 'package:flutter/material.dart';

class FunctionList {
  String title;
  List<FunctionListItem> children;

  FunctionList({this.title, this.children});
}

/// 功能清单列表
class FunctionListItem {
  String functionName; // 功能名称
  String functionIcon; // 功能本地图片路径
  Widget functionPage; // 功能的页面实现

  FunctionListItem({
    this.functionName,
    this.functionIcon,
    this.functionPage,
  });

  FunctionListItem.fromJson(Map<String, dynamic> json) {
    functionName = json['functionName'];
    functionIcon = json['functionIcon'];
    functionPage = json['functionPage'];
  }

  Map<String, dynamic> toMap() => {
        'functionName': functionName,
        'functionIcon': functionIcon,
      };
}
