import 'package:bright_bike_rentals/presentation/blocs/bottom_navigationbar/bottom_navigationbar_bloc.dart';
import 'package:bright_bike_rentals/presentation/screens/Mainpage/widgets/customnav.dart';
import 'package:bright_bike_rentals/presentation/screens/accountpage/accountpage.dart';
import 'package:bright_bike_rentals/presentation/screens/bookingpage/bookingpage.dart';
import 'package:bright_bike_rentals/presentation/screens/cartpage/cart_Page.dart';
import 'package:bright_bike_rentals/presentation/screens/homepage/homepage.dart';
import 'package:bright_bike_rentals/presentation/screens/searchpage/search_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class ScreenMainPage extends StatelessWidget {
//   ScreenMainPage({super.key});
//   final _pages = [
//   const ScreenHomepage(),
//   const ScreenSearchPage()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ValueListenableBuilder(
//           valueListenable: indexChangeNotifier,
//           builder: (context, int index, _) {
//             return _pages[index];
//           }),
//       bottomNavigationBar: const BottomNavigationWidget(),
//     );
//   }
// }

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final List<Widget> _pages = [
    const ScreenHomepage(),
    const ScreenSearchPage(),
    const ScreenCartpage(),
    const ScreenBookingPage(),
    const ScreenAccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationbarBloc, BottomNavigationbarState>(
      builder: (context, state) {
        return Scaffold(
          body: _pages[state.currentPageIndex],
          bottomNavigationBar: const BottomNavigationWidget(),
        );
      },
    );
  }
}
