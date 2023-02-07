import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/models/shop_models/searchModel.dart';
import 'package:my_flutter_projects/modules/shop_app/search/cubit/states.dart';
import 'package:my_flutter_projects/shared/components/constants.dart';
import 'package:my_flutter_projects/shared/network/end_points.dart';
import 'package:my_flutter_projects/shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit(): super(SearchInitialState());


 static SearchCubit get(context){
    return BlocProvider.of(context);
  }

  SearchModel ? searchmodel ;
void search (String text){
emit(SearchLoadingState());

Dio_helper.postData(
    url: SEARCH,
    data: {
      "text": text ,
    },
  token: token,
).then((value){
  searchmodel = SearchModel.fromJson(value.data) ;
  emit(SearchSuccessState());
}).catchError((error){
  print(error);
  emit(SearchErrorState());
});

}


}