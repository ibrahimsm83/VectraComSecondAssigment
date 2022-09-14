import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:themeproj/utils/app_navigation.dart';
import 'package:themeproj/utils/app_routes.dart';
import 'package:themeproj/utils/app_strings.dart';
import 'package:themeproj/utils/conectivity_manager.dart';
import 'package:themeproj/utils/share_preferance.dart';
import 'package:themeproj/widget/app_dialog.dart';

class Network {
  static Dio? _dio;
  static CancelToken? _cancelRequestToken;
  static Network? _network;
  static ConnectivityManager? _connectivityManager;
  Network._createInstance();
  factory Network() {
    // factory with constructor, return some value
    if (_network == null) {
      _network = Network
          ._createInstance(); // This is executed only once, singleton object
      _dio = _getDio();
      _cancelRequestToken = _getCancelToken();
      _connectivityManager = ConnectivityManager();
    }
    return _network!;
  }

  static Dio _getDio() {
    // BaseOptions options = new BaseOptions(
    //   connectTimeout: 20000,
    // );
    return _dio ??= Dio();
  }

  static CancelToken _getCancelToken() {
    return _cancelRequestToken ??= CancelToken();
  }

  void removetoken() {
    _cancelRequestToken?.cancel("mujy token cancel krna ha");
  }

  ////////////////// Get Request /////////////////////////
  Future<Response?> getRequest(
      {required BuildContext context,
      required String endPoint,
      Map<String, dynamic>? queryParameters,
      VoidCallback? onFailure,
      bool isToast = true,
      bool isErrorToast = true,
      int connectTimeOut = 20000,
      required bool isHeaderRequire}) async {
    Response? response;

    if (await _connectivityManager!.isInternetConnected()) {
      try {
        _dio?.options.connectTimeout = connectTimeOut;
        response = await _dio!.get(AppStrings.API_BASE_URL + endPoint,
            queryParameters: queryParameters,
            cancelToken: _cancelRequestToken,
            options: Options(
              headers: _setHeader(isHeaderRequire: isHeaderRequire),
              sendTimeout: connectTimeOut,
              receiveTimeout: connectTimeOut,
            ));
        //print(response);
      } on DioError catch (e) {
        log("Error:${e.response.toString()}");

        _validateException(
            response: e.response,
            context: context,
            message: e.message,
            onFailure: onFailure,
            isToast: isToast,
            isErrorToast: isErrorToast);
        // print("$endPoint Dio: " + e.message);
      }
    } else {
      _noInternetConnection(onFailure: onFailure);
    }
    return response;
  }

  ////////////////// Set Header /////////////////////
  _setHeader({required bool isHeaderRequire}) {
    if (isHeaderRequire == true) {
      String token = SharedPreference().getBearerToken() ?? "";
      return {
        'Accept': AppStrings.ACCEPT,
        'Authorization': "Bearer $token",
      };
    } else {
      return {
        'Accept': AppStrings.ACCEPT,
      };
    }
  }

  ////////////////// Validate Response /////////////////////
  void validateResponse(
      {Response? response,
      VoidCallback? onSuccess,
      VoidCallback? onFailure,
      bool isToast = true}) {
    var validateResponseData = response?.data;

    if (validateResponseData != null) {
      isToast
          ? AppDialogs.showToast(message: validateResponseData['message'] ?? "")
          : null;

      if (response!.statusCode == AppStrings.SUCCESS_CODE) {
        if (validateResponseData['status'] == AppStrings.API_SUCCESS_STATUS) {
          if (onSuccess != null) {
            onSuccess();
          }
        } else {
          if (onFailure != null) {
            onFailure();
          }
        }
      } else {
        if (onFailure != null) {
          onFailure();
        }
        //log(response.statusCode.toString());
      }
    }
  }

  ////////////////// Validate Response /////////////////////
  void validateSquareResponse(
      {Response? response,
      VoidCallback? onSuccess,
      VoidCallback? onFailure,
      bool isToast = true}) {
   
    var validateResponseData = response?.data;
    print(validateResponseData);

    if (validateResponseData != null) {
     
      isToast ? AppDialogs.showToast(message: "Successfully") : null;
      if (response!.statusCode == AppStrings.SUCCESS_CODE) {
        // if (validateResponseData['status'] ==
        //     AppStrings.API_SUCCESS_STATUS) {
          
        if (onSuccess != null) {
         
          onSuccess();
          // }
        } else {
          if (onFailure != null) {
            
            onFailure();
          }
        }
      } else {
       
        if (onFailure != null) {
          
          onFailure();
        }
        //log(response.statusCode.toString());
      }
    }
  }

