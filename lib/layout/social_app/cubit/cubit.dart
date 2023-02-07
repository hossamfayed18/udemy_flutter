import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/states.dart';
import 'package:my_flutter_projects/models/Social_models/message_Model.dart';
import 'package:my_flutter_projects/models/Social_models/postModel.dart';
import 'package:my_flutter_projects/models/Social_models/socialUserModel.dart';
import 'package:my_flutter_projects/modules/social_app/chats/chats_screen.dart';
import 'package:my_flutter_projects/modules/social_app/home/home_screen.dart';
import 'package:my_flutter_projects/modules/social_app/settings/settings_screen.dart';
import 'package:my_flutter_projects/modules/social_app/users/users_screen.dart';
import 'package:my_flutter_projects/shared/components/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage ;
import 'package:my_flutter_projects/shared/network/local/cache_helper.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() :super(SocialInitialState());


  static SocialCubit get(context) {
    return BlocProvider.of(context);
  }

  SocialUserModel ? userModel;

  void getUser() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      userModel = SocialUserModel.Fromjson(value.data()!);
      /*print(model!.phone!);
      print(value.data());*/
      emit(SocialGetUserSuccssState());
    }).catchError((error) {
      print(error);
      emit(SocialGetUserErrorState());
    });
  }


  List<Widget> screens = [
    Home_Screen(),
    Chats_Screen(),
    Chats_Screen(), //تمويه
    Users_Screen(),
    Settings_Screen(),
  ];

  List<String> titles = [
    'Home',
    'Chats',
    'null',
    'Users',
    'Settings',
  ];

  int current_index = 0;

  void changeBottomNavIndex(int ind) {
    if (ind == 2)
      emit(SocialAddNewPostState());
    else {
      current_index = ind;
      emit(SocialChangeBottomnavIndexState());
    }
    if(ind==1)
     {
       getAllUsers();
     }

  }


  final profilePicker = ImagePicker();
  final coverpicker = ImagePicker();
  File ? profileImage;
  File ? coverImage;
  Future<void> getProfileImage() async {
    final pickedFile =
    await profilePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
     // print(profileImage!.path);
      emit(SocialProfileImagePickerSuccessState());
    }
    else {
      print('No image selected');
      emit(SocialProfileImagePickerErrorState());
    }
  }

  Future<void> getCoverImage() async {
    final pickedFile =
    await coverpicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickerSuccessState());
    }
    else {
      print('No image selected');
      emit(SocialCoverImagePickerErrorState());
    }
  }




  void uploadProfileImage(){

      emit(SocialLoadingProfileImageSuccessState());
      firebase_storage.FirebaseStorage
          .instance
          .ref()
          .child('users/${Uri.file(profileImage!.path)
          .pathSegments
          .last}')
          .putFile(profileImage!)
          .then((value) {
        value.ref.getDownloadURL().then((value) {
          updateUserProfil(
            name: userModel!.name,
            email: userModel!.email,
            phone: userModel!.phone,
            uid: userModel!.uid,
            isEmailVerified: userModel!.isEmailVerified,
            image: value,
            cover: userModel!.cover,
            bio: userModel!.bio,
          );
          emit(SocialUploadProfileImageSuccessState());
        }).catchError((error) {
          emit(SocialUploadProfileImageErrorState());
        });
      })
          .catchError((error) {
        print(error);
      });

  }


  void uploadCoverImage(){
      emit(SocialLoadingCoverImageSuccessState());
      firebase_storage.FirebaseStorage
          .instance
          .ref()
          .child('users/${Uri.file(coverImage!.path)
          .pathSegments
          .last}')
          .putFile(coverImage!)
          .then((value) {
        value.ref.getDownloadURL().then((value) {
          print(value);
          updateUserProfil(
            name: userModel!.name,
            email: userModel!.email,
            phone: userModel!.phone,
            uid: userModel!.uid,
            isEmailVerified: userModel!.isEmailVerified,
            image: userModel!.image,
            cover: value,
            bio: userModel!.bio,
          );
          emit(SocialUploadCoverImageSuccessState());
        }).catchError((error) {
          emit(SocialUploadCoverImageErrorState());
        });
      })
          .catchError((error) {
        print(error);
        print('zzzzzzzzzzz');
      });

  }


  void updateUserProfil({
  required  String ?name ,
  required  String ?email ,
  required  String ?phone ,
  required  String ? uid ,
  required  bool  isEmailVerified,
  required  String ? image ,
  required  String ? cover ,
  required  String ? bio ,
})

  {
   var  model=SocialUserModel(
     cover: cover,
     image: image,
     bio: bio,
     uid: uid,
     name:name ,
     phone:phone ,
     email: email,
     isEmailVerified:isEmailVerified ,
   );
   FirebaseFirestore.instance.collection('users').doc(uid).update(model.toMap()).then((value){
       getUser();
     emit(SocialUpdateProfileSuccessState());
   }).catchError((error){
     emit(SocialUpdateProfileErrorState());
   });
    
    

  }


  final Postimagepicker = ImagePicker();
  File ? postImage;

  Future<void> getPostImage() async {
    final pickedFile =
    await Postimagepicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      // print(profileImage!.path);
      emit(SocialPostImagePickerSuccessState());
    }
    else {
      print('No image selected');
      emit(SocialPostImagePickerErrorState());
    }
  }



  void createPost({
    required String ? text ,
    String ? postImage ,
    String ? dateTime,
  }){
    emit(SocialLoadingCreatePostState());
    var now = DateTime.now();
    PostModel model= PostModel(
      text: text,
      name:userModel!.name,
      uid: uid,
      image: userModel!.image,
      postImage:postImage ??'',
      dateTime: now.toString(),
    );
    FirebaseFirestore.instance.collection('Posts').add(model.toMap()).then((value){
      emit(SocialCreatePostSuccessState());
    }).catchError((error){
      emit(SocialCreatePostErrorState());
    });

  }









  void createPostwithPhoto({
    required String ? text ,
}){

    firebase_storage.FirebaseStorage
        .instance
        .ref()
        .child('users/${Uri.file(postImage!.path)
        .pathSegments
        .last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        final now = DateTime.now();
        createPost(
          text: text,
          dateTime: now.toString(),
          postImage: value,
        );
      }).catchError((error) {
        emit(SocialCreatePostErrorState());
      });
    })
        .catchError((error) {
      emit(SocialCreatePostErrorState());
    });

  }

 void closePostImage(){

    postImage=null;
    emit(SocialclosePostImageState());
 }

 List<PostModel> posts=[] ;
  List<String> postsID =[];
  List<int> likesNumber=[];
  List<int> commentsNumber=[];


