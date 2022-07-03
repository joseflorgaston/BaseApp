import 'package:base_app/blocs/navigation_bloc.dart';
import 'package:base_app/pages/error.dart';
import 'package:base_app/pages/example.dart';
import 'package:base_app/utilities/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorPage(
      errorDetails: details,
    );
  };
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return bloc.MultiBlocProvider(
      providers: [
        bloc.BlocProvider(create: (context) => NavigationBloc()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('es', ''), // Spanish, no country code
        ],
        locale: AppLocalizations.supportedLocales[0],
        darkTheme: Themes.dark,
        theme: Themes.light,
        themeMode: ThemeService().theme,
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Get.to(
                  () => const ExamplePage(),
                  transition: Transition.circularReveal,
                  duration: const Duration(milliseconds: 550),
                );
              },
              child: Text(
                AppLocalizations.of(context)!.helloWorld,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
