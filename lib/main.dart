import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_flutter_projects/layout/news_app/news_cubit/cubit.dart';
import 'package:my_flutter_projects/layout/news_app/news_cubit/states.dart';
import 'package:my_flutter_projects/layout/news_app/news_layout.dart';
import 'package:my_flutter_projects/layout/shop_app/cubit/cubit.dart';
import 'package:my_flutter_projects/layout/social_app/Social_Layout.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/cubit.dart';
import 'package:my_flutter_projects/layout/todo_app/todo_layout.dart';
import 'package:my_flutter_projects/modules/native_code.dart';
import 'package:my_flutter_projects/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:my_flutter_projects/modules/shop_app/shop_Login/shoploginScreen.dart';
import 'package:my_flutter_projects/modules/social_app/socail_Login/social_Login_Screen.dart';
import 'package:my_flutter_projects/shared/bloc_observer.dart';
import 'package:my_flutter_projects/shared/components/constants.dart';
import 'package:my_flutter_projects/shared/cubit/cubit.dart';
import 'package:my_flutter_projects/shared/cubit/states.dart';
import 'package:my_flutter_projects/shared/network/local/cache_helper.dart';
import 'package:my_flutter_projects/shared/network/remote/dio_helper.dart';
import 'package:my_flutter_projects/shared/style/themes/themes.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'layout/shop_app/shop_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //if(Platform.isWindows)
  // await DesktopWindow.setMinWindowSize(
  //   Size(350, 650)
  // ) ;
 // await Firebase.initializeApp();
  Dio_helper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  Widget ? mywidget;
  bool seenboarding = CacheHelper.getData(key: 'boardingSeen') != null
      ? CacheHelper.getData(key: 'boardingSeen')
      : false;
  token = CacheHelper.getData(key: 'token');
  bool logined = token!= null ? true : false;


 uid= CacheHelper.getData(key: 'uid')  ;

  // if (seenboarding) {
  //   if (logined)
  //     mywidget = Shop_layout();
  //   else {
  //     mywidget = Shop_Login();
  //   }
  // }
  // else {
  //   mywidget = On_boarding();
  // }
 if(uid!=null)
   mywidget= Social_Layout();
 else
   mywidget= Social_Login();

 var t =DateTime.now();
 print(t.toString().substring(0,10));

  runApp(
      MyApp(mywidget)); //Myapp here calls 1- empty constructor 2-build method
}


class MyApp extends StatelessWidget {

  final Widget startWidget;

  MyApp(this.startWidget);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
              News_cubit()..getBusiness()
          ),
          BlocProvider(
              create: (context) =>
              Homecubit()
                ..changeStaringThemeMode()),
          BlocProvider(
                create: (context) => ShopLayoutCubit()..getHomeData()..getCategories()..getFavorites()..getProfile()
          ),
          BlocProvider(
              create: (context) => SocialCubit()..getUser()..getPosts()
          ),
        ],
        child: BlocConsumer<Homecubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              theme: lightthemeData,
              darkTheme: darkthemeData,
              themeMode: Homecubit
                  .get(context)
                  .isdark ? ThemeMode.dark : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              home: NewsLayout(),
            );
          },
        )

    );
  }


}



