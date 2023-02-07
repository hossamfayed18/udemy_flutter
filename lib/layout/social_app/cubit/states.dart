abstract class SocialStates {}
class SocialLoadingState extends SocialStates{}
class SocialLoginSuccessState extends SocialStates{
  final String uid ;

  SocialLoginSuccessState(this.uid);

}

class SocialLoginErrorState extends SocialStates {
  final String error;
  SocialLoginErrorState({required this.error});
}

class SocialChangePasswordVisibility extends SocialStates{}

class SocialInitialState extends SocialStates{}
class SocialGetUserLoadingState extends SocialStates {}
class SocialGetUserSuccssState extends SocialStates {}
class SocialGetUserErrorState extends SocialStates{}
class SocialChangeBottomnavIndexState extends SocialStates{}
class SocialAddNewPostState extends SocialStates{}
class SocialProfileImagePickerSuccessState extends SocialStates{}
class SocialProfileImagePickerErrorState extends SocialStates{}
class SocialCoverImagePickerSuccessState extends SocialStates{}
class SocialCoverImagePickerErrorState extends SocialStates{}
class SocialUpdateProfileSuccessState extends SocialStates{}
class SocialUpdateProfileErrorState extends SocialStates{}
class SocialUploadProfileImageSuccessState extends SocialStates{}
class SocialUploadProfileImageErrorState extends SocialStates{}
class SocialUploadCoverImageSuccessState extends SocialStates{}
class SocialUploadCoverImageErrorState extends SocialStates{}
class SocialLoadingCoverImageSuccessState extends SocialStates{}
class SocialLoadingProfileImageSuccessState extends SocialStates{}
class SocialPostImagePickerSuccessState extends SocialStates{}
class SocialPostImagePickerErrorState extends SocialStates{}
class SocialLoadingCreatePostState extends SocialStates{}
class SocialCreatePostSuccessState extends SocialStates{}
class SocialCreatePostErrorState extends SocialStates{}
class SocialclosePostImageState extends SocialStates{}
class SocialLoadingGetPostsState extends SocialStates{}
class SocialGetPostsSuccessState extends SocialStates{}
class SocialGetPostsErrorState extends SocialStates{}
class SocialLikePostsSuccessState extends SocialStates{}
class SocialLikePostsErrorState extends SocialStates{}
class SocialCommentPostsSuccessState extends SocialStates{}
class SocialCommentPostsErrorState extends SocialStates{}
class SocialGetAllUsersSuccessState extends SocialStates{}
class SocialGetAllUsersErrorState extends SocialStates{}
class SocialSendMessageSuccessState extends SocialStates{}
class SocialSendMessageErrorState extends SocialStates{}
class SocialGetMessageSuccessState extends SocialStates{}
class SocialGetMessageErrorState extends SocialStates{}
class SocialGetMessagesSuccessState extends SocialStates{}
