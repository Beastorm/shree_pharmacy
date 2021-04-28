import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_pharmacy/app/modules/cart/views/cart_views.dart';
import 'package:shree_pharmacy/app/modules/profile/view/account_view.dart';
import 'package:shree_pharmacy/app/modules/home/views/home_view.dart';
import 'package:shree_pharmacy/app/modules/home/views/order_view.dart';
import 'package:shree_pharmacy/app/modules/home/views/topBrand_view.dart';
import 'package:shree_pharmacy/app/modules/notifications/views/notification_view.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';

class PagesView extends StatefulWidget {
  @override
  _PagesViewState createState() => _PagesViewState();
}

class _PagesViewState extends State<PagesView> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _screens = [
    HomeView(),
    TopBrandView(),
    OrderView(),
    AccountView()
  ];

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedItem) {
    print(selectedItem);
    _pageController.jumpToPage(selectedItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     //Get.to(AddAssignment(courseId));
      //   },
      //   splashColor: AppColors.themeColor,
      //   child:Icon(Icons.add),
      //   // shape: RoundedRectangleBorder(
      //   //     borderRadius: BorderRadius.all(Radius.circular(30.0)))
      //
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/images/sp_logo_full.png',
          width: 100,
        ),
        backgroundColor: AppColors.white,
        leading: Icon(Icons.menu, color: AppColors.black),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications_outlined),
              color: Colors.teal,
              onPressed: () {

                Get.to(()=>NotificationView());
              }),
          IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              color: Colors.teal,
              onPressed: () {
                Get.to(()=>CartView());
              }),
        ],
      ),

      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedFontSize: 16,
        onTap: _onItemTapped,
        items: [
          // /   HomeView(),
          //     TopBrandView(),
          //     OrderView(),
          //     AccountView()
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled,
                color: _selectedIndex == 0
                    ? AppColors.themeColor
                    : Colors.blueGrey.shade200),
            title: Text(
              'Home',
              style: TextStyle(
                  color: _selectedIndex == 0
                      ? AppColors.themeColor
                      : Colors.blueGrey.shade200),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.reorder_outlined,
                color: _selectedIndex == 1
                    ? AppColors.themeColor
                    : Colors.blueGrey.shade200),
            title: Text(
              'Top',
              style: TextStyle(
                  color: _selectedIndex == 1
                      ? AppColors.themeColor
                      : Colors.blueGrey.shade200),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt,
                color: _selectedIndex == 2
                    ? AppColors.themeColor
                    : Colors.blueGrey.shade200),
            title: Text(
              'Order',
              style: TextStyle(
                  color: _selectedIndex == 2
                      ? AppColors.themeColor
                      : Colors.blueGrey.shade200),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box,
                color: _selectedIndex == 3
                    ? AppColors.themeColor
                    : Colors.blueGrey.shade200),
            title: Text(
              'Account',
              style: TextStyle(
                  color: _selectedIndex == 3
                      ? AppColors.themeColor
                      : Colors.blueGrey.shade200),
            ),
          ),
        ],
      ),
    );
  }
}
