import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:themeproj/controller/get_data_controller.dart';
import 'package:themeproj/model/product_model.dart';
import 'package:themeproj/utils/app_colors.dart';
import 'package:themeproj/utils/app_strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductDetailsController _myController = Get.put(ProductDetailsController());

  @override
  void initState() {
    getRequest();
    super.initState();
  }

  void getRequest() {
    _myController.getRequestApi(
        context: context, endPoint: AppStrings.Product_ENDPOINT);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 20.0),
      SizedBox(
        height: Platform.isIOS
            ? (MediaQuery.of(context).size.height * 0.15 -
                MediaQuery.of(context).size.height * 0.13 * 0.3)
            : 15.h,
      ),
      Expanded(
        child: Obx(
          (() {
            if (_myController.isLoading.value) {
              return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary));
            } else {
              return _myController.productList.isEmpty
                  ? Center(
                      child: Text(
                      "Record Not Found",
                      style: TextStyle(color: Theme.of(context).cardColor),
                    ))
                  : Container(
                      alignment: Alignment.topCenter,
                      // color: AppColors.BACKGROUND_BLUE_HAZE,
                      child: ListView.separated(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 0.0, bottom: 18.h),
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 8);
                        },
                        itemCount: _myController.productList.length,
                        itemBuilder: (context, index) =>
                            card(_myController.productList[index]!),
                      ),
                    );
            }
          }),
        ),
      ),
    ]);
  }

  Widget card(ProductModel pm) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).splashColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      width: 300,
      child: Column(
        children: [
          Container(
            height: 150,
            width: sizeWidth(context),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0)),
              //BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: pm.imageLink ?? "http://via.placeholder.com/350x150",
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("name :"),
                    Text(pm.name.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text("latin name :"),
                    Text(pm.latinName.toString()),
                  ],
                ),
                Row(
                  children: [
                    const Text("Animal Type :"),
                    Text(pm.animalType.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text("ActiveTime :"),
                    Text(pm.activeTime.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("lengtn min: ${pm.lengthMin}"),
                        Text("lengtn max: ${pm.lengthMax}"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Weight min:${pm.weightMin}"),
                        Text("Weight max:${pm.weightMax}"),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("lifespan :"),
                    Text(pm.lifespan.toString()),
                  ],
                ),
                Row(
                  children: [
                    const Text("Habbit :"),
                    Flexible(child: Text(pm.habitat.toString())),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Diet :"),
                    Flexible(child: Text(pm.diet.toString())),
                  ],
                ),
                Row(
                  children: [
                    const Text("GeoRange :"),
                    Text(pm.geoRange.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
