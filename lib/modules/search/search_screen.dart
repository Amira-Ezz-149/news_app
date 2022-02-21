import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
var list = NewsCubit.get(context).searchList;

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: ( context,  state) {},
      builder: ( context,  state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    onChanged: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    validate: (value) {
                      if (value.isEmpty || value == null) {
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    label: 'search',
                    prefix: Icons.search),
              ),
              Expanded(child: buildArticleItem(list, context)),
            ],
          ),
        );
      },
    );
  }
}
