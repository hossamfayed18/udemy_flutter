import 'package:my_flutter_projects/models/shop_models/login_model.dart';

abstract class ShopRegisterStates {}

class ShopRegisterInitialState extends ShopRegisterStates{}

class ShopRegisterLoadingState extends ShopRegisterStates{}

class ShopRegisterSuccessState extends ShopRegisterStates{
 final ShopLogin_model model;
 ShopRegisterSuccessState( this.model);
}

class ShopRegistererrorState extends ShopRegisterStates {
  final String error;
  ShopRegistererrorState({required this.error});
}

class ShopRegisterChangePasswordVisibility extends ShopRegisterStates{

}