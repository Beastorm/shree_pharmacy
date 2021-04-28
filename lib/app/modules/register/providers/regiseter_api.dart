import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shree_pharmacy/app/models/register_model.dart';

class RegisterApi {
  static var client = http.Client();

  static Future<RegisterModel> regisetrFunc(String name, String mobile, String email,
      String dob, String password) async {
    var baseurl = GlobalConfiguration().get('base_url');

    print('user reg data: name: $name, mobile: $mobile, email: $email, dob: $dob, password: $password');

    var response = await client.post('${baseurl}user/register', body: {
      'user_fullname': name,
      'user_phone': mobile,
      'user_email': email,
      'user_bdate': dob,
      'user_password': password
    });

    print('base url: $baseurl, response: $response');

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return registerModelFromJson(jsonString);
    }
  }
}
