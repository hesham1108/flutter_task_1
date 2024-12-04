import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_task/core/theme/app_theme.dart';
import 'package:flutter_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_task/features/home/presentation/screens/graph_screen.dart';
import 'package:flutter_task/features/home/presentation/screens/metrics_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/home/presentation/widgets/adaptive_navbar.dart';
import 'core/di/dependancy_injection.dart';
import 'core/helpers/bloc_observer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await ScreenUtil.ensureScreenSize();
  await setupGetIt();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Task',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: BlocProvider(
          create: (context) => getIt<HomeCubit>()..loadOrders(),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<Widget> _screens = [
    MetricsScreen(),
    GraphScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var homeCubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return AdaptiveNavbar(
          selectedIndex: homeCubit.currentIndex,
          onDestinationSelected: (index) {
            homeCubit.navigateToDetails(index);
          },
          items: const <TabItem<Widget>>[
            TabItem(icon: Icon(Icons.analytics_outlined), title: "Metrics"),
            TabItem(
              icon: Icon(Icons.show_chart_outlined),
              title: 'Graph',
            ),
          ],
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.analytics_outlined, size: 30.h),
              selectedIcon: Icon(
                Icons.analytics_outlined,
                size: 30.h,
                color: Theme.of(context).colorScheme.secondary,
              ),
              label: 'Metrics',
            ),
            NavigationDestination(
              icon: Icon(Icons.show_chart_outlined, size: 30.h),
              selectedIcon: Icon(
                Icons.show_chart,
                size: 30.h,
                color: Theme.of(context).colorScheme.secondary,
              ),
              label: 'Graph',
            ),
          ],
          body: _screens[homeCubit.currentIndex],
        );
      },
    );
  }
}
