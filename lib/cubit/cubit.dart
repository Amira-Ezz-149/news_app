import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),

  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),

  ];

  List<String> titles = ['Business', 'Sports', 'Science',];

  void changeBottomNavBar(int index) {
    if (index == 1) getSports();
    if (index == 2) getScience();
    currentIndex = index;
    emit(NewsBottomNavState());
  }



  ///business
  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apikey': 'eaabb01e26bc4385bacea5b5e33f06e0',
    }).then((value) {
      // debugPrint(value.data['articles'][0]['title']);
      business = value.data['articles'];
      debugPrint(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }


  ///sports
  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());

    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apikey': 'eaabb01e26bc4385bacea5b5e33f06e0',
      }).then((value) {
        // debugPrint(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        debugPrint(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        debugPrint(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else
      emit(NewsGetSportsSuccessState());
  }


  ///science
  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apikey': 'eaabb01e26bc4385bacea5b5e33f06e0',
      }).then((value) {
        // debugPrint(value.data['articles'][0]['title']);
        science = value.data['articles'];
        debugPrint(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        debugPrint(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else
      emit(NewsGetScienceSuccessState());
  }



  ///search
  List<dynamic> searchList = [];
  void getSearch(String value) {

    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': value,
      'apikey': 'eaabb01e26bc4385bacea5b5e33f06e0',
    }).then((value) {
      // debugPrint(value.data['articles'][0]['title']);
      searchList = value.data['articles'];
      debugPrint(searchList[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }



  // var imgVariable = NetworkImage("https://th.bing.com/th/id/R.0e6dd5b2fb2a9f8b1a694f322ae9b5a4?rik=8dz0jEx2rxzLaA&riu=http%3a%2f%2ffiles.maas1.com%2fimages_cache%2f130326130347S6oJ.jpg&ehk=hn9Yp81s7r2XZimuNgQj%2ft2KKghRk2Z%2f1Piw6PYiZic%3d&risl=&pid=ImgRaw&r=0");
  var imgVariable = AssetImage("assets/images/diamond.webp");


  ///theme mode
 static bool isDark = true;
void changeAppMode({context, bool? fromShared}){

  if(fromShared != null){
    isDark = fromShared;
    emit(NewsChangeModeState());

  }  else {
    isDark = !isDark;
    AdaptiveTheme.of(context).toggleThemeMode();
    CacheHelper.putBooleanData(key: 'isDark', value: isDark).then((value) {

    });
  }

}

}
