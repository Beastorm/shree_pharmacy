import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shree_pharmacy/app/models/login_model.dart';


class LoginApi {
  static var client = http.Client();

  static Future<LoginModel> loginFunc(String email, String password) async {
    var baseurl = GlobalConfiguration().get('base_url');

    print('user reg data: email: $email, password: $password');

    var response = await client.post('${baseurl}user/login', body: {
      'user_email': email,
      'user_password': password
    });

    print('base url: $baseurl, response: $response');

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return loginModelFromJson(jsonString);
    }
  }
}
