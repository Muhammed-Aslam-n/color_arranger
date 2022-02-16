import 'package:color_arranger/screens/Home.dart';
import 'package:color_arranger/screens/color_chart.dart';
import 'package:color_arranger/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ColorChanger());
}

class ColorChanger extends StatelessWidget {
  const ColorChanger({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(data: MediaQuery.of(context), child: widget!);
        },
        title: 'Color Changer',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const MyCustomSplashScreen(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => const Home(),
          '/scoreScreen': (context) => Chart(),
        },
      ),
      designSize: const Size(375, 812),
    );
  }
}
