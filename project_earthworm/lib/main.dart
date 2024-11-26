import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_earthworm/farmer/farmerdashboard.dart';
import 'package:provider/provider.dart';
import 'services/auth_service.dart';
import 'package:project_earthworm/buyer/buyer_home.dart';
import 'package:project_earthworm/farmer/farmer_home.dart';
import 'package:project_earthworm/sign-in-up-screeens/login_page.dart';
import 'package:project_earthworm/sign-in-up-screeens/signup_page.dart';
import 'package:project_earthworm/sign-in-up-screeens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Earthworm',
        theme: ThemeData(
          primaryColor: Color(0xFF4CAF50),
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF4CAF50)),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/signin': (context) => LoginPage(),
          '/signup': (context) => SignUpPage(),
          '/farmer/home': (context) => FarmerHome(),
          '/buyer/home': (context) => BuyerHome(),
          '/dashboard' : (context) => OnboardingScreen()
        },
      ),
    );
  }
}
