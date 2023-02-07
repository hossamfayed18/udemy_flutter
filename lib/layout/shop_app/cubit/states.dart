import 'package:my_flutter_projects/models/shop_models/favorite_model.dart';
import 'package:my_flutter_projects/models/shop_models/login_model.dart';

abstract class ShopLayoutStates{}
class ShopLayoutInitialtState extends ShopLayoutStates{}
class ChangeBottomNavItemstate extends ShopLayoutStates{}
class ShopLoadingHomeDatastate extends ShopLayoutStates{}
class ShopSuccessHomeDatastate extends ShopLayoutStates{}
class ShopErrorHomeDatastate extends ShopLayoutStates{}
class ShopSuccessCategoriesState extends ShopLayoutStates{}
class ShopErrorCategoriesState extends ShopLayoutStates{}
class addOrDeleteFavoritesState extends ShopLayoutStates{}
class ShopSuccessSetFavoriteState extends ShopLayoutStates{
  final FavoriteModel model;

  ShopSuccessSetFavoriteState(this.model);
}
class ShopErrorSetFavoriteState extends ShopLayoutStates{}

class ShopSuccessGetFavoriteState extends ShopLayoutStates{
}
class ShopErrorGetFavoriteState extends ShopLayoutStates{}

class ShopSuccessGetProfileState extends ShopLayoutStates{
}
class ShopErrorGetProfileState extends ShopLayoutStates{}

//ShopLoginSuccessState
class ShopLoadingState extends ShopLayoutStates{}

class ShopLoginSuccessState extends ShopLayoutStates{
  final ShopLogin_model model;
  ShopLoginSuccessState( this.model);
}
class ShopLoadingUpdateDatastate extends ShopLayoutStates{}
class ShopSuccessUpdateDatastate extends ShopLayoutStates{}
class ShopErrorUpdateDatastate extends ShopLayoutStates{}


class ShopULoginerrorState extends ShopLayoutStates {
  final String error;
  ShopULoginerrorState({required this.error});
}

class ShopChangePasswordVisibility extends ShopLayoutStates{

}


