import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/cubit.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/states.dart';
import 'package:my_flutter_projects/modules/social_app/edit_Profile/edit_Profile_Screen.dart';
import 'package:my_flutter_projects/shared/components/components.dart';
import 'package:my_flutter_projects/shared/style/icon_broken.dart';

class Settings_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener:(context,state){

      } ,
      builder:(context,state){
      return Padding(
          padding: EdgeInsetsDirectional.all(8),
          child: Column(
            children: [
              Container(
                height: 192,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        width: double.infinity,
                        height: 140,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExtendedNetworkImageProvider(
                              SocialCubit.get(context).userModel!.cover!,
                            ) ,
                            fit: BoxFit.cover,

                          ),
                          borderRadius: BorderRadius.only(
                            topRight:Radius.circular(5) ,
                            topLeft:Radius.circular(5) ,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 52,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        backgroundImage: ExtendedNetworkImageProvider(
                          SocialCubit.get(context).userModel!.image!,
                        ),
                        radius: 50,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Text(
                SocialCubit.get(context).userModel!.name!,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                SocialCubit.get(context).userModel!.bio!,
                style: Theme.of(context).textTheme.caption,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          children: [
                            Text(
                              '100',
                              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                fontWeight: FontWeight.w900
                              ),
                            ),
                            Text(
                              'Posts',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          children: [
                            Text(
                              '55',
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.w900
                          ),
                            ),
                            Text(
                              'Photos',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          children: [
                            Text(
                              '10K',
                                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontWeight: FontWeight.w900
                                ),
                            ),
                            Text(
                              'Followers',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          children: [
                            Text(
                              '27',
                                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontWeight: FontWeight.w900
                                ),
                            ),
                            Text(
                              'Followings',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],

                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: (){},
                      child: Text('Add Photos'),
                    ),
                  ),
                  SizedBox(width: 5,),
                  OutlinedButton(
                    onPressed: (){
                      navigatorTo(context,Edit_Profile_Screen());
                    },
                    child: Icon(IconBroken.Edit,size: 20),
                  ),

                ],
              ),


            ],
          ),
        );
      } ,
    );
  }
}
