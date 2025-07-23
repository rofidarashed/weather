import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather/features/weather/presentation/cubit/weather_state.dart';
import 'package:weather/features/weather/presentation/widgets/build_chart_section.dart';
import 'package:weather/features/weather/presentation/widgets/build_error_state.dart';
import 'package:weather/features/weather/presentation/widgets/build_forecast_section.dart';
import 'package:weather/features/weather/presentation/widgets/build_loading_state.dart';
import 'package:weather/features/weather/presentation/widgets/current_weather_card.dart';
import 'package:weather/features/weather/presentation/widgets/header_section.dart';

class HomeScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  final displayName = FirebaseAuth.instance.currentUser?.displayName
      ?.split(" ")
      .first;
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.indigo[500]!,
              const Color.fromARGB(255, 4, 17, 92),
              const Color.fromARGB(255, 0, 6, 35),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.0, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(20.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildHeaderSection(displayName: displayName),
                  SizedBox(height: 20.h),

                  BlocBuilder<WeatherCubit, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherLoading) {
                        return buildLoadingState(context);
                      } else if (state is WeatherLoaded) {
                        return Column(
                          children: [
                            BuildCurrentWeatherCard(state: state),
                            SizedBox(height: 20.h),
                            buildForecastSection(state),
                            SizedBox(height: 20.h),
                            buildChartSection(state),
                          ],
                        );
                      } else if (state is WeatherError) {
                        return buildErrorState(state.message);
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
