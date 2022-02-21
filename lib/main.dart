import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/my_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
 await CacheHelper.init();
 bool? isDark = CacheHelper.getBooleanData(key: 'isDark');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getSports()..getScience()),
        BlocProvider( create: (context)=> NewsCubit(),)
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state){},
        builder: (context, state){

          return AdaptiveTheme(

            light: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.deepOrange,
              accentColor: Colors.amber,
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                    fontWeight: FontWeight.w800, fontSize: 18, color: Colors.black),
              ),

              /// AppBarTheme
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark),
                titleTextStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                iconTheme: IconThemeData(color: Colors.black),
              ),

              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 20.0,
              ),



            ),
            dark: ThemeData(

              brightness: Brightness.dark,
              primarySwatch: Colors.deepOrange,
              accentColor: Colors.amber,
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                    fontWeight: FontWeight.w800, fontSize: 18, color: Colors.white),
              ),
               appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xff333333),
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor:Color(0xff333333),
                statusBarIconBrightness: Brightness.light),
            titleTextStyle: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
            iconTheme: IconThemeData(color: Colors.white),
          ),

              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 20.0,
              ),
            ),
            initial: AdaptiveThemeMode.dark,
            builder: (theme, darkTheme) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: theme,
              darkTheme: darkTheme,
           //   themeMode: ThemeMode.light,
              home: const NewsLayout(),

            ),
          );

        },
      ),
    );
  }
}

///end ok================================================================
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

///===============================================================
/* ///light theme
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                primarySwatch: Colors.deepOrange,

                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 18, color: Colors.black),
                ),

                /// AppBarTheme
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  titleTextStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                  iconTheme: IconThemeData(color: Colors.black),
                ),

                ///floatingActionButton
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange),

                ///BottomNavigationBarThemeData
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 20.0,
                ),
              ),

              ///dark theme
              darkTheme: ThemeData(
                scaffoldBackgroundColor: Color(0xff333333),
                primarySwatch: Colors.deepOrange,

                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 18, color: Colors.white),
                ),
                /// AppBarTheme
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color(0xff333333),
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor:Color(0xff333333),
                      statusBarIconBrightness: Brightness.light),
                  titleTextStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                  iconTheme: IconThemeData(color: Colors.white),
                ),

                ///floatingActionButton
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange),

                ///BottomNavigationBarThemeData
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation: 20.0,
                    backgroundColor: Color(0xff333333)
                ),
              ),*/