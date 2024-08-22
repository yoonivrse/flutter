// ignore_for_file: constant_identifier_names

import 'package:calendar/model/todo.dart';
import 'package:calendar/view/main_page.dart';
import 'package:get/get.dart';
import 'package:calendar/bindings/todo_page_binding.dart';
import 'package:calendar/view/todo_page.dart';
import 'package:calendar/bindings/calendar_page_binding.dart';
import 'package:calendar/bindings/test_page_binding.dart';
import 'package:calendar/view/test_page.dart';

part './routes.dart';

abstract class Pages{
  static final List<GetPage> allPages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => CalendarPage(),
      binding: CalendarPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.TODO,
      page: () => const TodoPage(),
      binding: TodoPageBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.TEST,
      page: () => const TestPage(),
      binding: TestPageBinding(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 200),
    )
  ];
}