import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/cubit.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/states.dart';
import 'package:my_flutter_projects/shared/components/components.dart';
import 'package:my_flutter_projects/shared/style/icon_broken.dart';

class Edit_Profile_Screen extends StatelessWidget {
  var nameController =TextEditingController();
  var bioController =TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit =SocialCubit.get(context);
        var profileImage =cubit.profileImage;
        var coverImage =cubit.coverImage;
        var model = cubit.userModel ;
        nameController.text= model!.name!;
        bioController.text= model.bio!;
        phoneController.text= model.phone!;
        return  Scaffold(
          appBar:defualtAppBar(
            context: context,
            title: 'Edit Profile',
            actions: [
              TextButton(
                onPressed: () {
                cubit.updateUserProfil(
                    name: nameController.text,
                    email: model.email,
                    phone: phoneController.text,
                    uid: model.uid,
                    isEmailVerified: model.isEmailVerified,
                    image: model.image,
                    cover: model.cover,
                    bio: bioController.text,
                );
                },
                child: Text('UPDATE'),
              ),
              SizedBox(width: 15,)
            ],
          ) ,
          body: Padding(
            padding: EdgeInsetsDirectional.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 192,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 140,
                              decoration: BoxDecoration(
                                image:coverImage==null? DecorationImage(image:ExtendedNetworkImageProvider(model.cover!), fit: BoxFit.cover,):DecorationImage(image:FileImage(coverImage), fit: BoxFit.cover, ),
                                borderRadius: BorderRadius.only(
                                  topRight:Radius.circular(5) ,
                                  topLeft:Radius.circular(5) ,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                end: 8,
                                top: 8,
                              ),
                              child: CircleAvatar(
                                radius: 20,
                                child: IconButton(
                                  onPressed:(){
                                   cubit.getCoverImage();
                                  },
                                  icon: Icon(
                                    IconBroken.Camera,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 52,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            child: profileImage==null? CircleAvatar(backgroundImage:  ExtendedNetworkImageProvider(model.image!,), radius: 50,):CircleAvatar(backgroundImage:  FileImage(profileImage), radius: 50,),
                          ),
                          CircleAvatar(
                           radius: 18,
                            child: IconButton(
                              onPressed:(){
                                cubit.getProfileImage();
                              },
                              icon: Icon(
                                  IconBroken.Camera,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                if(profileImage!=null|| coverImage!=null)
                Row(
                  children: [
                    if(profileImage!=null)
                    Expanded(
                      child: defaultButton(
                          function:(){
                            cubit.uploadProfileImage();
                      },
                        text: 'Update profile image'
                      ),
                    ),
                    SizedBox(width: 10,),
                    if(coverImage!=null)
                    Expanded(
                      child: defaultButton(
                          function:(){
                            cubit.uploadCoverImage();
                          },
                          text: 'Update cover image'
                      ),
                    )

                  ],
                ),
                SizedBox(height: 20,),
                defaultTFF(
                    mycontroller: nameController,
                    mykeyboardType: TextInputType.text, text: 'Name',
                    myprefixIcon:  IconBroken.User ,
                ),
                  SizedBox(height:10),
                defaultTFF(
                    mycontroller: bioController,
                    mykeyboardType: TextInputType.text,
                    text: 'Bio',
                    myprefixIcon: IconBroken.Info_Circle,
                ),
                SizedBox(height:10),
                defaultTFF(
                  mycontroller: phoneController,
                  mykeyboardType: TextInputType.phone,
                  text: 'Phone',
                  myprefixIcon: IconBroken.Call,
                ),

              ],
            ),
          ),

        );
      },
    );
  }
}
