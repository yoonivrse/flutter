import 'package:calendar/view/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/calendar_controller.dart';
import 'package:calendar/controllers/bottom_navigation_bar_controller.dart';


class CalendarPage extends GetView<CalendarController> {

  final List<String> list1 = ['일', '월', '화', '수', '목', '금', '토'];
  final CalendarController calendarController = Get.put(CalendarController());

  List<Widget> _buildCalendarDays() {
    List<Widget> days = [];
    DateTime firstDayOfMonth = DateTime(calendarController.selectedDate.value.year, calendarController.selectedDate.value.month, 1);
    int startingWeekday = firstDayOfMonth.weekday;
    int daysInMonth = DateTime(calendarController.selectedDate.value.year, calendarController.selectedDate.value.month + 1, 0).day;

    for (int i = 0; i < 7; i++) {
      days.add(
        Container(
          alignment: Alignment.center,
          child: Text(
            list1[i],
            style: TextStyle(color: i == 0 ? Colors.red : (i == 6 ? Colors.blue : Colors.black)),
          ),
        ),
      );
    }

    if (startingWeekday != 7) {
      for (int i = 0; i < startingWeekday; i++) {
        days.add(
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.white,
            ),
          ),
        );
      }
    }

    for (int i = 1; i <= daysInMonth; i++) {
      days.add(
        Obx (() => GestureDetector(
          onTap: () {
            calendarController.selectDate(DateTime(calendarController.selectedDate.value.year, calendarController.selectedDate.value.month, i));
          },
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: calendarController.selectedDate.value.day == i ? Color.fromRGBO(220, 205, 152, 0.5) : Colors.white,
              ),
              alignment: Alignment.center,
              child: Text(
                i.toString(),
                style: TextStyle(
                  color: (i + startingWeekday - 1) % 7 == 0 ? Colors.red : ((i + startingWeekday - 1) % 7 == 6) ? Colors.blue : Colors.black,
                ),
              ),
            ),
          ),
        )
      );
    }

    return days;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("calendar"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      calendarController.prevMonth();
                    },
                    icon: Icon(Icons.arrow_left, size: 35),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 25),
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      calendarController.selectDate(DateTime.now());
                    },
                    child: Text('${calendarController.selectedDate.value.year}-${calendarController.selectedDate.value.month.toString().padLeft(2, '0')}-${calendarController.selectedDate.value.day.toString().padLeft(2, '0')}'),
                  ),
                  IconButton(
                    onPressed: () {
                      calendarController.nextMonth();
                    },
                    icon: Icon(Icons.arrow_right, size: 35),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child:
               Obx(
                   () =>  GridView.builder(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 7,
                     ),
                     itemCount: _buildCalendarDays().length,
                     itemBuilder: (context, index) {
                       return _buildCalendarDays()[index];
                     },
                   ),

               )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    "Schedule",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog<void>(
            context: context,
            builder: (context) => AlertDialog(
              content: SingleChildScrollView(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Positioned(
                      right: -40,
                      top: -40,
                      child: InkResponse(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(Icons.close),
                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                labelText: "제목",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '제목을 입력해주세요';
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                labelText: "날짜",
                              ),
                              readOnly: true,
                              initialValue: "${calendarController.selectedDate.value.year}-${calendarController.selectedDate.value.month.toString().padLeft(2, '0')}-${calendarController.selectedDate.value.day.toString().padLeft(2, '0')}",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                labelText: "세부사항",
                              ),
                              maxLines: 5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: ElevatedButton(
                              child: const Text('저장'),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: const CalendarBottomNavigationBar(),
    );
  }
}
