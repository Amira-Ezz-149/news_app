import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);
  // var list = NewsCubit().get(context).sports;
  @override
  Widget build(BuildContext context) {
    print('**************************************************');
    print(NewsCubit().sports.length);
    print('*****************************************************');
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) =>

      ///shorthand if (condition)
      state is! NewsGetSportsLoadingState
          ?

      ///shorthand if (if)
      ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticleItem(
                  NewsCubit
                      .get(context)
                      .sports[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: NewsCubit
              .get(context)
              .sports
              .length)
          :

      ///shorthand if (else)
      const Center(child: CircularProgressIndicator()),);
  }
}
