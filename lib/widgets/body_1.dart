import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '/provider/crypto_data_provider.dart';
import '/widgets/single_crypto_container.dart';

class Body1 extends StatelessWidget {
  const Body1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final cryptoData = Provider.of<CryptoDataProvider>(context);
    return cryptoData.internet == false
        ?
        // If there is no internet connection this widget will show
        Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const  Text(
                  'Check Your internet connection',
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(
                  onPressed: () {
                    cryptoData.fetchCryptoData();
                  },
                  child: const Text('Refresh screen'),
                )
              ],
            ),
          )
        :
        // If there is internet this widget will show
        Column(
            children: [
              SizedBox(
                height: deviceHeight * 0.1,
                child: Row(
                  children: [
                    SizedBox(width: deviceWidth * 0.05),
                    const Text(
                      'Crypto List',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.slidersH,
                            size: 17,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sort/Filter',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => SingleCryptoContainer(
                    height: deviceHeight * 0.17,
                    width: deviceWidth,
                    crypto: cryptoData.cryptoList[index],
                  ),
                  itemCount: cryptoData.cryptoList.length,
                ),
              )
            ],
          );
  }
}
