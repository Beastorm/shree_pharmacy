
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shree_pharmacy/app/modules/home/views/pages_view.dart';
import 'package:shree_pharmacy/app/modules/intro/views/intro_page.dart';
import 'package:shree_pharmacy/app/modules/login/views/login_view.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';

class SplashView extends StatelessWidget {
 final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String loginStatus = box.read('loginStatus');

    Timer(Duration(seconds: 4), () {
     print('Loginstatus : $loginStatus');


      Get.to(LoginView());
       if (loginStatus == null) {
      Get.offAll(IntroPage());
      } else {
        Get.offAll(PagesView());
      }
    });

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.white,
        child: Center(
          child: Image.asset(
            'assets/images/sp_logo_full.png',
            width: 240.0,

          ),
        ),
      ),
    );
  }
}
