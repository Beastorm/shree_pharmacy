import 'package:get/get.dart';
import 'package:shree_pharmacy/app/models/product_model.dart';
import 'package:shree_pharmacy/app/modules/products/provider/product_api.dart';

class ProductController extends GetxController{

  var isLoading = true.obs;
  var productList = List<DatumProducts>();


  void fetchProducts(String categoryId) async {
    try {
      isLoading(true);
      var products = await ProductApi.fetchProducts(categoryId);
      print('categories $products');

      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}