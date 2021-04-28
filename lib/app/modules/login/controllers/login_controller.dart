
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shree_pharmacy/app/modules/home/views/pages_view.dart';
import 'package:shree_pharmacy/app/modules/login/providers/login_api.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/loading_components.dart';
import 'package:shree_pharmacy/app/styles/commonmodule/my_snack_bar.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final box = GetStorage();

  getLogin() async {
    LoadingComponent.alertDialog('Loading, please wait', '');

    var response = await LoginApi.loginFunc(
        emailController.text.trim(),
        passwordController.text.trim());

    print('register controller response: ${response.responce}');
    if (response != null) {
      if (response.responce == true && response.message == null) {
        String userId = response.data.userId;
        String mobile = response.data.userPhone;
        String name = response.data.userFullname;
        String email = response.data.userEmail;
        String bDay = response.data.userBdate;

        print('userid: $userId, mobile: $mobile, name: $name, email: $email');

        box.write('loginStatus', 'true');
        box.write('userId', userId);
        box.write('mobile', mobile);
        box.write('name', name);
        box.write('email', email);
        box.write('bDay', bDay);


        MySnackbar.successSnackBar('Success', 'Login successfully done');
        Get.to(() => PagesView());
      } else if (response.message == 'Invalide Username or Passwords') {
        Get.back();
        MySnackbar.infoSnackBar(
            'Invalid credentials', 'Invalid email or password');
      } else {
        Get.back();
        MySnackbar.errorSnackBar(
            'Login failed', 'Server down, please try again later');
      }
    }
  }
}