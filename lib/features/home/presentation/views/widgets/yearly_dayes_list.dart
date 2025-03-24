import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meal_tracking_app/constants.dart';

class YearlyDaysList extends StatefulWidget {
  const YearlyDaysList({super.key});

  @override
  State<YearlyDaysList> createState() => _YearlyDaysListState();
}

class _YearlyDaysListState extends State<YearlyDaysList> {
  late List<DateTime> daysOfYear;
  late int selectedIndex;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    // Generate all days of the current year
    DateTime now = DateTime.now();
    daysOfYear = List.generate(
      365,
      (index) => DateTime(now.year, 1, 1).add(Duration(days: index)),
    );

    // Find the index of today's date
    selectedIndex = daysOfYear
        .indexWhere((day) => day.day == now.day && day.month == now.month);

    // Initialize scroll controller
    scrollController = ScrollController();

    // Scroll to today's date after layout is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToCurrentDay();
    });
  }

  void scrollToCurrentDay() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        selectedIndex * 80.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void onDaySelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: daysOfYear.length,
        itemBuilder: (context, index) {
          DateTime day = daysOfYear[index];
          bool isSelected = index == selectedIndex;
          bool isPastDay = day.isBefore(DateTime.now());

          return GestureDetector(
            onTap: () => onDaySelected(index),
            child: Container(
              width: 70,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEE').format(day),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected
                          ? Colors.black
                          : isPastDay
                              ? Colors.grey
                              : Colors.black87,
                    ),
                  ),
                  Opacity(
                    opacity: !isSelected ? 0.3 : 1.0,
                    child: const Icon(
                      Icons.circle_outlined,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    DateFormat('d MMM').format(day), // day number
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected
                          ? Colors.black
                          : isPastDay
                              ? Colors.grey
                              : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
