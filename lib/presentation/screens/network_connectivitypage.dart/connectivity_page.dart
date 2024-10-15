
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_elevatedbutton.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ConnectivityAwareWidget extends StatefulWidget {
  final Widget child;

  const ConnectivityAwareWidget({super.key, required this.child});

  @override
  // ignore: library_private_types_in_public_api
  _ConnectivityAwareWidgetState createState() =>
      _ConnectivityAwareWidgetState();
}

class _ConnectivityAwareWidgetState extends State<ConnectivityAwareWidget> {
  Key _contentKey = UniqueKey();

  void _reloadContent() {
    setState(() {
      _contentKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectivityBloc, ConnectivityState>(
      listener: (context, state) {
        if (state is ConnectivityRestored) {
          _reloadContent();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Connection restored: ${_getConnectionTypes(state.results)}')),
          );
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            KeyedSubtree(
              key: _contentKey,
              child: widget.child,
            ),
            if (state is ConnectivityFailure) const NoNetworkOverlay(),
          ],
        );
      },
    );
  }

  String _getConnectionTypes(List<ConnectivityResult> results) {
    return results
        .map((result) => result.toString().split('.').last)
        .join(', ');
  }
}

class NoNetworkOverlay extends StatelessWidget {
  const NoNetworkOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 150),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Lottie.asset(internetanimation),
              ),
              ResponsiveSizedBox.height50,
              TextStyles.headline(text: 'Ooops!'),
              ResponsiveSizedBox.height20,
              TextStyles.body(
                text: 'No internet connection found \ncheck your connection',
              ),
              SizedBox(
                height: ResponsiveUtils.hp(15),
              ),
              CustomElevatedButton(
                onpress: () {},
                text: 'Retry',
              )
            ],
          ),
        ),
      ),
      // body: Container(
      //   color: Appcolors.kwhiteColor,
      //   child: Center(
      //     child: Container(
      //       padding: const EdgeInsets.all(16),
      //       decoration: BoxDecoration(
      //         color: Appcolors.kyellowColor,
      //         borderRadius: BorderRadius.circular(8),
      //       ),
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           const Icon(Icons.signal_wifi_off, size: 90),
      //           const SizedBox(height: 16),
      //           TextStyles.subheadline(text: 'No internet Connection'),
      //           const SizedBox(height: 16),
      //           ElevatedButton(
      //             onPressed: () {
      //               context.read<ConnectivityBloc>().add(CheckConnectivity());
      //             },
      //             child: const Text(
      //               'Retry',
      //               style: TextStyle(color: Appcolors.kblackColor),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
