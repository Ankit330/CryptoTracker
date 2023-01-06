import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cryptocurrenct.dart';
import '../providers/market_provider.dart';
import 'cryptoListTile.dart';

class Markets extends StatefulWidget {
  const Markets({super.key});

  @override
  State<Markets> createState() => _MarketsState();
}

class _MarketsState extends State<Markets> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MarketProvider>(builder: (context, marketProvider, child) {
      if (marketProvider.isloading == true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        if (marketProvider.markets.isNotEmpty) {
          marketProvider.isCalled = false;
          return RefreshIndicator(
            onRefresh: () => marketProvider.fetchData(),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: marketProvider.markets.length,
              itemBuilder: ((context, index) {
                CryptoCurrency currentCrypto = marketProvider.markets[index];
                return Container(
                    padding: const EdgeInsets.all(3.5),
                    child: CryptoListTile(currentCrypto: currentCrypto));
              }),
            ),
          );
        } else {
          return const Center(
            child: Text("Something went wrong"),
          );
        }
      }
    });
  }
}
