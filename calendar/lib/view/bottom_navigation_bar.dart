import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calendar/controllers/bottom_navigation_bar_controller.dart';
class CalendarBottomNavigationBar extends GetView<BottomNavigationBarController> {
  const CalendarBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event_note),
                label: 'Todo',
              ),
            ]
        ),
    );
  }
}
