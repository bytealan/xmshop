import 'package:get/get.dart';
import 'package:xmshop/app/models/category_model.dart';
import 'package:xmshop/app/services/https_client.dart';

class CategoryController extends GetxController {
  RxInt selectIndex = 0.obs;
  RxList<CategoryItemModel> leftCategoryList = <CategoryItemModel>[].obs;
  RxList<CategoryItemModel> rightCategoryList = <CategoryItemModel>[].obs;

  HttpsClient httpsClient = HttpsClient();

  @override
  void onInit() {
    super.onInit();
    getLeftCategoryData();
  }

  void getLeftCategoryData() async {
    var res = await httpsClient.get("api/pcate");
    if (res != null) {
      CategoryModel pList = CategoryModel.fromJson(res.data);
      leftCategoryList.value = pList.result!;
      getRightCategoryData(leftCategoryList[0].sId!);
      update();
    }
  }

  void getRightCategoryData(id) async {
    var res = await httpsClient.get("api/pcate?pid=$id");
    if (res != null) {
      CategoryModel pList = CategoryModel.fromJson(res.data);
      rightCategoryList.value = pList.result!;
      update();
    }
  }

  void changeIndex(index) {
    selectIndex.value = index;
    getRightCategoryData(leftCategoryList[index].sId);
    update();
  }
}
