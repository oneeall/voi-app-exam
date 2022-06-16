import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile_app/src/features/home/data/home_repository.dart';
import 'package:mobile_app/src/features/home/presentation/home_page.dart';
import 'package:mobile_app/src/features/home/presentation/view_model/home_view_model.dart';
import 'package:mobile_app/src/network/dio_provider.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // init
  ApiProvider.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final myAppScaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'myAppScaffoldKey');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          /// provided home view model and also fetch data
          ChangeNotifierProvider<HomeViewModel>(
            create: (_) => HomeViewModel(
              homeRepository: HomeRepository(),
            )..fetchQuotes(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
          ),
          home: const HomePage(),
        ));
  }
}
