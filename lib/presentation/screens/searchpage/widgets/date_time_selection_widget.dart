// import 'dart:developer';

// import 'package:bright_bike_rentals/core/colors.dart';

// import 'package:bright_bike_rentals/core/responsive_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class DateTimeSelectionWidget extends StatefulWidget {
//   final Function(DateTime, TimeOfDay) onDateTimeChanged;
//   const DateTimeSelectionWidget({super.key, required this.onDateTimeChanged});

//   @override
//   DateTimeSelectionWidgetState createState() => DateTimeSelectionWidgetState();
// }

// class DateTimeSelectionWidgetState extends State<DateTimeSelectionWidget> {
//   DateTime selectedDate = DateTime.now();
//   TimeOfDay selectedTime = TimeOfDay.now();
//   List<String> timeSlots = [];

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _generateTimeSlots();
//   }

//   void _generateTimeSlots() {
//     DateTime now = DateTime.now();
//     DateTime startTime;

//     if (now.minute >= 30) {
//       // If current time is past half hour, start from next hour
//       startTime = DateTime(now.year, now.month, now.day, now.hour + 1);
//     } else {
//       // If current time is before half hour, start from next half hour
//       startTime = DateTime(now.year, now.month, now.day, now.hour, 30);
//     }

//     // If startTime is before current time (due to crossing midnight), move to next day
//     if (startTime.isBefore(now)) {
//       startTime = startTime.add(const Duration(days: 1));
//     }

//     timeSlots.clear();
//     DateTime currentSlot = startTime;
//     DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59);

//     while (currentSlot.isBefore(endOfDay)) {
//       timeSlots.add(_formatDateTime(currentSlot));
//       currentSlot = currentSlot.add(const Duration(minutes: 30));
//     }

//     if (timeSlots.isNotEmpty &&
//         !timeSlots.contains(_formatTimeOfDay(selectedTime))) {
//       selectedTime =
//           TimeOfDay.fromDateTime(DateFormat('h:mm a').parse(timeSlots.first));
//     }
//   }

//   String _formatDateTime(DateTime dateTime) {
//     return DateFormat('h:mm a').format(dateTime);
//   }

//   String _formatTimeOfDay(TimeOfDay time) {
//     final now = DateTime.now();
//     final dateTime =
//         DateTime(now.year, now.month, now.day, time.hour, time.minute);
//     return DateFormat('h:mm a').format(dateTime);
//   }

//   TimeOfDay _parseTimeString(String timeString) {
//     final format = DateFormat('h:mm a');
//     final dateTime = format.parse(timeString);
//     return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(const Duration(days: 365)),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//         log(selectedDate.toString());
//         _generateTimeSlots(); // Regenerate time slots when date changes
//       });
//       widget.onDateTimeChanged(selectedDate, selectedTime);
//     }
//     // ignore: unused_element
//     DateTime getSelectedDate() => selectedDate;
//     // ignore: unused_element
//     TimeOfDay getSelectedTime() => selectedTime;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Container(
//           padding: EdgeInsets.only(left: ResponsiveUtils.wp(2)),
//           width: ResponsiveUtils.wp(50),
//           decoration: BoxDecoration(
//             border: Border.all(color: Appcolors.kblackColor),
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(DateFormat('yyyy-MM-dd').format(selectedDate)),
//               IconButton(
//                 icon: const Icon(Icons.calendar_today),
//                 onPressed: () => _selectDate(context),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.only(left: ResponsiveUtils.wp(2)),
//           width: ResponsiveUtils.wp(30),
//           decoration: BoxDecoration(
//             border: Border.all(color: Appcolors.kblackColor),
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: DropdownButton<String>(
//             isExpanded: true,
//             value: _formatTimeOfDay(selectedTime),
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 setState(() {
//                   selectedTime = _parseTimeString(newValue);
//                 });
//               }
//               log(selectedTime.toString());
//             },
//             items: timeSlots.map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeSelectionWidget extends StatefulWidget {
  final Function(DateTime, TimeOfDay) onDateTimeChanged;

  const DateTimeSelectionWidget({Key? key, required this.onDateTimeChanged})
      : super(key: key);

  @override
  DateTimeSelectionWidgetState createState() => DateTimeSelectionWidgetState();
}

class DateTimeSelectionWidgetState extends State<DateTimeSelectionWidget> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  List<String> timeSlots = [];
  final GlobalKey _popupMenuKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _generateTimeSlots();
  }

  void _generateTimeSlots() {
    DateTime now = DateTime.now();
    DateTime startTime;

    if (now.minute >= 30) {
      startTime = DateTime(now.year, now.month, now.day, now.hour + 1);
    } else {
      startTime = DateTime(now.year, now.month, now.day, now.hour, 30);
    }

    if (startTime.isBefore(now)) {
      startTime = startTime.add(const Duration(days: 1));
    }

    timeSlots.clear();
    DateTime currentSlot = startTime;
    DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59);

    while (currentSlot.isBefore(endOfDay)) {
      timeSlots.add(_formatDateTime(currentSlot));
      currentSlot = currentSlot.add(const Duration(minutes: 30));
    }

    if (timeSlots.isNotEmpty &&
        !timeSlots.contains(_formatTimeOfDay(selectedTime))) {
      selectedTime =
          TimeOfDay.fromDateTime(DateFormat('h:mm a').parse(timeSlots.first));
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('h:mm a').format(dateTime);
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('h:mm a').format(dateTime);
  }

  TimeOfDay _parseTimeString(String timeString) {
    final format = DateFormat('h:mm a');
    final dateTime = format.parse(timeString);
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Appcolors.kyellowColor,
            hintColor: Appcolors.kyellowColor,
            colorScheme: const ColorScheme.light(
              primary: Appcolors.kyellowColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _generateTimeSlots();
      });
      widget.onDateTimeChanged(selectedDate, selectedTime);

      // Add a small delay before showing the time popup
      Future.delayed(const Duration(milliseconds: 100), () {
        dynamic state = _popupMenuKey.currentState;
        state?.showButtonMenu();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 8),
          width: ResponsiveUtils.wp(50),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(DateFormat('yyyy-MM-dd').format(selectedDate)),
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () => _selectDate(context),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: ResponsiveUtils.wp(2)),
          width: ResponsiveUtils.wp(30),
          decoration: BoxDecoration(
            border: Border.all(color: Appcolors.kblackColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: PopupMenuButton<String>(
            color: Appcolors.kwhiteColor,
            key: _popupMenuKey,
            initialValue: _formatTimeOfDay(selectedTime),
            onSelected: (String timeString) {
              setState(() {
                selectedTime = _parseTimeString(timeString);
              });
              widget.onDateTimeChanged(selectedDate, selectedTime);
            },
            itemBuilder: (BuildContext context) {
              return timeSlots.map((String time) {
                
                return PopupMenuItem<String>(
                  value: time,
                  height: ResponsiveUtils.hp(4),
                  child: Text(time),
                );
              }).toList();
            },
            constraints: BoxConstraints(
              maxHeight: ResponsiveUtils.hp(40),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_formatTimeOfDay(selectedTime)),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
