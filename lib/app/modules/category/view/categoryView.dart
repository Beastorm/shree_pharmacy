import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_pharmacy/app/modules/home/controllers/category_controller.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('All Categories')),
        body: LimitedBox(
          child: ListView(
            children: [
              GetX<CategoryController>(
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
                          controller.categoryList.length, (index) {
                        return InkWell(
                          onTap: () {
                            // print(
                            //     'category Id: ${controller.categoryList[index].id}');
                            // Get.to(PostListScreen(controller.categoryList[index].id));
                          },
                          child: new GridTile(
                            child: new Card(
                                elevation: 0,
                                margin: EdgeInsets.all(2),
                                child: new Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            top: 10,
                                            bottom: 10,
                                            left: 6,
                                            right: 8),
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
            ],
          ),
        ));
  }
}
