/*
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/shop_app/cubit/cubit.dart';
import 'package:my_flutter_projects/models/shop_models/login_model.dart';
import 'package:my_flutter_projects/modules/shop_app/shop_Login/cubit/states.dart';
import 'package:my_flutter_projects/shared/components/constants.dart';
import 'package:my_flutter_projects/shared/network/end_points.dart';
import 'package:my_flutter_projects/shared/network/remote/dio_helper.dart';


class ShopLogin_Cubit extends Cubit<ShopStates>{
  ShopLogin_Cubit(): super(ShopInitialState());

  static  ShopLogin_Cubit get(context){
    return BlocProvider.of(context);
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
      print(value.data);
      loginmodel =ShopLogin_model.From_json(value.data);
      print(loginmodel!.data==null?'null':loginmodel!.data!.phone);
      print(loginmodel!.message);
      emit(ShopLoginSuccessState(loginmodel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopULoginerrorState(error: error.toString()));
    });
  }






}*/
