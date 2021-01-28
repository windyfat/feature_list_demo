import 'package:feature_list_demo/account_setting/user_page.dart';
import 'package:feature_list_demo/home/home_page.dart';
import 'package:feature_list_demo/work/work_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_bottom_bar.dart';

/// APP 主页模块，点击bottomNavigationBar切换页面
class NavigationHomePage extends StatefulWidget {
  @override
  _NavigationHomePageState createState() => _NavigationHomePageState();
}

class _NavigationHomePageState extends State<NavigationHomePage> {
  PageController _pageController = PageController();

  int _selectedIndex = 0;

  List<NavigationBarItemInfo> _itemsInfo = [];

  @override
  void initState() {
    super.initState();

    _itemsInfo.add(
      NavigationBarItemInfo(
          title: '首页',
          normalImgPath: 'assets/navigationbar/首页-未选中.png',
          selectImgPath: 'assets/navigationbar/首页-选中.png'),
    );
    _itemsInfo.add(
      NavigationBarItemInfo(
          title: '工作',
          normalImgPath: 'assets/navigationbar/工作-未选中.png',
          selectImgPath: 'assets/navigationbar/工作-选中.png'),
    );
    _itemsInfo.add(
      NavigationBarItemInfo(
          title: '我的',
          normalImgPath: 'assets/navigationbar/我的-未选中.png',
          selectImgPath: 'assets/navigationbar/我的-选中.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          _selectedIndex = index;
          setState(() {});
        },
        children: [
          HomePage(),
          WorkPage(),
          UserPage(),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: _selectedIndex,
        pageController: _pageController,
        items: _itemsInfo,
      ),
    );
  }
}
