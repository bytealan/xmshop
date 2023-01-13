import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/category_model.dart';

class CategoryController extends GetxController {
  RxInt selectIndex = 0.obs;
  RxList<CategoryItemModel> leftCategoryList = <CategoryItemModel>[].obs;
  RxList<CategoryItemModel> rightCategoryList = <CategoryItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getLeftCategoryData();
  }

  void getLeftCategoryData() async {
    var res = await Dio().get("https://xiaomi.itying.com/api/pcate");
    CategoryModel pList = CategoryModel.fromJson(res.data);
    leftCategoryList.value = pList.result!;
    getRightCategoryData(leftCategoryList[0].sId!);
    update();
  }

  void getRightCategoryData(id) async {
    var res = await Dio().get("https://xiaomi.itying.com/api/pcate?pid=$id");
    CategoryModel pList = CategoryModel.fromJson(res.data);
    rightCategoryList.value = pList.result!;
    update();
  }

  void changeIndex(index) {
    selectIndex.value = index;
    getRightCategoryData(leftCategoryList[index].sId);
    update();
  }
}
