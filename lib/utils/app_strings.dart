
import 'package:flutter/material.dart';

sizeWidth(BuildContext context) => MediaQuery.of(context).size.width;
sizeHeight(BuildContext context) => MediaQuery.of(context).size.height;
class AppStrings {
  static const loginwithemail = "LOGIN WITH EMAIL";

  static const loginwithFacebook = "LOGIN WITH FACEBOOK";
  static const loginwithGoogle = "LOGIN WITH GOOGLE";
  static const loginwithApple = "LOGIN WITH APPLE";
  static const verification = "Verification";
  static const existingPassword = "Existing Password";
  static const newPassword = "New Password";
  static const confirmNewPassword = "Confirm New Password";
  static const donthaveanaccount  = "Don't have an account? ";
  static const signuphere = "Signup here";
  static const agreement = "AGREEMENT";
  static const ihavereadandagreedwith = "I have read and agreed with";
  static const termsConditions = "Terms & Conditions";
  static const privacyPolicy = "Privacy Policy";
  static const reject = "REJECT";
  static const accept = "ACCEPT";
  static const emailAddress = "Email Address";
  static const password = "Password";
  static const forgotPassword = "Forgot Password?";
  static const login = "Login";
  static const signuptoday = "Signup today";
  static const hintEmailaddress = "john.smith@domain.com";
  static const username = "Username";
  static const confirmPassword = "Confirm Password";
  static const phone = "Phone";
  static const create = "Create";
  static const send = "Send";
  static const hintOptdescription = "We have sent you an email containing VERIFICATION CODE and instructions. please follow the instructions to verify your email address";
  static const dontreceivecode  = "Don't receive code?";
  static const resend = "Resend";
  static const reset = "Reset";
  static const resetPassword = "Reset Password";
  static const johnSmith = "John Smith";
  static const cHANGE = "CHANGE";
  static const home = "Home";
  static const profile = "Profile";
  static const settings = "Settings";
  static const privacypolicy = "Privacy policy";
  static const logout = "Logout";

  //Validation Strings
  static const emailValidator = "Please enter a valid email";
  static const otpValidator = "Please fill all Fields";
  static const currentWeightValidator = "Please fill current weight";
  static const desiredWeightValidator = "Please fill desired weight";
  static const enterSomeText = "Please enter some text";
  static const enterageValidateText = "Please enter age";
  static const enterAddressText = "Please enter Address";
  static const enterUserNameText = "Please enter Username";
  static const notMatchValidator = "Not Match";
  static const phoneNumberValidator =
      "Please Enter Phone Number (At Least 10 digits)";
  static const passChangeSuccessful = "Password Changed Successfully..";

  static const passwordvalidator =
      "Password must contain an uppercase, lowercase, numeric digit and special character";



  //------------------------------Api Strings
  static const String API_BASE_URL = "https://zoo-animal-api.herokuapp.com/animals/";
  static const String Product_ENDPOINT = "rand/10";

  /////// API HEADER TEXT ////////////////////////
  static const String ACCEPT = 'application/json';
  static const String BEARER_TOKEN_KEY = "bearer_token";

  ////// API STATUS CODE/////////////
  static const int SUCCESS_CODE = 200;
  static const int UNAUTHORIZED_CODE = 401;
  static const int CARD_ERROR_CODE = 402;
  static const int BAD_REQUEST_CODE = 400;
  static const int FORBIDDEN_CODE = 403;

  /////////// API MESSAGES /////////////////
  static const int API_SUCCESS_STATUS = 1;
  static const String EMAIL_UNVERIFIED = "0";
  static const String EMAIL_VERIFIED = "1";
  static const String PROFILE_INCOMPLETED = "0";
  static const String PROFILE_COMPLETED = "1";

  /////////// API TOAST MESSAGES //////////////////
  static const String NO_INTERNET_CONNECTION = "No Internet Connection!";
  static const String SOMETHING_WENT_WRONG = "Something Went Wrong";
  static const String INVALID_CARD_ERROR = "Invalid Card Details.";
  static const String CARD_TYPE_ERROR = "Wrong card type.";
  static const String INVALID_BANK_ACCOUNT_DETAILS_ERROR = "Invalid Bank Account Details.";
  static const String MERCHANT_ACCOUNT_ERROR = "Error:Merchant Account can not be created.";





}