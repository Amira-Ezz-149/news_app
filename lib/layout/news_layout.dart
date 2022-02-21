import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/components.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    navigateTo(
                        context: context, widget: SearchScreen());
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.brightness_4_outlined),
                  onPressed: () {
                    debugPrint("app mode changed");
                    // NewsCubit.get(context).changeAppMode();
                    // ModeCubit.get(context).changeAppMode();
                    AdaptiveTheme.of(context).toggleThemeMode();
                    // cubit.changeAppMode(context: context);
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItems,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
