import 'package:global_configuration/global_configuration.dart';
import 'package:shree_pharmacy/app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductApi {

  static var client = http.Client();

  static Future<List<DatumProducts>> fetchProducts(String categoryId) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    // box.write('schoolId', schoolId);
    //        box.write('teacherId', teacherId);

    var response = await client.post('${baseUrl}product/list', body: {'cat_id':categoryId});

    print('response similarProducts: ' + baseUrl);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productModelFromJson(jsonString).data;
    }
  }
}