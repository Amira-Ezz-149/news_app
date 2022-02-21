// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:news_app/cubit/cubit.dart';
// import 'package:news_app/cubit/states.dart';
// import 'package:news_app/network/remote/dio_helper.dart';
// import 'package:news_app/shared/my_bloc_observer.dart';
// import 'modules/news_layout.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bloc/bloc.dart';
//
// void main() {
//   BlocOverrides.runZoned(
//         () {
//       // Use cubits...
//     },
//     blocObserver: MyBlocObserver(),
//   );
//   DioHelper.init();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context)=>NewsCubit(),
//       child: BlocConsumer<NewsCubit, NewsStates>(
//         listener: (context, state){},
//         builder: (context, state){
//
//           return MaterialApp(
//             title: 'Flutter Demo',
//
//             ///light theme
//             theme: ThemeData(
//               scaffoldBackgroundColor: Colors.white,
//               primarySwatch: Colors.deepOrange,
//
//               textTheme: TextTheme(
//                 bodyText1: TextStyle(
//                     fontWeight: FontWeight.w800, fontSize: 18, color: Colors.black),
//               ),
//
//               /// AppBarTheme
//               appBarTheme: const AppBarTheme(
//                 backgroundColor: Colors.white,
//                 elevation: 0.0,
//                 systemOverlayStyle: SystemUiOverlayStyle(
//                     statusBarColor: Colors.white,
//                     statusBarIconBrightness: Brightness.dark),
//                 titleTextStyle: TextStyle(
//                     color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
//                 iconTheme: IconThemeData(color: Colors.black),
//               ),
//
//               ///floatingActionButton
//               floatingActionButtonTheme: const FloatingActionButtonThemeData(
//                   backgroundColor: Colors.deepOrange),
//
//               ///BottomNavigationBarThemeData
//               bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//                 type: BottomNavigationBarType.fixed,
//                 selectedItemColor: Colors.deepOrange,
//                 elevation: 20.0,
//               ),
//             ),
//
//             ///dark theme
//             darkTheme: ThemeData(
//               scaffoldBackgroundColor: Color(0xff333333),
//               primarySwatch: Colors.deepOrange,
//
//               textTheme: TextTheme(
//                 bodyText1: TextStyle(
//                     fontWeight: FontWeight.w800, fontSize: 18, color: Colors.white),
//               ),
//               /// AppBarTheme
//               appBarTheme: const AppBarTheme(
//                 backgroundColor: Color(0xff333333),
//                 elevation: 0.0,
//                 systemOverlayStyle: SystemUiOverlayStyle(
//                     statusBarColor:Color(0xff333333),
//                     statusBarIconBrightness: Brightness.light),
//                 titleTextStyle: TextStyle(
//                     color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
//                 iconTheme: IconThemeData(color: Colors.white),
//               ),
//
//               ///floatingActionButton
//               floatingActionButtonTheme: const FloatingActionButtonThemeData(
//                   backgroundColor: Colors.deepOrange),
//
//               ///BottomNavigationBarThemeData
//               bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//                   type: BottomNavigationBarType.fixed,
//                   selectedItemColor: Colors.deepOrange,
//                   unselectedItemColor: Colors.grey,
//                   elevation: 20.0,
//                   backgroundColor: Color(0xff333333)
//               ),
//             ),
//
//             themeMode: NewsCubit.isDark ? ThemeMode.dark :ThemeMode.light,
//             home: const NewsLayout(),
//
//           );
//
//         },
//       ),
//     );
//   }
// }

///=================================================================================
// import 'dart:js';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:news_app/cubit/cubit.dart';
// import 'package:news_app/cubit/mode_cubit.dart';
// import 'package:news_app/cubit/states.dart';
// import 'package:news_app/network/remote/dio_helper.dart';
// import 'package:news_app/shared/my_bloc_observer.dart';
// import 'modules/news_layout.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bloc/bloc.dart';
// void main() async {
//   // بيتأكد ان كل حاجه ف الميثود خلصت الاول وبعدين بيفتح الأبليكيشن
//   WidgetsFlutterBinding.ensureInitialized();
//   // Bloc.observer = MyBlocObserver();
//   DioHelper.init();
//   // await CachHelper.init();
//   // bool ? isDark=CachHelper.getData(key: 'isDark');
//   runApp( MyApp(isDark: ModeCubit.get(context).isDark,));
// }
//
// class MyApp extends StatelessWidget {
//   final bool isDark;
//   const MyApp({required this.isDark});
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => ModeCubit()..changeAppMode(isDark: isDark),
//         ),
//         BlocProvider(create: (context)=>NewsCubit()
//           ..getBusiness()
//           ..getSports()
//           ..getScience()),
//
//       ],
//       child: BlocConsumer<ModeCubit, NewsStates>(
//         listener: (context, state) {},
//         builder: (BuildContext context, NewsStates state) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             themeMode: //ThemeMode.system
//             ModeCubit.get(context).isDark
//                 ? ThemeMode.dark
//                 : ThemeMode.light,
//             darkTheme: ThemeData(
//                 scaffoldBackgroundColor: Colors.black45,
//                 primarySwatch: Colors.deepOrange,
//                 appBarTheme: const AppBarTheme(
//                   titleSpacing: 20.0,
//                   systemOverlayStyle: SystemUiOverlayStyle(
//                       statusBarColor: Colors.black45,
//                       statusBarIconBrightness: Brightness.light),
//                   titleTextStyle: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold),
//                   backgroundColor: Colors.black45,
//                   iconTheme: IconThemeData(color: Colors.white),
//                   elevation: 0.0,
//                 ),
//                 bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//                     type: BottomNavigationBarType.fixed,
//                     selectedItemColor: Colors.deepOrange,
//                     elevation: 20.0,
//                     backgroundColor: Colors.black45,
//                     unselectedItemColor: Colors.grey),
//                 textTheme: const TextTheme(
//                     bodyText1: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white))),
//             theme: ThemeData(
//                 primarySwatch: Colors.deepOrange,
//                 scaffoldBackgroundColor: Colors.white,
//                 appBarTheme: const AppBarTheme(
//                   titleSpacing: 20.0,
//                   systemOverlayStyle: SystemUiOverlayStyle(
//                       statusBarColor: Colors.white,
//                       statusBarIconBrightness: Brightness.dark),
//                   titleTextStyle: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold),
//                   backgroundColor: Colors.white,
//                   iconTheme: IconThemeData(color: Colors.black),
//                   elevation: 0.0,
//                 ),
//                 bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//                     type: BottomNavigationBarType.fixed,
//                     selectedItemColor: Colors.deepOrange,
//                     elevation: 20.0),
//                 textTheme: const TextTheme(
//                     bodyText1: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black))),
//             home: const NewsLayout(),
//           );
//         },
//       ),
//     );
//   }
// }

///=============================== search screen
///====================================================================
/*
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
              // Expanded(child: buildArticleItem(list, context)),

              Expanded(
                child: articleBuilder(
                  list,
                  context,
                  isSearch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
*/
