abstract class SocialRegisterStates {}

class SocialRegisterInitialState extends SocialRegisterStates{}

class SocialRegisterLoadingState extends SocialRegisterStates{}

class SocialRegisterSuccessState extends SocialRegisterStates{
}

class SocialRegistererrorState extends SocialRegisterStates {
  final String error;
  SocialRegistererrorState({required this.error});
}

class SocialCreateUserLoadingState extends SocialRegisterStates{}

class SocialCreateUserSuccessState extends SocialRegisterStates{
}

class SocialCreateUsererrorState extends SocialRegisterStates {
  final String error;
  SocialCreateUsererrorState({required this.error});
}


class SocialRegisterChangePasswordVisibility extends SocialRegisterStates{

}



