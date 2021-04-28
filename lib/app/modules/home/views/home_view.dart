import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shree_pharmacy/app/models/slider_model.dart';
import 'package:shree_pharmacy/app/modules/category/view/categoryView.dart';
import 'package:shree_pharmacy/app/modules/home/controllers/category_controller.dart';
import 'package:shree_pharmacy/app/modules/home/controllers/similar_product_controller.dart';
import 'package:shree_pharmacy/app/modules/products/view/product_view.dart';
import 'package:shree_pharmacy/app/modules/slider/Controllers/slider_controllers.dart';
import 'package:shree_pharmacy/app/styles/app_colors.dart';



// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  CategoryController categoryController = Get.put(CategoryController());
  SimilarProductController similarProductController =
      Get.put(SimilarProductController());
  SliderController sliderController = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LimitedBox(
      child: ListView(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 8),
                  child: Text('Search for medicine',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 12, color: Colors.black87)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(Icons.search, color: Colors.black87),
                )
              ],
            ),
            margin: EdgeInsets.only(left: 50, right: 50, top: 8),
            height: 34,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0)),
            ),
          ),
          //Slider (need to fix)

          SizedBox(height: 20),

          GetX<SliderController>(
            builder: (controller) => Container(
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 180,
                  //aspectRatio: 16 / 9,
                  viewportFraction: 0.95,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 6),
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                itemCount: controller.sliderList?.length,
                itemBuilder: (context, index) {
                  var sliderItem = controller?.sliderList[index];
                  return Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: sliderItem?.sliderImage,
                        height: 180,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Image.asset(
                          'assets/images/loading.gif',
                          fit: BoxFit.cover,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  );
                },
              ),
            ),
          ),

          // Obx(() => CarouselSlider(
          //     items: getImages(),
          //     options: CarouselOptions(
          //       height: 400,
          //       aspectRatio: 16/9,
          //       viewportFraction: 0.8,
          //       initialPage: 0,
          //       enableInfiniteScroll: true,
          //       reverse: false,
          //       autoPlay: true,
          //       autoPlayInterval: Duration(seconds: 3),
          //       autoPlayAnimationDuration: Duration(milliseconds: 800),
          //       autoPlayCurve: Curves.fastOutSlowIn,
          //       enlargeCenterPage: true,
          //       // onPageChanged: callbackFunction,
          //       scrollDirection: Axis.horizontal,
          //     )
          // ),),

          // SizedBox(
          //   height: 200.0,
          //   width: double.infinity,
          //   child:
          //   Obx((){
          //     return Carousel(
          //         dotSize: 4.0,
          //         dotSpacing: 15.0,
          //         dotColor: Colors.white,
          //         indicatorBgPadding: 5.0,
          //          images: getImages()
          //       // images: [
          //       //   NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
          //       //   NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg')
          //       // ],
          //       //
          //       // images: [
          //       //   // ignore: unrelated_type_equality_checks
          //       //   for (var i = 5; i == sliderController.sliderList; i++)
          //       //     {
          //       //       print('sliders are: ${sliderController.sliderList[i].sliderImage}'),
          //       //       NetworkImage(
          //       //         sliderController.sliderList[i].sliderImage,
          //       //       ),
          //       //     }
          //       // ],
          //     );
          //   })
          // ),

          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 5),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal[100],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Regular medicine',
                            style: TextStyle(color: Colors.black87)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 6),
                        child: Text('Flat 15% off',
                            style: TextStyle(color: Colors.red)),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Liquid medicine',
                            style: TextStyle(color: Colors.black87)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 6),
                        child: Text('Flat 20% off',
                            style: TextStyle(color: Colors.red)),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 5),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Tablet medicine',
                            style: TextStyle(color: Colors.black87)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 6),
                        child: Text('Flat 30% off',
                            style: TextStyle(color: Colors.red)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 30),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue[500],
                ),
                borderRadius: BorderRadius.circular(
                    15) // use instead of BorderRadius.all(Radius.circular(20))
                ),
            height: 48,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.cloud_upload, color: AppColors.themeColor),
                  Text('Upload prescription',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                  Icon(Icons.medical_services_rounded, color: Colors.red),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          //Banner one
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                elevation: 0,
                child: Container(
                    color: Colors.white,
                    child: Image.asset('assets/images/covid.png'))),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Top categories',
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(CategoryView());
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 15, bottom: 15, right: 18),
                  child: Text(
                    'view all',
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              )
            ],
          ),

          GetX<CategoryController>(
            initState: (context) {},
            builder: (controller) {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 8.0 / 12.0,
                  children: new List<Widget>.generate(
                      controller.categoryList.length > 6
                          ? 6
                          : controller.categoryList.length, (index) {
                    return InkWell(
                      onTap: () {
                        print(
                            'categoryId.... : ${controller.categoryList[index].id}');
                        Get.to(() => ProductView(
                            controller.categoryList[index].id,
                            controller.categoryList[index].title));
                      },
                      child: new GridTile(
                        child: new Card(
                            elevation: 0,
                            margin: EdgeInsets.all(2),
                            child: new Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 2.0),
                                  Expanded(
                                      child: FadeInImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(controller
                                              .categoryList[index].image),
                                          placeholder: AssetImage(
                                              'assets/images/loading.gif'))),

                                  // Image.network(controller
                                  //     .categoryList[index].image)),

                                  SizedBox(height: 10.0),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10, left: 6, right: 8),
                                    child: Text(
                                      controller.categoryList[index].title,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                  )
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

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                elevation: 0,
                child: Container(
                    color: Colors.white,
                    child: Image.asset('assets/images/covid.png'))),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Products for you',
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(CategoryView());
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 15, bottom: 15, right: 18),
                  child: Text(
                    'view all',
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              )
            ],
          ),

          GetX<SimilarProductController>(
            initState: (context) {},
            builder: (controller) {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 8.0 / 12.0,
                  children: new List<Widget>.generate(
                      controller.similarProductList.length > 6
                          ? 6
                          : controller.similarProductList.length, (index) {
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
                                        fit: BoxFit.fill,
                                        image: NetworkImage(controller
                                            .similarProductList[index]
                                            .productImage),
                                        placeholder: AssetImage(
                                            'assets/images/loading.gif')),
                                  )),
                                  SizedBox(height: 10.0),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2, bottom: 2, left: 6, right: 8),
                                    child: Text(
                                      '${controller.similarProductList[index].productName} (${controller.similarProductList[index].unit})',
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
                                      'Mfg: ${controller.similarProductList[index].mfgName}',
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
                                            top: 6,
                                            bottom: 4,
                                            left: 6,
                                            right: 1),
                                        child: Text(
                                          'Rs. ${controller.similarProductList[index].price} ',
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 6,
                                            right: 8),
                                        child: Text(
                                          '${controller.similarProductList[index].discount} %off',
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
                                    child: controller.similarProductList[index]
                                                .inStock ==
                                            "1"
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
    ));
  }

  List<Widget> getImages() {
    return List<Widget>.generate(
        sliderController.sliderList.length,
        (index) =>
            Image.network(sliderController.sliderList[index].sliderImage));
  }

  getImgeloop() {
    List<DatumSlider> sliderList = sliderController.sliderList;
    List<String> sliderLoaderStr = List();

    for (var i in sliderList) {
      sliderLoaderStr.add(i.sliderImage);
    }
    return sliderLoaderStr;
  }
}
