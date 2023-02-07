import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';

class ArchivedTasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Homecubit,HomeStates>(
      listener: (context, state) {
      },

      builder: (context, state) {
        var ar_tasks = Homecubit
            .get(context)
            .archived_tasks;
        return taskbuilder(tasks: ar_tasks);
      }
    );

  }
}