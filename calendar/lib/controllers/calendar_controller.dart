import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CalendarController extends GetxController {
  var selectedDate = DateTime.now().obs;

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void nextMonth() {
    selectedDate.value = selectedDate.value.month == 12
        ? DateTime(selectedDate.value.year + 1, 1, 1)
        : DateTime(selectedDate.value.year, selectedDate.value.month + 1, 1);
  }

  void prevMonth() {
    selectedDate.value = selectedDate.value.month == 1
        ? DateTime(selectedDate.value.year - 1, 12, 1)
        : DateTime(selectedDate.value.year, selectedDate.value.month - 1, 1);
  }
}
