import 'package:firebase_auth/firebase_auth.dart';
import 'package:gohouse/constants/app_theme.dart';
import 'package:gohouse/constants/strings.dart';
import 'package:gohouse/data/repository.dart';
import 'package:gohouse/di/components/service_locator.dart';
import 'package:gohouse/stores/jobs/jobs_store.dart';
import 'package:gohouse/stores/theme/theme_store.dart';
import 'package:gohouse/widgets/navigation_bar.dart';
import 'package:gohouse/ui/login/login.dart';
import 'package:gohouse/ui/splash/splash.dart';
import 'package:gohouse/utils/routemanager/application.dart';
import 'package:gohouse/utils/routes/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final ThemeStore _themeStore = ThemeStore(getIt<Repository>());
  final JobsStore _jobsStore = JobsStore(getIt<Repository>());

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(create: (_) => _themeStore),
        Provider<JobsStore>(create: (_) => _jobsStore),
      ],
      child: Observer(
        name: 'global-observer',
        builder: (context) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: Strings.appName,
              theme: _themeStore.darkMode
                  ? AppThemeData.darkThemeData
                  : AppThemeData.lightThemeData,
              onGenerateRoute: Application.router.generator,
              home: MainPage());
        },
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return HomeScreen();
        else
          return SplashScreen();
      },
    ));
  }
}
