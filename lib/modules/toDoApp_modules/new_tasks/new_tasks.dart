import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/shared/components/constants.dart';
import 'package:my_flutter_projects/shared/cubit/cubit.dart';
import 'package:my_flutter_projects/shared/cubit/states.dart';

import '../../../shared/components/components.dart';

class NewTasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Homecubit,HomeStates>(
        listener: (context, state) {
        },

         builder: (context, state) {
          var newtasks  = Homecubit.get(context).newtasks;
           return  taskbuilder(tasks: newtasks);


         },

    );

  }
}
