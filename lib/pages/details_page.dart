// ignore_for_file: unused_local_variable, avoid_unnecessary_containers

import 'package:cryptotracker/models/cryptocurrenct.dart';
import 'package:cryptotracker/pages/graph_details.dart';
import 'package:cryptotracker/providers/market_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Dashboard",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Consumer<MarketProvider>(
            builder: (context, markerProvider, child) {
              CryptoCurrency currentCrypto =
                  markerProvider.fetchCryptoById(widget.id);

              String image = currentCrypto.image!;
              return RefreshIndicator(
                onRefresh: () {
                  return markerProvider.fetchGraphData(widget.id);
                },
                child: ListView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  padding: const EdgeInsets.only(left: 20),
                  children: [
                    HeadDetial(image, currentCrypto),
                    const SizedBox(height: 20),
                    GraphDetails(id: widget.id, currentCrypto: currentCrypto),
                    const Center(
                      child: Text(
                        "7 Days",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 8.0),
                      child: Text(
                        "Statistics",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "₹${currentCrypto.low24h}",
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(),
                        Text(
                          "₹${currentCrypto.high24h}",
                          style: const TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "Today's Low",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(),
                        Text(
                          "Today's High",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "No. #${currentCrypto.marketCapRank!.toString()}",
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(),
                        Text(
                          "₹${currentCrypto.currentPrice!.toString()}",
                          style: const TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Market Rank",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(),
                        Text(
                          "Current Price",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "₹${currentCrypto.atl!.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(),
                        Text(
                          "₹${currentCrypto.ath!.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Atl",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(),
                        Text(
                          "Ath",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Market Cap",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(),
                        Text(
                          "₹${currentCrypto.marketCap!}",
                          style: const TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Circulating Supply",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(),
                        Text(
                          "₹${currentCrypto.circulatingSupply!}",
                          style: const TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    const Center(
                      child: Text(
                        "Made by Ankit Gupta",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget HeadDetial(String image, CryptoCurrency currentCrypto) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(7),
              height: 75,
              width: 75,
              child: Image.network(image),
            ),
            const SizedBox(width: 10),
            Text(
              "${currentCrypto.name!} (${currentCrypto.symbol!})",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 7, top: 10, bottom: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentCrypto.currentPrice!.toStringAsFixed(4),
                    style: const TextStyle(
                        fontSize: 29, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    " INR",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 6, right: 0),
                  child: Builder(builder: ((context) {
                    double priceChange = currentCrypto.priceChange24h!;
                    double priceChangePercentage =
                        currentCrypto.priceChangePercentage24h!;
                    if (priceChange < 0) {
                      return const Icon(Icons.arrow_downward,
                          color: Colors.red);
                    } else {
                      return const Icon(Icons.arrow_upward,
                          color: Colors.green);
                    }
                  })),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    "₹${currentCrypto.priceChange24h!.toStringAsFixed(4)}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 8.56),
                Builder(
                  builder: ((context) {
                    double priceChange = currentCrypto.priceChange24h!;
                    double priceChangePercentage =
                        currentCrypto.priceChangePercentage24h!;
                    if (priceChange < 0) {
                      return Text(
                        " ${priceChangePercentage.toStringAsFixed(3)}% ⬇",
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      );
                    } else {
                      return Text(
                        '${priceChangePercentage.toStringAsFixed(3)}% ⬆',
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      );
                    }
                  }),
                ),
              ],
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "24H CHANGE",
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
