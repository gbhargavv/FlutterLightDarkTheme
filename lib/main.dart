import 'package:flutter/material.dart';
import 'package:flutter_light_dark_theme/app_theme.dart';
import 'package:flutter_light_dark_theme/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppTheme()..fetchTheme()),
        ],
        child: Consumer<AppTheme>(builder: (context, value, child) {
          return MaterialApp(
            theme: value.appTheme,
            home: HomePage(),
            debugShowCheckedModeBanner: false,
          );
        }));
  }
}
