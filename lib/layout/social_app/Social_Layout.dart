import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/cubit.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/states.dart';
import 'package:my_flutter_projects/modules/social_app/new_post/new_Post_Screen.dart';
import 'package:my_flutter_projects/shared/components/components.dart';
import 'package:my_flutter_projects/shared/style/icon_broken.dart';
class Social_Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
        listener: (context,state){
          if(state is SocialAddNewPostState)
            navigatorTo(context, New_Post_Screen());
        },
      builder:(context,state){
          var cubit = SocialCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.current_index],
              ),
              actions: [
                IconButton(
                    onPressed:(){

                    },
                    icon: Icon(
                      IconBroken.Notification,
                    ),
                ),
                IconButton(
                  onPressed:(){

                  },
                  icon: Icon(
                    IconBroken.Search,
                  ),
                ),
              ],
            ),
            body: cubit.screens[cubit.current_index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.current_index,
              onTap: (index){
                cubit.changeBottomNavIndex(index) ;
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Home,
                  ) ,
                  label: 'Home',

                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Chat,
                  ) ,
                  label: 'Chats',

                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Paper_Upload,
                  ) ,
                  label: 'Post',

                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.User,
                  ) ,
                  label: 'Users',

                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Setting,
                  ) ,
                  label: 'Settings',

                ),

              ],
            ),
          );
    },
    );
  }
}
