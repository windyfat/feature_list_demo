import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 自定义bottomNavigationBar
class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key key,
    @required int selectedIndex,
    @required PageController pageController,
    @required List<NavigationBarItemInfo> items,
  })  : _selectedIndex = selectedIndex,
        _pageController = pageController,
        _items = items,
        super(key: key);

  final int _selectedIndex; // 选中的下标
  final PageController _pageController; // 控制器
  final List<NavigationBarItemInfo> _items; // 底部按钮数据

  List<BottomNavigationBarItem> _configItems() {
    List<BottomNavigationBarItem> barItems = [];

    for (var itemInfo in _items) {
      barItems.add(BottomNavigationBarItem(
        icon: Image(
          image: AssetImage(
            itemInfo.normalImgPath,
          ),
          width: 50.w,
          height: 50.w,
        ),
        activeIcon: Image(
          image: AssetImage(
            itemInfo.selectImgPath,
          ),
          width: 50.w,
          height: 50.w,
        ),
        label: itemInfo.title,
      ));
    }

    return barItems;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedFontSize: 12.0,
      items: _configItems(),
      currentIndex: _selectedIndex,
      onTap: (index) {
        _pageController.jumpToPage(index);
      },
    );
  }
}

class NavigationBarItemInfo {
  String title;
  String normalImgPath;
  String selectImgPath;

  NavigationBarItemInfo({
    this.title,
    this.normalImgPath,
    this.selectImgPath,
  });
}
