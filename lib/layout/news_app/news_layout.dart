import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/news_app/news_cubit/states.dart';
import 'package:my_flutter_projects/modules/newsApp_modules/search/search.dart';
import 'package:my_flutter_projects/shared/cubit/cubit.dart';
import 'package:my_flutter_projects/shared/network/remote/dio_helper.dart';

import '../../shared/components/components.dart';
import 'news_cubit/cubit.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


      return BlocConsumer<News_cubit,NewsStates>(
        listener: (context,state){

        },
        builder: (context,state){
          var cubit = News_cubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'News App',

              ),
              actions: [
                IconButton(
                    onPressed:(){
                     navigatorTo(context,Search()) ;
                    },
                    icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed:(){
                    Homecubit.get(context).changethememode();
                  },
                  icon: Icon(Icons.brightness_4_outlined),
                ),
              ],

            ),
            bottomNavigationBar: BottomNavigationBar(
                items: cubit.bottom_items,
              currentIndex: cubit.current_index,
              onTap: (index){
                  cubit.changeBottomNavItemstate(index);
              },
            ),
            body: cubit.screens[cubit.current_index],
          );
        },

      ) ;


  }
}

