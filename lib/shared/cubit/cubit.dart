import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/models/Social_models/postModel.dart';
import 'package:my_flutter_projects/shared/cubit/states.dart';
import 'package:my_flutter_projects/shared/network/local/cache_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/toDoApp_modules/archived_tasks/archived_tasks.dart';
import '../../modules/toDoApp_modules/done_tasks/done_tasks.dart';
import '../../modules/toDoApp_modules/new_tasks/new_tasks.dart';

class Homecubit extends Cubit<HomeStates>{



  Homecubit():super(HomeInitialState());

 static Homecubit get (context) {
   return BlocProvider.of(context);
 }

  bool isdark=false;

  void changethememode(){
      isdark=!isdark;
      CacheHelper.putBooleanData(key: 'isdark', value: isdark).then((value){
        emit(Changethememodestate());
      });

  }

  void changeStaringThemeMode(){
    if(CacheHelper.getBooleanData( key:'isdark')!=null)
    isdark= CacheHelper.getBooleanData( key:'isdark')!;
    else
      isdark=false;
  }



  List<Map> tasks =[]  ;
  List<Map> newtasks =[]  ;
  List<Map> done_tasks =[]  ;
  List<Map> archived_tasks =[]  ;
  bool isbottomsheetshown = false ;
  Database ? database;
  IconData myicon = Icons.edit;
  int current_index = 0;
  List<Widget> screens = [
    NewTasks() ,
    DoneTasks(),
    ArchivedTasks(),
  ] ;

  List<String> titles =
  [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ] ;


 void setNavigationButtomIndex(int index) {
   current_index=index;
   emit(ChangeNavigationButtomIndex());
 }

  void createDatabase (){

      openDatabase(
      'todo2.db',
      version: 1,
      onCreate: (database,version){
        print('database is created');
        database.execute('CREATE TABLE tasks (id INTEGER  PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT )').then((value) {
          print('table is created');
        }).catchError((e){print('Error when creating table $e'); });
      },
      onOpen:(database){
        print('database opened');
        getDataFromDatabase(database);

      },


    ).then((value){
      database=value ;
      emit(HomeCreateDatabaseState());
    });



  }


  Future insertToDatabase({
    required String title ,
    required String date ,
    required String time ,

  })async {
    return await database !.transaction(
            (txn) async{
          txn.rawInsert('INSERT INTO tasks (title,date,time,status) VALUES("$title","$date","$time","new")').then((value){
            print('$value inserted succcessfully');
            emit(HomeInsertTODatabaseState());

            getDataFromDatabase(database);

          }).catchError((e){print('$e error while inserting');});


        }


    )   ;

  }

  void getDataFromDatabase(database){
   newtasks=[];
   done_tasks=[];
   archived_tasks=[];

   database!.rawQuery("SELECT * FROM tasks").then((value){
     tasks =value ;
     print(tasks);

     tasks.forEach((element) {
       if(element['status']=='new')
         newtasks.add(element);
     else  if(element['status']=='done')
         done_tasks.add(element);
     else
       archived_tasks.add(element);

     });

     emit(HomeGetDatabaseState());

   });
  }

  void updateDtaBase ({required String status, required int id}){
    database!.rawUpdate(
        'UPDATE tasks SET status = ?  WHERE id = ?',
        ['$status', id ]).then((value){
          getDataFromDatabase(database);
         emit(UpdateData());
    });
  }

  void deleteDatabase({required int id}) {
   database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then(
           (value){
             getDataFromDatabase(database);
             //emit(DeleteData());
           });
  }

  void changeBottomsheetIcon({
  required bool ishow ,
  required IconData icon,
}){
     isbottomsheetshown = ishow;
     myicon=icon;
   emit(changeBottomsheetIconState());
  }






}
