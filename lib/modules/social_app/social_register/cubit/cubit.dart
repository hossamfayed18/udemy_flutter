import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/cubit.dart';
import 'package:my_flutter_projects/models/Social_models/socialUserModel.dart';
import 'package:my_flutter_projects/models/shop_models/login_model.dart';
import 'package:my_flutter_projects/modules/shop_app/shop_Login/cubit/states.dart';
import 'package:my_flutter_projects/modules/shop_app/shop_register/cubit/states.dart';
import 'package:my_flutter_projects/modules/social_app/social_register/cubit/states.dart';
import 'package:my_flutter_projects/shared/components/constants.dart';
import 'package:my_flutter_projects/shared/network/end_points.dart';
import 'package:my_flutter_projects/shared/network/local/cache_helper.dart';
import 'package:my_flutter_projects/shared/network/remote/dio_helper.dart';


class SocialRegister_Cubit extends Cubit<SocialRegisterStates>{
  SocialRegister_Cubit(): super(SocialRegisterInitialState());

  static  SocialRegister_Cubit get(context){
    return BlocProvider.of(context);
  }


  bool ispass =true ;
  IconData myicon= Icons.remove_red_eye_outlined;
  void chngePasswordVisibility (){
   ispass=!ispass;
   ispass?myicon=Icons.remove_red_eye_outlined :myicon=Icons.visibility_off;
   emit(SocialRegisterChangePasswordVisibility());
  }

  void userRegister({required String email,required String password,required String name,required String phone}) {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      createUser(
        email: email,
        phone: phone,
        name: name,
        uid: value.user!.uid
      );

      /*print(value.user!.email);
      print(value.user!.uid);*/
    }).catchError((error) {
      print(error);
      emit(SocialRegistererrorState(error: error.toString()));
    });
  }

    void createUser({required String email,required String name,required String phone,required String uid}){
      SocialUserModel model = SocialUserModel(
        name:name ,
        phone: phone,
        email: email,
        uid: uid,
        image: 'https://img.freepik.com/free-photo/bohemian-man-with-his-arms-crossed_1368-3542.jpg?w=740&t=st=1670807523~exp=1670808123~hmac=b5b10eb87551fbbdff25fd7f66f25efe3503e8fc73b7602720117120809c4983',
        bio: 'writ your bio ...',
        cover:'https://img.freepik.com/free-photo/christmas-table-served-with-turkey-decorated-with-bright-tinsel-candles_2829-18829.jpg?w=826&t=st=1670824122~exp=1670824722~hmac=7b329de217a5c9667f31763c226c527c79214fd7099a51c66d9d01267f8c1b86',

      );
      emit(SocialCreateUserLoadingState());
      FirebaseFirestore.instance.collection('users').doc(uid).set(model.toMap()).then((value){
        CacheHelper.saveData(key:'uid', value: uid );
        emit(SocialCreateUserSuccessState());
      }).catchError((error){

        print(error.toString());
        emit(SocialCreateUsererrorState(error: error.toString()));
      }
      );


     }




}