import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/cubit.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/states.dart';
import 'package:my_flutter_projects/models/Social_models/postModel.dart';
import 'package:my_flutter_projects/shared/style/colors.dart';
import 'package:my_flutter_projects/shared/style/icon_broken.dart';

class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
        listener: (context,state){

        } ,
      builder:(context,state){
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: const EdgeInsets.all(10),
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      Image(
                        image: ExtendedNetworkImageProvider(
                            'https://img.freepik.com/free-photo/close-up-attractive-carefree-young-woman-sitting-floor_273609-35532.jpg?w=826&t=st=1670725530~exp=1670726130~hmac=d7e373dce8af1b326be8e74dca0acce2b87f928222b434763455a17347b1078f'
                        ),
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Communicate with friends',
                          style:Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ConditionalBuilder(
                  condition:state is! SocialLoadingGetPostsState && SocialCubit.get(context).posts.length>0 && SocialCubit.get(context).likesNumber.length>0&& SocialCubit.get(context).commentsNumber.length>0,
                    fallback: (BuildContext context) {
                    return Container() ;
                    },
                  builder: (context){
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index)=>buildPostItem(SocialCubit.get(context).posts[index],context,index),
                      separatorBuilder: (context,index)=> SizedBox( height:8 ),
                      itemCount: SocialCubit.get(context).posts.length,
                    );
                  }
                ) ,
                SizedBox(height: 8,),
              ],
            ),
          );
      } ,
    );


  }

  Widget buildPostItem(PostModel model,context,index){
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding:  EdgeInsetsDirectional.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: ExtendedNetworkImageProvider(
                    model.image!
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            model.name!,
                            style: TextStyle(
                              height: 1.2,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Icon(
                            Icons.check_circle,
                            color: defaultcolor,
                            size: 16,
                          ),
                        ],
                      ),
                      Text(
                          model.dateTime!,
                          style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey,)
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.more_horiz ,
                    size: 15,
                  ) ,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            Text(
              model.text!,
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
            if(model.postImage!="")
            Padding(
              padding:const EdgeInsetsDirectional.only(
                top: 10,
              ),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExtendedNetworkImageProvider(
                         model.postImage!,
                  ),

                ),
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){

                    },
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Heart,
                          color: Colors.red,
                          size: 16,

                        ),
                        SizedBox(width: 5,),
                        Text(
                          '${SocialCubit.get(context).likesNumber[index]}',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: (){

                    },
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Chat,
                          color: Colors.amber,
                          size: 16,
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '${SocialCubit.get(context).commentsNumber[index]} Comments',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  bottom: 10
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: (){
                    SocialCubit.get(context).commentInPost(SocialCubit.get(context).postsID[index]);
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: ExtendedNetworkImageProvider(
                          SocialCubit.get(context).userModel!.image!,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        'Write a comment ...',
                        style: Theme.of(context).textTheme.caption!.copyWith(

                        ),

                      ),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                   SocialCubit.get(context).likePost(SocialCubit.get(context).postsID[index]);
                  },
                  child: Row(
                    children: [
                      Icon(
                        IconBroken.Heart,
                        color: Colors.red,
                        size: 16,

                      ),
                      SizedBox(width: 5,),
                      Text(
                        'Like',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),






          ],
        ),
      ),

    );
  }

}
