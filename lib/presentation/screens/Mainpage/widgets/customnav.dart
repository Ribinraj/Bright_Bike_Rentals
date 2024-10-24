// import 'package:bright_bike_rentals/core/colors.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

// class BottomNavigationWidget extends StatelessWidget {
//   const BottomNavigationWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//         valueListenable: indexChangeNotifier,
//         builder: (context, int newIndex, _) {
//           return BottomNavigationBar(
//               currentIndex: newIndex,
//               onTap: (index) {
//                 indexChangeNotifier.value = index;
//               },
//               type: BottomNavigationBarType.fixed,
//               backgroundColor: Appcolors.kyellowColor,
//               selectedItemColor: Appcolors.kwhiteColor,
//               unselectedItemColor: Appcolors.kblackColor,
//               selectedIconTheme:
//                   const IconThemeData(color: Appcolors.kwhiteColor),
//               unselectedIconTheme:
//                   const IconThemeData(color: Appcolors.kblackColor),
//               items: const [
//                 BottomNavigationBarItem(
//                     icon: Icon(
//                       CupertinoIcons.home,
//                     ),
//                     label: 'Home'),
//                 BottomNavigationBarItem(
//                     icon: Icon(
//                       CupertinoIcons.search,
//                     ),
//                     label: 'Search'),
//                 BottomNavigationBarItem(
//                     icon: Icon(
//                       CupertinoIcons.cart,
//                     ),
//                     label: 'Cart'),
//                 BottomNavigationBarItem(
//                     icon: Icon(
//                       Icons.clear_all,
//                     ),
//                     label: 'Booking'),
//                 BottomNavigationBarItem(
//                     icon: Icon(
//                       Icons.person_outline,
//                     ),
//                     label: 'Account'),
//               ]);
//         });
//   }
// }
import 'package:bright_bike_rentals/presentation/blocs/bottom_navigationbar/bottom_navigationbar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bright_bike_rentals/core/colors.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationbarBloc, BottomNavigationbarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.currentPageIndex,
          onTap: (index) {
            context.read<BottomNavigationbarBloc>().add(
              NavigateToPageEvent(pageIndex: index),
            );
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Appcolors.kyellowColor,
          selectedItemColor: Appcolors.kwhiteColor,
          unselectedItemColor: Appcolors.kblackColor,
          selectedIconTheme: const IconThemeData(color: Appcolors.kwhiteColor),
          unselectedIconTheme: const IconThemeData(color: Appcolors.kblackColor),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.clear_all),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Account',
            ),
          ],
        );
      },
    );
  }
}