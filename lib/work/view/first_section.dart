import 'package:feature_list_demo/work/controller/module_list_controller.dart';
import 'package:feature_list_demo/work/drag_base_widget/devdrag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'item_widget.dart';

/// 第一个section的功能列表，编辑状态下支持拖拽排序
class FirstSectionWidget extends StatelessWidget {
  int variableSet = 0;
  ScrollController _scrollController;

  /// 设置宽高是为了在拖拽过程中，item不变形
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _createTitle(),
            _createItems(),
          ],
        ),
      ),
    );
  }

  /// 标题
  Widget _createTitle() {
    ModuleListController controller = Get.find();
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
              image: AssetImage(
                'assets/headerPrefix.png',
                package: 'flutter_base_framework',
              ),
            ),
          ),
          Container(
            width: 20.w,
          ),
          Expanded(
            child: Container(
              child: Text(
                '常用功能',
                style: TextStyle(
                  color: Color(0xff232323),
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Container(
            // margin: EdgeInsets.all(10.w),
            child: FlatButton(
              onPressed: () {
                controller.editStatus = !controller.editStatus;
              },
              child: Text(
                controller.editStatus ? '完成' : '编辑',
                style: TextStyle(
                  color: Theme.of(Get.context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 支持拖拽的GridView
  Widget _createItems() {
    ModuleListController model = Get.find<ModuleListController>();
    int rowNum = model.selectList.length % 5 == 0
        ? (model.selectList.length / 5).toInt()
        : (model.selectList.length / 5).toInt() + 1;
    if (rowNum == 0) {
      rowNum = 1;
    }
    return Container(
      height: rowNum * ScreenUtil.screenWidth / 5 * 273 / 215,
      child: DragAndDropGridView(
        canDragable: model.editStatus,
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 215 / 273,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
        ),
        // padding: EdgeInsets.only(
        //   bottom: 30.w,
        // ),
        itemBuilder: (context, index) {
          return LayoutBuilder(
            builder: (context, costrains) {
              if (variableSet == 0) {
                height = costrains.maxHeight;
                width = costrains.maxWidth;
                variableSet++;
              }
              return Material(
                color: Colors.white,
                child: Container(
                  width: width,
                  height: height,
                  child: ItemWidget(
                    index: index,
                    items: model.selectList,
                    isCanDrag: true,
                  ),
                ),
              );
            },
          );
        },
        itemCount: model.selectList.length,
        onWillAccept: (oldIndex, newIndex) {
          return true; // If you want to accept the child return true or else return false
        },
        onReorder: (oldIndex, newIndex) {
          final temp = model.selectList[oldIndex];

          model.selectList.removeAt(oldIndex);
          model.selectList.insert(newIndex, temp);
        },
      ),
    );
  }
}
