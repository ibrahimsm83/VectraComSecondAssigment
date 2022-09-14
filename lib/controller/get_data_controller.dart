import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:themeproj/model/product_model.dart';
import 'dart:async';
import 'package:themeproj/services/network.dart';

class ProductDetailsController extends GetxController {
//LocationList
  RxList<ProductModel?> productList = <ProductModel>[].obs;
  var isLoading = true.obs;
  ////////////////// Get Request /////////////////////////////////////////
  ///
  Future<void> getRequestApi(
      {required String endPoint, required BuildContext context}) async {
    try {
      isLoading(true);
      final _response = await Network().getRequest(
          endPoint: endPoint,
          // queryParameters: _queryParameters,
          context: context,
          isHeaderRequire: false);

      for (int i = 0; i < _response!.data.length; i++) {
        productList.add(ProductModel.fromJson(_response.data[i]));
      }
    } finally {
      isLoading(false);
    }
  }
}
