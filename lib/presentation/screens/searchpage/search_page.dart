import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/screens/searchpage/widgets/date_time_selection_widget.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ScreenSearchPage extends StatelessWidget {
  const ScreenSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.all(ResponsiveUtils.wp(4)),
        child: Column(
          children: [
            TextStyles.headline(text: 'Search your bike'),
            DateTimeSelectionWidget()
          ],
        ),
      ),
    );
  }
}
// import 'package:bright_bike_rentals/presentation/screens/searchpage/widgets/date_time_selection_widget.dart';
// import 'package:flutter/material.dart';

// class ScreenSearchPage extends StatefulWidget {
//   const ScreenSearchPage({super.key});

//   @override
//   State<ScreenSearchPage> createState() => _ScreenSearchPageState();
// }

// class _ScreenSearchPageState extends State<ScreenSearchPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: DateTimeSelectionWidget(),
//       ),
//     );
//   }
// }
