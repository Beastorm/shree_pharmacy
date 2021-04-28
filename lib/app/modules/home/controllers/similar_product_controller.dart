import 'package:get/get.dart';
import 'package:shree_pharmacy/app/models/similar_product_model.dart';
import 'package:shree_pharmacy/app/modules/home/providers/smiler_product_api.dart';

class SimilarProductController extends GetxController {
  var isLoading = true.obs;
  var similarProductList = List<DatumSimilarProduct>();

  //static var categoryListStatic = List<DatumCategory>();

  @override
  void onInit() {
    // TODO: implement onInit
    fetchSimilarProducts();
    super.onInit();
  }

  void fetchSimilarProducts() async {
    try {
      isLoading(true);
      var similarProduct = await SimilarProductApi.fetchSimilarProducts();
      print('categories $similarProduct');

      if (similarProduct != null) {
        similarProductList.assignAll(similarProduct);
      }
    } finally {
      isLoading(false);
    }
  }
}
