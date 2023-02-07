import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/cubit.dart';
import 'package:my_flutter_projects/models/Social_models/socialUserModel.dart';
import 'package:my_flutter_projects/modules/social_app/chats_Details/chat_Details_Screen.dart';
import 'package:my_flutter_projects/shared/components/components.dart';

import '../../../layout/social_app/cubit/states.dart';

class Chats_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){

      },
      builder:(context,state){
        return ConditionalBuilder(
            condition: SocialCubit.get(context).users.length>0 && state is ! SocialGetAllUsersSuccessState ,
            builder: (context){
             return ListView.separated(
               physics: BouncingScrollPhysics(),
                 itemBuilder: (context,index)=>buildChatItem(SocialCubit.get(context).users[index],context),
               separatorBuilder: (context,index)=>mydivider(),
                 itemCount:SocialCubit.get(context).users.length,
             );
            },
            fallback: (context)=>Container(),
        );
      } ,
    ) ;
  }

  Widget buildChatItem ( SocialUserModel model,context){
    return InkWell(
      onTap: (){
        navigatorTo(context, Chat_Details_Screen(model: model));
      },
      child: Padding(
        padding: EdgeInsetsDirectional.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: ExtendedNetworkImageProvider(
                      model.image!,
              ),
            ),
            SizedBox(width: 10),
            Text(
              model.name!,
              style: TextStyle(
                height: 1.2,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