  ////////////////// Validate Exception /////////////////////
  void _validateException(
      {required BuildContext context,
      Response? response,
      String? message,
      bool normalRequest = true,
      bool isToast = true,
      bool isErrorToast = true,
      VoidCallback? onFailure}) {
    log("Response:${response.toString()}");
    if (onFailure != null) {
      onFailure();
    }
    if (response?.statusCode == AppStrings.CARD_ERROR_CODE) {
      AppDialogs.showToast(
          message: response?.data["error"] != null
              ? response?.data["error"]
              : AppStrings.INVALID_CARD_ERROR);
    } else if (response?.statusCode == AppStrings.BAD_REQUEST_CODE) {
      //to check normal api or stripe bad request error
      if (normalRequest == true) {
        //for normal api request error
        isToast ? AppDialogs.showToast(message: "Some thing Wrong") : null;
      } else {
        //for stripe bad request error
        AppDialogs.showToast(
            message: response?.data["Error"] != null
                ? response?.data["Error"]
                : AppStrings.INVALID_BANK_ACCOUNT_DETAILS_ERROR);
      }
    } else if (response?.statusCode == AppStrings.FORBIDDEN_CODE) {
      //to check normal api or stripe bad request error
      AppDialogs.showToast(message: response?.data["Error"] ?? "");
    } else {
      isErrorToast
          ? AppDialogs.showToast(
              message: response?.statusMessage ?? message.toString())
          : null;
    }
    if (response?.statusCode == AppStrings.UNAUTHORIZED_CODE) {
      //AppNavigation.navigateToRemovingAll(context, AppRouteName.PRE_LOGIN_SCREEN_ROUTE);
      AppNavigation.navigateReplacementNamed(context, Routes.preLoginRoute);
    }
  }

  ////////////////// Validate Exception /////////////////////
  void _validateSquareException(
      {required BuildContext context,
      Response? response,
      String? message,
      bool normalRequest = true,
      bool isToast = true,
      bool isErrorToast = true,
      VoidCallback? onFailure}) {
    log("Response:${response.toString()}");
    if (onFailure != null) {
      onFailure();
    }
    if (response?.statusCode == AppStrings.CARD_ERROR_CODE) {
      AppDialogs.showToast(
          message: response?.data["error"]["detail"] != null
              ? response?.data["error"]["detail"]
              : AppStrings.INVALID_CARD_ERROR);
    } else if (response?.statusCode == AppStrings.BAD_REQUEST_CODE) {
      //to check normal api or stripe bad request error
      if (normalRequest == true) {
        //for normal api request error
        isToast
            ? AppDialogs.showToast(message: response?.data["error"] ?? "")
            : null;
      } else {
        //for stripe bad request error
        AppDialogs.showToast(
            message: response?.data["error"][0]['detail'] != null
                ? response?.data["error"][0]['detail']
                : AppStrings.INVALID_BANK_ACCOUNT_DETAILS_ERROR);
      }
    } else if (response?.statusCode == AppStrings.FORBIDDEN_CODE) {
      //to check normal api or stripe bad request error
      AppDialogs.showToast(message: response?.data["error"] ?? "");
    } else {
      isErrorToast
          ? AppDialogs.showToast(
              message: response?.statusMessage ?? message.toString())
          : null;
    }
    if (response?.statusCode == AppStrings.UNAUTHORIZED_CODE) {
      //AppNavigation.navigateToRemovingAll(context, AppRouteName.PRE_LOGIN_SCREEN_ROUTE);
      AppNavigation.navigateReplacementNamed(context, Routes.preLoginRoute);
      SharedPreference().clear();
    }
  }

  ////////////////// No Internet Connection /////////////////////
  void _noInternetConnection({VoidCallback? onFailure}) {
    if (onFailure != null) {
      onFailure();
    }
    AppDialogs.showToast(message: AppStrings.NO_INTERNET_CONNECTION);
  }

// ////////////////// On TimeOut /////////////////////
// void _onTimeOut({String message, onFailure}) {
//   if (onFailure != null) {
//     onFailure();
//   }
//   AppDialogs.showToast(message: message);
// }
}
