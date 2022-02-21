import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

//state is! NewsGetBusinessLoadingState
  //const CircularProgressIndicator()
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) =>

            ///shorthand if (condition)
            state is! NewsGetBusinessLoadingState
                ?

                ///shorthand if (if)
                ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildArticleItem(
                        NewsCubit.get(context).business[index], context),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: NewsCubit.get(context).business.length)
                :

                ///shorthand if (else)
                const Center(child: CircularProgressIndicator()),);
  }
}
