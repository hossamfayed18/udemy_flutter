import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/news_app/news_cubit/states.dart';
import 'package:my_flutter_projects/modules/newsApp_modules/business/business_screen.dart';
import 'package:my_flutter_projects/modules/newsApp_modules/science/science_screen.dart';
import 'package:my_flutter_projects/modules/newsApp_modules/sports/sports_screen.dart';
import 'package:my_flutter_projects/shared/cubit/states.dart';
import 'package:my_flutter_projects/shared/network/remote/dio_helper.dart';

class News_cubit extends Cubit<NewsStates>{
  News_cubit() : super(NewsINitialstate());

 static News_cubit get (context){
    return BlocProvider.of(context);
  }


  List<BottomNavigationBarItem> bottom_items = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business_sharp,
        ),
        label: 'Business'

    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sports'

    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Science',

    ),

  ];

 int current_index=0;



 List<Widget> screens=[
Business_screen(),
 Sports_screen(),
 Science_screen(),

  ];


 void changeBottomNavItemstate(index){
   current_index=index;
   emit(ChangeBottomNavItemstate());
   if(index==1)
     getSports();
   else if(index==2)
     getScience();
 }

 List<dynamic> business =[];
  List<dynamic> sports =[];
  List<dynamic> science =[];
  List<dynamic> search =[];


bool ismobile = false ;
int selectedItemIndex= 0 ;


void selectNewsItem(int index){
  selectedItemIndex = index;
  emit(selectNewsItemState());
}


void changeMobileOrDesktopMode(bool value){
  ismobile = value ;
  emit(changeMobileOrDesktopModeState());
}

void getBusiness(){
//emit(NewsGetBusinessLoadingState());
  Dio_helper.getData(

      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'business',
        'apiKey':'efbfcaa742954698a9fd2b1e1ce96982',
      }
  ).then((value){
    business=value.data['articles'];
    print(business[0]['title']);
    emit(NewsGetBusinessSuccessState());
    //print(value.data.toString());
  }).catchError(
          (error){
        print('error');
        print(error.toString());
        emit(NewsGetBusinessErrorState(error: error));
      });

}

  void getSports(){
  if(sports.length==0)
    {
      emit(NewsGetSportsLoadingState());
      Dio_helper.getData(

          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'sports',
            'apiKey':'efbfcaa742954698a9fd2b1e1ce96982',
          }
      ).then((value){
        sports=value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
        //print(value.data.toString());
      }).catchError(
              (error){
            print('error');
            print(error.toString());
            emit(NewsGetSportsErrorState(error: error));
          });
    }


  }

  void getScience() {
    if (science.length == 0) {
      emit(NewsGetScienceLoadingState());
      Dio_helper.getData(

          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'science',
            'apiKey': 'efbfcaa742954698a9fd2b1e1ce96982',
          }
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
        //print(value.data.toString());
      }).catchError(
              (error) {
            print('error');
            print(error.toString());
            emit(NewsGetScienceErrorState(error: error));
          });
    }
  }
  void getSearchData(value){
  emit(NewsGetSearchLoadingState());
      Dio_helper.getData(
          url: 'v2/everything',
          query: {
            'q':'$value',
            'apiKey':'efbfcaa742954698a9fd2b1e1ce96982',
          }
      ).then((value){
        search=value.data['articles'];
       // print(science[0]['title']);
        emit(NewsGetSearchSuccessState());
        //print(value.data.toString());
      }).catchError(
              (error){
            print('error');
            print(error.toString());
            emit(NewsGetSearchErrorState(error: error));
          });
    }







  }




