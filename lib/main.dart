import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protobuddy/auth/login/screen/login.dart';
import 'package:protobuddy/auth/register/screen/register.dart';
import 'package:protobuddy/database/firebase_options.dart';
import 'package:protobuddy/pages/buyandsale/buylist.dart';
import 'package:protobuddy/pages/buyandsale/postsell.dart';
import 'package:protobuddy/pages/homepage.dart';
import 'package:protobuddy/pages/portfolio/create_portfolio.dart';
import 'package:protobuddy/pages/profile_page.dart';
import 'package:protobuddy/pages/startpage.dart';
 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      designSize: const Size(390, 844),
      minTextAdapt: false, // Set minTextAdapt to false initially
      builder: (context, child) {
        ScreenUtil.init(context); // Initialize ScreenUtil here
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Protobuddy',
          theme: ThemeData(
            useMaterial3: false,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/homepage': (context) => const HomePage(),
            '/login': (context) => const UserLogin(),
            '/register': (context) => const UserRegister(),
            '/create': (context) => const create_protfolio(),
            '/buy': (context) => const BuyList(),
            '/sell': (context) => const PostSell(),
            '/profile': (context) => const Profile(),
          },
        );
      },
    );
  }
}
