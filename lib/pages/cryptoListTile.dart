// ignore_for_file: file_names

import 'package:cryptotracker/models/cryptocurrenct.dart';
import 'package:cryptotracker/providers/market_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'details_page.dart';

class CryptoListTile extends StatelessWidget {
  const CryptoListTile({super.key, required this.currentCrypto});

  final CryptoCurrency currentCrypto;

  @override
  Widget build(BuildContext context) {
    MarketProvider marketProvider =
        Provider.of<MarketProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                id: currentCrypto.id!,
              ),
            ),
          );
        },
        contentPadding: const EdgeInsets.all(0),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(currentCrypto.image!),
        ),
        title: Row(
          children: [
            Flexible(
                child: Text(
              currentCrypto.name!,
              overflow: TextOverflow.ellipsis,
            )),
            const SizedBox(width: 10),
            (currentCrypto.isFavorites == false)
                ? GestureDetector(
                    onTap: () {
                      marketProvider.addFav(currentCrypto);
                    },
                    child: const Icon(
                      CupertinoIcons.heart,
                      size: 19,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      marketProvider.removeFav(currentCrypto);
                    },
                    child: const Icon(
                      CupertinoIcons.heart_fill,
                      size: 19,
                      color: Colors.red,
                    ),
                  )
          ],
        ),
        subtitle: Text(currentCrypto.symbol!.toUpperCase()),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "₹ ${currentCrypto.currentPrice!.toStringAsFixed(3)}",
              style: const TextStyle(
                  color: Color(0xff0395eb),
                  // color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Builder(builder: ((context) {
              double priceChange = currentCrypto.priceChange24h!;
              double priceChangePercentage =
                  currentCrypto.priceChangePercentage24h!;
              if (priceChange < 0) {
                return Text(
                  "${priceChangePercentage.toStringAsFixed(3)}% ⬇",
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.w500),
                );
              } else {
                return Text(
                  '+${priceChangePercentage.toStringAsFixed(3)}% ⬆',
                  style: const TextStyle(
                      color: Colors.green, fontWeight: FontWeight.w500),
                );
              }
            }))
          ],
        ),
      ),
    );
  }
}
