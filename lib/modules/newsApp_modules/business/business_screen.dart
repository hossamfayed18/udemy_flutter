import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/news_app/news_cubit/cubit.dart';
import 'package:my_flutter_projects/layout/news_app/news_cubit/states.dart';
import 'package:my_flutter_projects/shared/components/components.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Business_screen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<News_cubit,NewsStates>(
        listener: (context,state){
        },
      builder: (context,state){
          var list= News_cubit.get(context).business;
         return ScreenTypeLayout(
           mobile: Builder(
               builder:(context) {
                 News_cubit.get(context).changeMobileOrDesktopMode(true);
                 return articlebuilder(list, context);
               }
           ),
           desktop: Builder(
             builder: (context){
               News_cubit.get(context).changeMobileOrDesktopMode(false);
             return Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Expanded(child: articlebuilder(list,context)),
                   if(list.length>0)
                     Expanded(child: Container(
                         padding: EdgeInsetsDirectional.all(20),
                         height: double.infinity,
                         color: Colors.grey[200],
                         child: Text(list[News_cubit.get(context).selectedItemIndex]['description']??'',style: TextStyle(fontSize: 20),)
                     ),
                     ),

                 ],
               ) ;
             },
           ),
           breakpoints: ScreenBreakpoints(
             desktop: 600 ,
             tablet: 300,
             watch: 300,
           ),
         );


      },

    );
  }
}



