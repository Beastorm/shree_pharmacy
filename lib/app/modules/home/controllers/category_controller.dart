import 'package:get/get.dart';
import 'package:shree_pharmacy/app/models/category_model.dart';
import 'package:shree_pharmacy/app/modules/home/providers/category_api.dart';

class CategoryController extends GetxController{

  var isLoading = true.obs;
  var categoryList = List<CategoryDatum>();
  //static var categoryListStatic = List<DatumCategory>();

  @override
  void onInit() {
    // TODO: implement onInit
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async {

    try {
      isLoading(true);
      var categories = await CategoryApi.fetchCategories();
      print('categories $categories');

      if (categories != null) {
        categoryList.assignAll(categories);
        // categoryListStatic.assignAll(categories);
      }
    } finally {
      isLoading(false);
    }
  }
}