void getPosts (){
  emit(SocialLoadingGetPostsState());
    FirebaseFirestore.instance.collection('Posts').get().then((value){
      value.docs.forEach((element) {
        element.reference.collection('likes').get().then((value){

            element.reference.collection('comments').get().then((value){
              commentsNumber.add(value.docs.length);
            });



              likesNumber.add(value.docs.length);
          postsID.add(element.id);
          posts.add(PostModel.Fromjson(element.data()));

        });
      });
      emit(SocialGetPostsSuccessState());
    }).catchError((error){
      emit(SocialGetPostsErrorState());
    });
}

void likePost (String postId){

  FirebaseFirestore.instance.collection('Posts').doc(postId).collection('likes').doc(userModel!.uid).set({
   'like':true,
  }).then((value){
    emit(SocialLikePostsSuccessState());
  }).catchError((error){
    emit(SocialLikePostsErrorState());
  });
  
}

void commentInPost(String postId) {
  FirebaseFirestore.instance.collection('Posts').doc(postId).collection(
      'comments').doc(userModel!.uid).set({
    'comment': true,
  })
  .then((value){
    emit(SocialCommentPostsSuccessState());
  }).catchError((error){
    emit(SocialCommentPostsErrorState());
  });


}


List<SocialUserModel>users=[];

void getAllUsers(){
FirebaseFirestore.instance.collection('users').get().then((value){
  if(users.length==0) {
    value.docs.forEach((element) {
      if (element.data()['uid'] != uid) {
        users.add(SocialUserModel.Fromjson(element.data()));
        emit(SocialGetAllUsersErrorState());
      }
    });
  }
}).catchError((error){
emit(SocialGetAllUsersErrorState());
});

}






  bool ispass =true ;
  IconData myicon= Icons.remove_red_eye_outlined;
  void chngePasswordVisibility (){
    ispass=!ispass;
    ispass?myicon=Icons.remove_red_eye_outlined :myicon=Icons.visibility_off;
    emit(SocialChangePasswordVisibility());
  }



  void userLogin({required String email,required String password,required context}){

    emit(SocialLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value){
      uid=value.user!.uid;
      CacheHelper.saveData(key: 'uid', value: value.user!.uid).then((value){
        getUser();
      });
      emit(SocialLoginSuccessState(value.user!.uid));
    }).catchError((error){
      emit(SocialLoginErrorState(error: error.toString()));
    });


  }

 void sendMessage ({required String  text, required String dateTime ,required String recieverId}){
   SocialMessageModel model = SocialMessageModel(
     dateTime: dateTime,
     text: text,
     recieverId: recieverId,
     senderId:userModel!.uid ,

   );

    FirebaseFirestore.instance.collection('users').doc(userModel!.uid).collection('chats').doc(recieverId).collection('messages').add(model.toMap()).then((value) {
      emit(SocialSendMessageSuccessState());
    }).catchError((error){
      emit(SocialSendMessageErrorState());
    });

   FirebaseFirestore.instance.collection('users').doc(recieverId).collection('chats').doc(userModel!.uid).collection('messages').add(model.toMap()).then((value) {
     emit(SocialSendMessageSuccessState());
   }).catchError((error){
     emit(SocialSendMessageErrorState());
   });



 }

 
 List<SocialMessageModel>messages =[];
  
  void getMessages (String recieverUid){
   FirebaseFirestore.instance.collection('users').doc(userModel!.uid).collection('chats').doc(recieverUid).collection('messages').orderBy('dateTime')
       .snapshots().listen((event) {
         messages =[] ;
         event.docs.forEach((element) {
           messages.add(SocialMessageModel.Fromjson(element.data()));
           emit(SocialGetMessagesSuccessState());
         });
   });
    
  }








}








