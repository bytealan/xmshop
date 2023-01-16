import 'package:get/get.dart';
import 'package:xmshop/app/services/search_services.dart';

class SearchController extends GetxController {
  String keyWords = "";
  RxList historyList = [].obs;

  @override
  void onInit() {
    super.onInit();
    getHistoryList();
  }

  getHistoryList() async {
    historyList.value = await SearchServices.getHistoryData();
    update();
  }

  clearHistoryList() async {
    await SearchServices.clearHistoryData();
    historyList.clear();
    update();
  }

  removeHistoryList(e) async {
    await SearchServices.deleteHistoryData(e);
    historyList.remove(e);
    update();
  }
}
