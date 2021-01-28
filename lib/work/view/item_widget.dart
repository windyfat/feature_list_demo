import 'package:feature_list_demo/work/controller/module_list_controller.dart';
import 'package:feature_list_demo/work/models/function_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// item实现类，包括一个图片和功能名字，以及一个编辑状态下的右上角的图片按钮
class ItemWidget extends StatelessWidget {
  final int index; // 当前下标
  final List<FunctionListItem> items; // 数据源列表
  final bool isCanDrag; // 是否可拖拽，用于右上角图片的显示和隐藏
  const ItemWidget({Key key, this.index, this.items, this.isCanDrag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ModuleListController controller = Get.find();
    return Builder(
      builder: (context) {
        FunctionListItem item = items[index];
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onLongPress: () {
            if (controller.enableEditPermission && !controller.editStatus) {
              controller.editStatus = !controller.editStatus;
              print('长按');
            }
          },
          onTap: () {
            if (controller.editStatus) {
              controller.insertSelectList(item);
            } else {
              Get.to(item.functionPage);
              // print('点击了：' + index.toString());
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: _leftBorder(),
                bottom: _bottomBorder(),
                right: _rightBorder(),
                top: _topBorder(),
              ),
              color: Colors.white,
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            // top: 60.w,
                            ),
                        child: Image.asset(
                          item.functionIcon,
                          width: 127.w,
                          height: 127.w,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 30.w,
                        ),
                        child: Text(
                          item.functionName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF595B5A),
                            fontSize: 28.sp,
                          ),
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                controller.editStatus
                    ? (isCanDrag
                        ? _createDeleteIconButton()
                        : _createAddIconButton())
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }

  /// 上边框
  BorderSide _topBorder() {
    return index < 5
        ? BorderSide(
            color: Colors.white,
            width: 0,
          )
        : BorderSide(
            color: Color(0xFFF4F4F4),
            width: 2.w,
          );
  }

  /// 下边框
  BorderSide _bottomBorder() {
    int totalRow =
        items.length % 5 == 0 ? items.length ~/ 5 : items.length ~/ 5 + 1;
    int currentRow = index ~/ 5;
    return (((currentRow + 1) * 5 + index % 5 > items.length - 1) &&
            currentRow != totalRow - 1)
        ? BorderSide(
            color: Color(0xFFF4F4F4),
            width: 2.w,
          )
        : BorderSide(
            color: Colors.white,
            width: 0,
          );
  }

  /// 右边框
  BorderSide _rightBorder() {
    return index == items.length - 1
        ? BorderSide(
            color: Colors.white,
            width: 0.w,
          )
        : BorderSide(
            color: Colors.white,
            width: 0,
          );
  }

  /// 左边框
  BorderSide _leftBorder() {
    return index % 5 == 0
        ? BorderSide(
            color: Colors.white,
            width: 0,
          )
        : BorderSide(
            color: Color(0xFFF4F4F4),
            width: 2.w,
          );
  }

  /// 可拖拽部分的删除按钮
  Widget _createDeleteIconButton() {
    FunctionListItem item = items[index];
    ModuleListController controller = Get.find();

    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          controller.deleteItem(item);
        },
        child: Container(
          padding: EdgeInsets.all(20.w),
          child: Image.asset(
            'assets/关闭.png',
            package: 'flutter_base_framework',
            width: 40.w,
            height: 40.w,
          ),
        ),
      ),
    );
  }

  /// 不可拖拽部分，根据是否包含item显示不同的按钮
  Widget _createAddIconButton() {
    FunctionListItem item = items[index];
    ModuleListController controller = Get.find();

    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          controller.insertSelectList(item);
        },
        child: Container(
          padding: EdgeInsets.all(20.w),
          child: controller.selectList.contains(item)
              ? Image.asset(
                  'assets/关闭.png',
                  package: 'flutter_base_framework',
                  width: 40.w,
                  height: 40.w,
                )
              : Image.asset(
                  'assets/添加.png',
                  package: 'flutter_base_framework',
                  width: 40.w,
                  height: 40.w,
                ),
        ),
      ),
    );
  }
}
