import 'dart:convert' as convert;

import 'package:feature_list_demo/utils/storage_manager.dart';
import 'package:feature_list_demo/work/models/function_list_item.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ModuleListController extends GetxController {
  bool _enableEditPermission;
  bool get enableEditPermission => _enableEditPermission;
  set enableEditPermission(bool isEnable) {
    _enableEditPermission = isEnable;
  }

  List<FunctionList> _list = [];
  List<FunctionList> get list => _list;
  set list(List<FunctionList> items) {
    _list = items;
  }

  List<FunctionListItem> _selectList = [];
  List<FunctionListItem> get selectList => _selectList;
  set selectList(List<FunctionListItem> list) {
    _selectList = list;
    update();
  }

  insertSelectList(FunctionListItem item) {
    if (_selectList.contains(item)) {
      _selectList.remove(item);
    } else {
      _selectList.add(item);
    }
    update();
  }

  deleteItem(FunctionListItem item) {
    _selectList.remove(item);
    update();
  }

  bool _editStatus = false;
  bool get editStatus => _editStatus;
  set editStatus(bool isEdit) {
    _editStatus = isEdit;
    if (!isEdit) {
      saveSelectListInfo();
    }
    update();
  }

  /// 保存选中的功能列表
  saveSelectListInfo() {
    List items = _selectList.map((e) {
      return e.toMap();
    }).toList();
    String value = convert.jsonEncode(items);
    StorageManager.sharedPreferences.setString('select_items', value);
  }

  /// 获取缓存中的功能列表
  getSaveSelectListInfo() {
    String value = StorageManager.sharedPreferences.getString('select_items');
    if (value == null) {
      selectList = [];
    } else {
      List items = convert.jsonDecode(value);

      _selectList = [];
      for (var i = 0; i < items.length; i++) {
        var json = items[i];
        FunctionListItem item = FunctionListItem.fromJson(json);
        _list.forEach((ele) {
          List<FunctionListItem> result = ele.children.where((element) {
            if (item.functionName == element.functionName) {
              print(element);
              return true;
            }
            return false;
          }).toList();
          if (result.length > 0) {
            _selectList.add(result.first);
          }
        });
      }
    }
  }

  @override
  void onInit() {
    super.onInit();

    getSaveSelectListInfo();
  }
}
