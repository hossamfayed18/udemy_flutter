import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/modules/toDoApp_modules/archived_tasks/archived_tasks.dart';
import 'package:my_flutter_projects/modules/toDoApp_modules/done_tasks/done_tasks.dart';
import 'package:my_flutter_projects/modules/toDoApp_modules/new_tasks/new_tasks.dart';
import 'package:my_flutter_projects/shared/components/components.dart';
import 'package:my_flutter_projects/shared/cubit/cubit.dart';
import 'package:my_flutter_projects/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../../shared/components/constants.dart';

class HomeLayout extends StatelessWidget {


  TextEditingController titlecontroller = TextEditingController();

  TextEditingController datecontroller = TextEditingController();

  TextEditingController timecontroller = TextEditingController();

  var mykey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      Homecubit()
        ..createDatabase(),
      child: BlocConsumer<Homecubit, HomeStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          Homecubit cubit = Homecubit.get(context);
          return Scaffold(
            key: mykey,
            appBar: AppBar(
              title: Center(
                child: Text(
                  cubit.titles[cubit.current_index],
                ),

              ),
            ),
            body: ConditionalBuilder(
              condition: true, //cubit.tasks.length> 0
              builder: (context) => cubit.screens[cubit.current_index],
              fallback: (context) => const Center(child: CircularProgressIndicator()),

            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isbottomsheetshown) {
                  if (formkey.currentState!.validate()) {
                    cubit.insertToDatabase(
                      title: titlecontroller.text,
                      date: datecontroller.text,
                      time: timecontroller.text,
                    ).then((value) {
                      Navigator.pop(context);
                    });
                  }
                }
                else {
                  mykey.currentState!.showBottomSheet((context) {
                    return SingleChildScrollView(
                      child: Container(
                        color: Colors.grey[200],
                        padding: EdgeInsetsDirectional.all(20),
                        child: Form(
                          key: formkey,
                          child: Column(

                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultTFF(
                                mycontroller: titlecontroller,
                                mykeyboardType: TextInputType.text,
                                text: 'enter the title',
                                myprefixIcon: Icons.title,
                                validatorfunction: (value) {
                                  if (value!.isEmpty) {
                                    return 'title must not be empty';
                                  }
                                  else
                                    return null;
                                },
                              ),
                              SizedBox(height: 20,),


                              defaultTFF(
                                  mycontroller: timecontroller,
                                  mykeyboardType: TextInputType.datetime,
                                  text: 'enter the task time',
                                  myprefixIcon: Icons.watch_later,
                                  validatorfunction: (value) {
                                    if (value!.isEmpty) {
                                      return 'time must not be empty';
                                    }
                                    else
                                      return null;
                                  },

                                  ontapfun: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),

                                    ).then(
                                            (value) {
                                          timecontroller.text =
                                              value!.format(context);
                                        }
                                    );
                                  }
                              ),

                              SizedBox(height: 20,),


                              defaultTFF(
                                  mycontroller: datecontroller,
                                  mykeyboardType: TextInputType.datetime,
                                  text: 'enter the task date',
                                  myprefixIcon: Icons.calendar_month,
                                  validatorfunction: (value) {
                                    if (value!.isEmpty) {
                                      return 'date must not be empty';
                                    }
                                    else
                                      return null;
                                  },

                                  ontapfun: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2022-11-30'),
                                    ).then((value) {
                                      datecontroller.text =
                                          DateFormat.yMMMd().format(value!);
                                      print(DateFormat.yMMMd().format(value));
                                    });
                                  }
                              ),


                            ],
                          ),
                        ),
                      ),
                    );
                  }).closed.then((value) {
                    cubit.changeBottomsheetIcon(
                      ishow: false,
                      icon: Icons.edit,
                    );
                  });

                  cubit.changeBottomsheetIcon(
                    ishow: true,
                    icon: Icons.add,
                  );
                }
              },


              child: Icon(
                cubit.myicon,
              ),

            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,

              onTap: (index) {
                cubit.setNavigationButtomIndex(index);
              },
              elevation: 50,
              currentIndex: cubit.current_index,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu,
                    ),
                    label: 'Tasks'

                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline),
                    label: 'Done'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archived',
                ),

              ],
            ),
          );
        },
      ),
    );
  }


}













