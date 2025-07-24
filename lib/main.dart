import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/features/auth/cubit/auth_cubit.dart';
import 'package:weather/features/auth/data/firebase_auth_service.dart';
import 'package:weather/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:weather/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather/features/weather/presentation/screens/home_screen.dart';
import 'package:weather/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => WeatherCubit()..fetchWeather()),
            BlocProvider(create: (context) => AuthCubit(FirebaseAuthService())),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          ),
        );
      },
    );
  }
}
