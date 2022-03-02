import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screen/homepage.dart';
import '/provider/crypto_data_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return CryptoDataProvider();
      },
      child: MaterialApp(
        title: 'Simple Crypto Price List App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.transparent,
              toolbarHeight: 5),
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
