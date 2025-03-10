import 'package:cubex_mobile_dev_task/src/global_export.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CountriesListBloc()),
        BlocProvider(create: (_) => CountryDetailBloc()),
        BlocProvider(create: (_) => DotIndicatorCubit()),
        BlocProvider(create: (_) => SearchkeyCubit()),
      ],
      child: CBApp()
    )
  );
}


class CBApp extends StatelessWidget {
  const CBApp({super.key});

  @override
  Widget build(context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(0.83),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: CBThemeData.darkTheme,
        theme: CBThemeData.lightTheme,
        home: const CBHomeScreen(),
      ),
    );
  }
}