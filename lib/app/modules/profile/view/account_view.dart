import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shree_pharmacy/app/modules/profile/controller/profile_controller.dart';
import 'package:shree_pharmacy/app/modules/profile/view/edit_profile.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';

class AccountView extends StatelessWidget {
  ProfileController controller = ProfileController();
  var box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: CachedNetworkImage(
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              imageUrl: controller.image,
              placeholder: (context, url) => Image.asset(
                'assets/images/loading.gif',
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.account_circle_rounded,
                size: 80.0,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          controller.image == ''
              ? Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Add picture '),
                      Icon(
                        Icons.add_circle,
                        size: 16,
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Edit picture '),
                      Icon(
                        Icons.edit,
                        size: 16,
                      )
                    ],
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 30),
            child: Card(
                child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Personal Deatails',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Name : ${box.read('name')}',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Email : ${box.read('email')}',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Phone : ${box.read('mobile')}',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  SizedBox(height: 6),
                  (box.read('bDay')) == null
                      ? Text(
                          'DOB : Not available',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        )
                      : Text(
                          'DOB : ${box.read('bDay')}',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Get.to(() => EditProfile()),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, right: 18.0, top: 10, bottom: 10),
                          child: Text(
                            'EDIT',
                            style: TextStyle(
                                fontFamily: 'JosefinSans',
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 6),
            child: Card(
                child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.fiber_pin, color: AppColors.themeColor,),
                          SizedBox(width: 6),
                          Text(
                            'Change Password',
                            style:
                                TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.themeColor,),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.group_add, color: AppColors.themeColor,),
                          SizedBox(width: 6),
                          Text(
                            'Use another account',
                            style:
                            TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.themeColor,),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.logout, color: AppColors.themeColor,),
                          SizedBox(width: 6),
                          Text(
                            'Log out',
                            style:
                            TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.themeColor),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 16
                    )
                  ],
                ),
              ),
            )),
          )
        ],
      ),
    );
  }
}
