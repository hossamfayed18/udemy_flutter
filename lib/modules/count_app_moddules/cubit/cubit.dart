import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/modules/count_app_moddules/cubit/states.dart';


class CountCubit extends Cubit<Countstates>
{

  int x=1;


  CountCubit():super(CountinitialState());




 // CountCubit(): super(CountinitialState());

static CountCubit get (context) => BlocProvider.of(context);


  void backtoinitialstate(){
    x=1;
    emit(CountinitialState()) ;

  }



  void setMinusState(){
       x--;
     emit(MinusState(x)) ;

   }

  void setPlusstate(){
     x++ ;
    emit(PlusState(x));
  }

}