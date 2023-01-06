import 'package:cryptotracker/constants/Themes.dart';
import 'package:cryptotracker/models/local_storage.dart';
import 'package:cryptotracker/pages/home_page.dart';
import 'package:cryptotracker/providers/market_provider.dart';
import 'package:cryptotracker/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String currentTheme = await localStorage.getTheme();
  runApp(MyApp(
    theme: currentTheme,
  ));
}

class MyApp extends StatelessWidget {
  final String theme;

  const MyApp({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MarketProvider>(
          create: (context) => MarketProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(theme),
        ),
      ],
      child: Consumer<ThemeProvider>(builder: (contex, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: lightTheme,
          darkTheme: darhTheme,
          home: const HomePage(),
        );
      }),
    );
  }
}
