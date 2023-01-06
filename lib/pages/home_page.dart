import 'package:cryptotracker/pages/markets.dart';
import 'package:cryptotracker/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController viewController;

  @override
  void initState() {
    viewController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome Back",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: (themeProvider.themeMode == ThemeMode.light)
                  ? Colors.black
                  : Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.toogleTheme();
            },
            padding:
                const EdgeInsets.only(left: 0, bottom: 0, right: 25, top: 5),
            iconSize: 30,
            icon: (themeProvider.themeMode == ThemeMode.light)
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding:
              const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Crypto Today",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // const Markets(),
              TabBar(
                controller: viewController,
                tabs: [
                  Tab(
                      child: Text(
                    "Markets",
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
                  Tab(
                    child: Text(
                      "Favorites",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    controller: viewController,
                    children: const [Markets(), Favorites()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
