import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/shop_app/cubit/states.dart';
import 'package:my_flutter_projects/models/shop_models/categories_model.dart';
import 'package:my_flutter_projects/models/shop_models/favorite_model.dart';
import 'package:my_flutter_projects/models/shop_models/get_favorite_midel.dart';
import 'package:my_flutter_projects/models/shop_models/home_model.dart';
import 'package:my_flutter_projects/models/shop_models/login_model.dart';
import 'package:my_flutter_projects/modules/shop_app/categories/categories_screen.dart';
import 'package:my_flutter_projects/modules/shop_app/favorites/favorites_screen.dart';
import 'package:my_flutter_projects/modules/shop_app/products/products_screen.dart';
import 'package:my_flutter_projects/modules/shop_app/settings/settings_screen.dart';
import 'package:my_flutter_projects/shared/components/constants.dart';
import 'package:my_flutter_projects/shared/network/end_points.dart';
import 'package:my_flutter_projects/shared/network/local/cache_helper.dart';
import 'package:my_flutter_projects/shared/network/remote/dio_helper.dart';
import 'package:my_flutter_projects/shared/style/colors.dart';

class ShopLayoutCubit extends Cubit<ShopLayoutStates>{
  ShopLayoutCubit() :super(ShopLayoutInitialtState());

static ShopLayoutCubit get (context){
  return BlocProvider.of(context);
}

int currentIndex=0 ;

List <Widget>bottomScreens=[
  Products_screen(),
  Categories_screen(),
  Favorites_screen(),
  Settings_screen(),

];





void changeBottomNavItem (index){
  currentIndex =index;
  emit(ChangeBottomNavItemstate());
}

Map <int,bool>favorites={} ;
HomeModel? model;
void getHomeData (){
  emit(ShopLoadingHomeDatastate());
Dio_helper.getData(
    url:HOME,
    token: token,
).then((value){
   model= HomeModel.fromJson(value.data) ;
   model!.data!.products.forEach((element) {
     favorites.addAll({
       element.id!:element.in_favorites!
     });
   });
   print(favorites);
  emit(ShopSuccessHomeDatastate());
}).catchError((error){
  print(error.toString());
  emit(ShopErrorHomeDatastate());
});

}

  Categories_Model ? categoriesModel;
  void getCategories (){
    Dio_helper.getData(
      url:GET_CATEGORIES,
    ).then((value){
      categoriesModel= Categories_Model.fromJson(value.data) ;
      // print(categoriesModel!.status);
      // print(categoriesModel!.data!.current_page);
      // print(categoriesModel!.data!.current_page);
      // print(categoriesModel!.data!.list[0].image);
      // print(categoriesModel!.data!.list[0].name);


      emit(ShopSuccessCategoriesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });

  }

  FavoriteModel ? favModel;
  void myfavorites ( int id ){
    favorites[id] = ! favorites[id] !;
    emit(addOrDeleteFavoritesState());
    Dio_helper.postData(
        url: FAVORITES,
        token: token,
        data: {
          "product_id":id
        } ,
      //token:
    ).then((value){
      favModel= FavoriteModel.fromJson(value.data);
        if(!favModel!.status!)
      {
        favorites[id] = ! favorites[id] !;

      }else{getFavorites();}
      emit(ShopSuccessSetFavoriteState(favModel!));
    }).catchError((error){
      print(error);
      {favorites[id] = !favorites[id] !;}
      emit(ShopErrorSetFavoriteState());
    });

  } 
  
  GetFavoriteModel ? getFavoriteModel;
  
  void getFavorites (){
    
  Dio_helper.getData(
      url: FAVORITES ,
      token: token ,
  ).then((value){
    getFavoriteModel = GetFavoriteModel.fromJson(value.data);
    emit(ShopSuccessGetFavoriteState());
  }).catchError((error){
    print(error);
    emit(ShopErrorSetFavoriteState());
  });
    
  }

  ShopLogin_model ? profileModel ;
  void getProfile (){
    Dio_helper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      profileModel = ShopLogin_model.From_json(value.data);
      emit(ShopSuccessGetProfileState());
    }).catchError((error){
      print(error);
      emit(ShopErrorGetProfileState());
    });

  }


  bool ispass =true ;
  IconData myicon= Icons.remove_red_eye_outlined;
  void chngePasswordVisibility (){
    ispass=!ispass;
    ispass?myicon=Icons.remove_red_eye_outlined :myicon=Icons.visibility_off;
    emit(ShopChangePasswordVisibility());
  }


  ShopLogin_model ? loginmodel ;

  void userLogin({required String email,required String password}){

    emit(ShopLoadingState());

    Dio_helper.postData(
      url: 'login',
      data:{'email':email,'password':password},
    ).then((value){
      loginmodel =ShopLogin_model.From_json(value.data);
      print(loginmodel!.data==null?'null':loginmodel!.data!.phone);
      print(loginmodel!.message);
      emit(ShopLoginSuccessState(loginmodel!));
      print(value.data);
    }).catchError((error) {
      print(error.toString());
      emit(ShopULoginerrorState(error: error.toString()));
    });
  }

  void userUpdate({required String name ,required String phone,required String email}){
   emit(ShopLoadingUpdateDatastate());
   Dio_helper.putData(
       url: UPDATE_PROFILE,
       data: {
         "name": name ,
         "phone": phone ,
         "email" :email ,
       },
     token: token,
   ).then((value){
    profileModel = ShopLogin_model.From_json(value.data);
    emit(ShopSuccessUpdateDatastate());
   }).catchError((error){
     print(error);
     emit(ShopErrorUpdateDatastate());
   }) ;

  }





}