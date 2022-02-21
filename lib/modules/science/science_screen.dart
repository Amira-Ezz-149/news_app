import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) =>

      ///short hand if (condition)
      state is! NewsGetScienceLoadingState
          ?

      ///short hand if (if)
      ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticleItem(
                  NewsCubit
                      .get(context)
                      .science[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: NewsCubit
              .get(context)
              .science
              .length)
          :

      ///short hand if (else)
      const Center(child: CircularProgressIndicator()),);
  }
}