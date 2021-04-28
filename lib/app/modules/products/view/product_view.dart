import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_pharmacy/app/modules/products/controller/product_controller.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';

class ProductView extends StatelessWidget {
  String categoryId;
  String categoryName;

  ProductView(this.categoryId, this.categoryName);

  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body:



       LimitedBox(
      maxHeight: double.infinity,
         child:

        ListView(
          children: [
            GetX<ProductController>(
              initState: (context) {
                productController.fetchProducts(categoryId);
              },
              builder: (controller) {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 8.0 / 12.0,
                    children: new List<Widget>.generate(controller.productList.length,
                            (index) {
                          return InkWell(
                            onTap: () {
                              // print(
                              //     'category Id: ${controller.categoryList[index].id}');
                              // Get.to(PostListScreen(controller.categoryList[index].id));
                            },
                            child: new GridTile(
                              child: new Card(
                                  elevation: 1,
                                  shadowColor: AppColors.themeColor,
                                  margin: EdgeInsets.all(4),
                                  child: new Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 2.0),
                                        Expanded(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: FadeInImage(
                                                  fit: BoxFit.fitHeight,
                                                  image: NetworkImage(controller
                                                      .productList[index].productImage),
                                                  placeholder: AssetImage(
                                                      'assets/images/loading.gif')),
                                            )),
                                        SizedBox(height: 10.0),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2, bottom: 2, left: 6, right: 8),
                                          child: Text(
                                            '${controller.productList[index].productName} (${controller.productList[index].unit})',
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2, bottom: 2, left: 6, right: 8),
                                          child: Text(
                                            'Mfg: ${controller.productList[index].mfgName}',
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 6, bottom: 4, left: 6, right: 1),
                                              child: Text(
                                                'Rs. ${controller.productList[index].price} ',
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 10, left: 6, right: 8),
                                              child: Text(
                                                '${controller.productList[index].discount} %off',
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontFamily: 'JosefinSans',
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2, bottom: 10, left: 6, right: 8),
                                          child:
                                          controller.productList[index].inStock == "1"
                                              ? Text(
                                            'In Stock',
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          )
                                              : Text(
                                            'Out of Stock',
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          );
                        }),
                  );
                }
              },
            ),
          ],
        ),
      )
    );
  }
}
