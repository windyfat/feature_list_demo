import 'package:feature_list_demo/work/controller/module_list_controller.dart';
import 'package:feature_list_demo/work/models/function_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'item_widget.dart';

/// 其他section下的功能列表，不支持拖拽排序
class SectionWidget extends StatelessWidget {
  final int sectionIndex;

  const SectionWidget({Key key, this.sectionIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _createTitle(),
          _createItems(),
        ],
      ),
    );
  }

  /// 标题
  Widget _createTitle() {
    ModuleListController controller = Get.find();
    FunctionList section = controller.list[sectionIndex];
    if (section.title.length == 0) {
      return Container(
        height: 20.w,
        width: double.infinity,
        color: Color(0xFFF6F6F6),
      );
    }
    return Container(
      height: 120.w,
      color: Color(0xFFF6F6F6),
      child: Row(
        children: <Widget>[
          Container(
            width: 50.w,
          ),
          Container(
            width: 10.w,
            height: 33.w,
            child: Image(
              image: AssetImage('assets/headerPrefix.png',
                  package: 'flutter_base_framework'),
            ),
          ),
          Container(
            width: 20.w,
          ),
          Container(
            child: Text(
              section.title,
              style: TextStyle(
                color: Color(0xff232323),
                fontSize: 36.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 功能列表GridView
  Widget _createItems() {
    ModuleListController model = Get.find<ModuleListController>();
    FunctionList section = model.list[sectionIndex];
    return Container(
      color: Colors.white,
      child: GridView.builder(
        // padding: EdgeInsets.only(
        //   bottom: 30.w,
        // ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // maxCrossAxisExtent: 300.w,
          crossAxisCount: 5,
          childAspectRatio: 215 / 273,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemBuilder: _itemBuilder,
        itemCount: section.children.length,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    ModuleListController model = Get.find();
    FunctionList section = model.list[sectionIndex];
    return ItemWidget(
      index: index,
      items: section.children,
      isCanDrag: false,
    );
  }
}
