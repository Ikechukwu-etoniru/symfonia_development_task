import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '/provider/crypto_data_provider.dart';
import '/widgets/body_1.dart';
import '/widgets/body_2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CryptoDataProvider>(context, listen: false).fetchCryptoData();
  }

  final List<Widget> _pages = [
    // Body 1 is the main page
    const Body1(),
    // Body 2 is a dummy page for the remaining tabs
    const Body2(),
    const Body2(),
    const Body2()
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  BottomNavigationBarItem _bottomNavigationItems(
      {required IconData icondata, required int pageIndex, required int id}) {
    return BottomNavigationBarItem(
        icon: Column(
          children: [
            FaIcon(
              icondata,
            ),
            const SizedBox(
              height: 3,
            ),
            // Comparing pageindex and id to determine when to show the little dot below selected tab
            if (pageIndex == id)
              Container(
                height: 5,
                width: 5,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
              )
          ],
        ),
        // Hiding label so using default for all tabs
        label: 'Default');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 17,
          onTap: _selectPage,
          items: [
            _bottomNavigationItems(
                icondata: FontAwesomeIcons.bars,
                pageIndex: _selectedPageIndex,
                id: 0),
            _bottomNavigationItems(
                icondata: FontAwesomeIcons.globe,
                pageIndex: _selectedPageIndex,
                id: 1),
            _bottomNavigationItems(
                icondata: FontAwesomeIcons.bell,
                pageIndex: _selectedPageIndex,
                id: 2),
            _bottomNavigationItems(
                icondata: FontAwesomeIcons.user,
                pageIndex: _selectedPageIndex,
                id: 3),
          ],
          backgroundColor: Colors.white,
          elevation: 10,
          currentIndex: _selectedPageIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
        body: _pages[_selectedPageIndex]);
  }
}
