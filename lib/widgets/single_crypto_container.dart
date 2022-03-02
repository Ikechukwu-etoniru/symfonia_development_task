import 'package:flutter/material.dart';

import '/models/crypto.dart';

class SingleCryptoContainer extends StatelessWidget {
  final double height;
  final double width;
  final Crypto crypto;
  const SingleCryptoContainer(
      {required this.height,
      required this.width,
      required this.crypto,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3)
                ]),
            height: height,
            width: width * 0.22,
            child: Center(
              // This sizedbox is to force the size of the image to be small
              child: SizedBox(
                height: height * 0.4,
                width: width * 0.1,
                child: Image.network(
                  crypto.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.05,
          ),
          SizedBox(
            height: height,
            width: width * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.15,
                ),
                SizedBox(
                  height: height * 0.08,
                  child: FittedBox(
                    child: Text(
                      'Rank - ${crypto.rank}',
                      semanticsLabel: 'Rank according to market cap',
                      style: TextStyle(
                          color: Colors.grey.withOpacity(0.7),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * 0.25,
                  child: FittedBox(
                    child: Text(
                      crypto.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * 0.2,
                  child: FittedBox(
                    child: Text(
                      'Market Cap - ${crypto.marketCap}',
                      semanticsLabel: 'Total market cap of coin',
                      style: TextStyle(
                          color: Colors.grey.withOpacity(0.7),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          SizedBox(
            width: width * 0.2,
          ),
          Expanded(
            child: FittedBox(
              child: Column(
                children: [
                  Text(
                    '\$${crypto.price}',
                    semanticsLabel: 'Price of currency',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${crypto.percentChangein24hrs}%',
                    style: TextStyle(
                        color: crypto.percentChangein24hrs >= 0
                            ? Colors.green
                            : Colors.red),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
