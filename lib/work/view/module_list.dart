import 'package:feature_list_demo/work/controller/module_list_controller.dart';
import 'package:feature_list_demo/work/models/function_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'first_section.dart';
import 'section_widget.dart';

/// 功能清单页面，基于GetX实现。
class FeatureListPage extends StatelessWidget {
  final String appBarTitle;
  final List<FunctionList> items; // 功能列表
  final bool enableEditPermission; // 是否开启编辑权限

  const FeatureListPage({
    Key key,
    this.items,
    this.enableEditPermission = false,
    this.appBarTitle = '工作',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ModuleListController controller = ModuleListController();
    controller.list = items;
    controller.enableEditPermission = enableEditPermission;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle,
        ),
      ),
      body: GetBuilder<ModuleListController>(
        init: controller,
        builder: (_) {
          return SafeArea(
            child: Container(
              color: Color(0xFFF6F6F6),
              child: _createListWidget(),
            ),
          );
        },
      ),
    );
  }

  /// 可拖拽section
  Widget _createHomeFunctions() {
    return enableEditPermission ? FirstSectionWidget() : Container();
  }

  /// 不可拖拽sections
  Widget _createListWidget() {
    return Builder(
      builder: (context) {
        ModuleListController model = Get.find();
        return Container(
          color: Colors.white,
          child: ListView.builder(
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: _itemBuilder,
            itemCount: enableEditPermission
                ? model.list.length + 1
                : model.list.length,
          ),
        );
      },
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (enableEditPermission) {
      if (index == 0) {
        return FirstSectionWidget();
      } else {
        return SectionWidget(
          sectionIndex: index - 1,
        );
      }
    } else {
      return SectionWidget(
        sectionIndex: index,
      );
    }
  }
}
