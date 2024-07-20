// import 'package:flutter/material.dart';
// import 'package:moral_mentor/pages/home.dart';
// import 'package:moral_mentor/pages/scenario.dart';
// import 'package:moral_mentor/pages/profile.dart';
// import 'package:go_router/go_router.dart';

// void main() {
//   runApp(MyApp());
//   // runApp(MaterialApp(
//   //   home: QuizDashboard(
//   //     quizResults: {
//   //       'Correct': 75,
//   //       'Incorrect': 25,
//   //     },
//   //     userResponses: [1, 0, 1, 1, 0],
//   //     idealResponses: [1, 1, 1, 0, 0],
//   //   ),
//   // ));
// }

// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   final GoRouter _router = GoRouter(
//     initialLocation: '/',
//     routes: [
//       GoRoute(
//         path: '/',
//         pageBuilder: (context, state) => CustomTransitionPage(
//           key: state.pageKey,
//           child: const HomePage(),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return FadeTransition(opacity: animation, child: child);
//           },
//         ),
//       ),
//       GoRoute(
//         path: '/scenario',
//         pageBuilder: (context, state) => CustomTransitionPage(
//           key: state.pageKey,
//           child: const ScenarioPage(),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return SlideTransition(
//               position: Tween<Offset>(
//                 begin: const Offset(1, 0),
//                 end: Offset.zero,
//               ).animate(animation),
//               child: child,
//             );
//           },
//         ),
//       ),
//       GoRoute(
//         path: '/profile',
//         pageBuilder: (context, state) => CustomTransitionPage(
//           key: state.pageKey,
//           child: const ProfilePage(),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return SlideTransition(
//               position: Tween<Offset>(
//                 begin: const Offset(0, 1),
//                 end: Offset.zero,
//               ).animate(animation),
//               child: child,
//             );
//           },
//         ),
//       ),
//     ],
//   );

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'MoralMentor',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         fontFamily: 'Roboto',
//         textTheme: const TextTheme(
//           headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//           headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
//           bodyLarge: TextStyle(fontSize: 16, height: 1.5),
//         ),
//       ),
//       routerDelegate: _router.routerDelegate,
//       routeInformationParser: _router.routeInformationParser,
//       routeInformationProvider: _router.routeInformationProvider,
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moral_mentor/pages/home.dart';
import 'package:moral_mentor/pages/scenario.dart';
import 'package:moral_mentor/pages/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      _createRoute('/', const HomePage(), _fadeTransition),
      _createRoute('/scenario', const ScenarioPage(), _slideTransition),
      _createRoute('/profile', const ProfilePage(), _slideTransition),
    ],
  );

  static GoRoute _createRoute(String path, Widget child, Widget Function(BuildContext, Animation<double>, Animation<double>, Widget) transitionsBuilder) {
    return GoRoute(
      path: path,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: transitionsBuilder,
      ),
    );
  }

  static Widget _fadeTransition(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }

  static Widget _slideTransition(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MoralMentor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
      routerConfig: _router,
    );
  }
}
