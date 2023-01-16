import 'package:xmshop/app/services/storage.dart';

class SearchServices {
  static String key = "searchList";

  // 保存历史记录
  static setHistoryData(keyWords) async {
    List? searchListData = await Storage.getData(key);
    print(searchListData);
    if (searchListData != null) {
      var hasData = searchListData.any((v) => v == keyWords);
      if (!hasData) {
        searchListData.add(keyWords);
        await Storage.setData(key, searchListData);
      }
    } else {
      List tempList = [];
      tempList.add(keyWords);
      await Storage.setData(key, tempList);
    }
  }

  // 获取历史记录
  static getHistoryData() async {
    List? searchListData = await Storage.getData(key);
    return searchListData ?? [];
  }

  // 删除历史记录
  static deleteHistoryData(keyWords) async {
    List? searchListData = await Storage.getData(key);
    if (searchListData != null) {
      searchListData.remove(keyWords);
      await Storage.setData(key, searchListData);
    }
  }

  // 清空搜索记录
  static clearHistoryData() async {
    await Storage.clear();
  }
}
