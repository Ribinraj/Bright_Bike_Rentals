import 'package:bright_bike_rentals/presentation/screens/Mainpage/widgets/customnav.dart';
import 'package:bright_bike_rentals/presentation/screens/homepage/homepage.dart';
import 'package:bright_bike_rentals/presentation/screens/searchpage/search_page.dart';

import 'package:flutter/material.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final _pages = [
  const ScreenHomepage(),
  const ScreenSearchPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          }),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
