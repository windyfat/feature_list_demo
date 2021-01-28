import 'package:feature_list_demo/modules/temp_page.dart';
import 'package:flutter/material.dart';

import 'models/function_list_item.dart';
import 'view/module_list.dart';

class WorkPage extends StatefulWidget {
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  List<FunctionList> _items = [];

  @override
  void initState() {
    super.initState();

    _configItems();
  }

  /// 测试数据
  _configItems() {
    List<FunctionListItem> items = [];
    items.add(
      FunctionListItem(
        functionName: '工艺监控',
        functionIcon: 'assets/work/工艺监控.png',
        functionPage: TempPage(),
      ),
    );
    items.add(
      FunctionListItem(
        functionName: '实时数据',
        functionIcon: 'assets/work/实时数据.png',
        functionPage: TempPage(),
      ),
    );
    _items.add(
      FunctionList(title: '实时数据', children: items),
    );

    items = [];
    items.add(
      FunctionListItem(
        functionName: '水质分析',
        functionIcon: 'assets/work/水质分析.png',
        functionPage: TempPage(),
      ),
    );
    items.add(
      FunctionListItem(
        functionName: '水质报表',
        functionIcon: 'assets/work/水质报表.png',
        functionPage: TempPage(),
      ),
    );
    items.add(
      FunctionListItem(
        functionName: '水质趋势',
        functionIcon: 'assets/work/水质趋势.png',
        functionPage: TempPage(),
      ),
    );
    _items.add(
      FunctionList(title: '水质管理', children: items),
    );

    items = [];
    items.add(
      FunctionListItem(
        functionName: '水量分析',
        functionIcon: 'assets/work/水量分析.png',
        functionPage: TempPage(),
      ),
    );
    items.add(
      FunctionListItem(
        functionName: '水量报表',
        functionIcon: 'assets/work/水量报表.png',
        functionPage: TempPage(),
      ),
    );
    items.add(
      FunctionListItem(
        functionName: '水量趋势',
        functionIcon: 'assets/work/水量趋势.png',
        functionPage: TempPage(),
      ),
    );
    items.add(
      FunctionListItem(
        functionName: '中水报表',
        functionIcon: 'assets/work/中水报表.png',
        functionPage: TempPage(),
      ),
    );
    _items.add(
      FunctionList(title: '水量管理', children: items),
    );

    items = [];
    items.add(
      FunctionListItem(
        functionName: '工艺分析',
        functionIcon: 'assets/work/工艺分析.png',
        functionPage: TempPage(),
      ),
    );
    items.add(
      FunctionListItem(
        functionName: '工艺过程报表',
        functionIcon: 'assets/work/工艺过程报表.png',
        functionPage: TempPage(),
      ),
    );
    items.add(
      FunctionListItem(
        functionName: '工艺过程趋势',
        functionIcon: 'assets/work/工艺过程趋势.png',
        functionPage: TempPage(),
      ),
    );
    _items.add(
      FunctionList(title: '工艺过程管理', children: items),
    );

    items = [];
    items.add(
      FunctionListItem(
        functionName: '化验填报',
        functionIcon: 'assets/work/化验填报.png',
        functionPage: TempPage(),
      ),
    );
    _items.add(
      FunctionList(title: '化验室管理', children: items),
    );

    items = [];
    items.add(
      FunctionListItem(
        functionName: '设备分析',
        functionIcon: 'assets/work/设备分析.png',
        functionPage: TempPage(),
      ),
    );
    items.add(
      FunctionListItem(
        functionName: '设备报表',
        functionIcon: 'assets/work/设备报表.png',
        functionPage: TempPage(),
      ),
    );
    items.add(
      FunctionListItem(
        functionName: '设备趋势',
        functionIcon: 'assets/work/设备趋势.png',
        functionPage: TempPage(),
      ),
    );
    _items.add(
      FunctionList(title: '设备管理', children: items),
    );

    items = [];
    items.add(
      FunctionListItem(
        functionName: '耗量分析',
        functionIcon: 'assets/work/耗量分析.png',
        functionPage: TempPage(),
      ),
    );
    items.add(
      FunctionListItem(
        functionName: '耗量报表',
        functionIcon: 'assets/work/耗量报表.png',
        functionPage: TempPage(),
      ),
    );
    items.add(
      FunctionListItem(
        functionName: '耗量趋势',
        functionIcon: 'assets/work/耗量趋势.png',
        functionPage: TempPage(),
      ),
    );
    _items.add(
      FunctionList(title: '耗量管理', children: items),
    );

    items = [];
    items.add(
      FunctionListItem(
        functionName: '污泥分析',
        functionIcon: 'assets/work/污泥分析.png',
        functionPage: TempPage(),
      ),
    );
    items.add(
      FunctionListItem(
        functionName: '污泥转移',
        functionIcon: 'assets/work/污泥转移.png',
        functionPage: TempPage(),
      ),
    );
    items.add(
      FunctionListItem(
        functionName: '污泥无害化处理',
        functionIcon: 'assets/work/污泥无害化处理.png',
        functionPage: TempPage(),
      ),
    );
    _items.add(
      FunctionList(title: '污泥管理', children: items),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FeatureListPage(
      items: _items,
      enableEditPermission: true,
    );
  }
}
