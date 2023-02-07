import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/cubit.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/states.dart';
import 'package:my_flutter_projects/shared/components/components.dart';
import 'package:my_flutter_projects/shared/style/icon_broken.dart';

class New_Post_Screen extends StatelessWidget {
 var textController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener:(context,state) {

      },
      builder:(context,state){
      return Scaffold(
          appBar: defualtAppBar(
            context: context,
            title: 'Create Post',
            actions: [
              TextButton(
                onPressed: (){
                  if(SocialCubit.get(context).postImage==null)
                  SocialCubit.get(context).createPost(text: textController.text);
                  else
                    SocialCubit.get(context).createPostwithPhoto(text: textController.text);
                },
                child: Text('POST'),
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsetsDirectional.all(20),
            child: Column(
              children: [
                if(state is SocialLoadingCreatePostState)
                LinearProgressIndicator(),
                SizedBox(width: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: ExtendedNetworkImageProvider(
                          'https://img.freepik.com/free-photo/close-up-attractive-carefree-young-woman-sitting-floor_273609-34868.jpg?w=360&t=st=1670727767~exp=1670728367~hmac=6e59f18d7f7c756ea19aef2449c6105b768f95c16a40232254f7fbf9f9e838e2'
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Hossam Mohamed',
                      style: TextStyle(
                        height: 1.2,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: 'What is on your mind ...',
                      border:InputBorder.none ,
                    ),
                    controller: textController,
                  ),
                ),
                SizedBox(height: 10),
                if(SocialCubit.get(context).postImage!=null)
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        image:DecorationImage(image:FileImage(SocialCubit.get(context).postImage!), fit: BoxFit.cover, ),
                        borderRadius: BorderRadius.zero,
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
                            SocialCubit.get(context).closePostImage();
                          },
                          icon: Icon(
                            Icons.close,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed:(){
                          SocialCubit.get(context).getPostImage();
                        } ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              IconBroken.Image,
                            ),
                            SizedBox(width: 5,),
                            Text('add photo')
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed:(){

                        } ,
                        child: Text(
                            '# tags'
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),


        );
      } ,
    );
  }
}
