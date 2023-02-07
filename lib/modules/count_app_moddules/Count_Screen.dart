import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/modules/count_app_moddules/cubit/cubit.dart';
import 'package:my_flutter_projects/modules/count_app_moddules/cubit/states.dart';
import 'package:my_flutter_projects/shared/components/components.dart';

class Count extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountCubit(),
      child: BlocConsumer<CountCubit,Countstates>(
        listener: (context, state) {
           // if(state is PlusState){print('PlusState ${state.v}');}
          //else  if(state is MinusState){print('MinusState${state.v}');}
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(
                  'Count' ,
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ) ,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: (){
                          CountCubit.get(context).setMinusState();
                        },
                        child: const Text(
                          'Minus',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 50,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '${CountCubit.get(context).x}',
                          style:TextStyle(
                            fontSize: 40,
                          ),

                        ),
                      ) ,
                      TextButton(
                        onPressed: (){
                        CountCubit.get(context).setPlusstate();

                        },
                        child: const Text(
                          'Plus',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 50,
                          ),
                        ),
                      )

                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height:50 ,
                    width: 160 ,
                    child: MaterialButton(
                      child: Text(
                        'initial number',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                        onPressed: (){
                          CountCubit.get(context).backtoinitialstate();
                        },
                      color: Colors.teal,

                      
                    ),
                  ),

                ],
              ),
            ),



          );
        }
      ),
    );
  }
}
