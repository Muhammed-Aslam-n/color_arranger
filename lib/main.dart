import 'package:color_arranger/controller/getx_controller.dart';
import 'package:color_arranger/screens/Home.dart';
import 'package:color_arranger/screens/color_chart.dart';
import 'package:color_arranger/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ColorChangerController());
  runApp(const ColorChanger());
}

class ColorChanger extends StatelessWidget {
  const ColorChanger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
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
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const MyCustomSplashScreen()),
          GetPage(name: '/home', page: () => const Home()),
          GetPage(name: '/scoreScreen', page: () => Chart()),
        ],
      ),
      designSize: const Size(375, 812),
    );
  }
}
