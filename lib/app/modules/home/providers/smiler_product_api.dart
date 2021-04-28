import 'package:global_configuration/global_configuration.dart';
import 'package:shree_pharmacy/app/models/similar_product_model.dart';
import 'package:http/http.dart' as http;

class SimilarProductApi {

  static var client = http.Client();

  static Future<List<DatumSimilarProduct>> fetchSimilarProducts() async {
    var baseUrl = GlobalConfiguration().get('base_url');

    // box.write('schoolId', schoolId);
    //        box.write('teacherId', teacherId);

    var response = await client.post('${baseUrl}product/suggest');

    print('response similarProducts: ' + baseUrl);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return similarProductModelFromJson(jsonString).data;
    }
  }
}