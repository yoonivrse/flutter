import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List list1 = ['일','월','화','수','목','금','토'];
  List<Widget> _buildCalendarDays() {
    List<Widget> days = [];
    DateTime firstDayOfMonth = DateTime(_selectedDate.year, _selectedDate.month, 1);
    int startingWeekday = firstDayOfMonth.weekday;
    int daysInMonth = DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
    for(int i=0 ; i<7; i++)
      {
        days.add(
            Container(
              alignment: Alignment.center,
              child: Text(
              list1[i],
              style: TextStyle(color: i == 0 ? Colors.red :(i == 6 ? Colors.blue : Colors.black) ),
            ),
          )
        );
      }
    if(startingWeekday != 7)
      {
        for (int i = 0; i < startingWeekday; i++) {
          days.add(
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                ),
              )
          );
        }
      }

    for (int i = 1; i <= daysInMonth; i++) {
      days.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = DateTime(_selectedDate.year, _selectedDate.month, i);
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: _selectedDate.day == i ? Color.fromRGBO(220 , 205, 152, 0.5) : Colors.white,
            ),
            alignment: Alignment.center,
            child: Text(
              i.toString(),
              style: TextStyle(color: (i + startingWeekday - 1)%7 == 0 ? Colors.red : ((i + startingWeekday - 1)%7 == 6)? Colors.blue : Colors.black),
            ),
          ),
        ),
      );
    }

    return days;
  }

  DateTime _selectedDate = DateTime.now();

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {
                    setState(() {
                      _selectedDate = _selectedDate.month==1? DateTime(_selectedDate.year-1, 12, 1) : DateTime(_selectedDate.year, _selectedDate.month-1, 1);
                    });
                  }, icon: Icon(Icons.arrow_left, size: 35,)),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 25),
                      foregroundColor: Colors.black,
                    ),
                    onPressed: (){ setState(() {
                      _selectedDate = DateTime.now();
                      });
                    },
                    child: Text('${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}'),

                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedDate = _selectedDate.month==12? DateTime(_selectedDate.year+1, 1, 1) : DateTime(_selectedDate.year, _selectedDate.month+1, 1);
                      });
                    },
                    icon: Icon(Icons.arrow_right, size: 35,),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child:
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 7,
                    children: _buildCalendarDays(),
                  ),
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

      floatingActionButton:  FloatingActionButton(
        onPressed: () async {
          await showDialog<void>(
              context: context,
              builder: (context) => AlertDialog(
                content: Stack(
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
                                labelText: "제목"
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
                                      )
                                    ),
                                    labelText: "날짜",
                                ),
                              readOnly: true,
                              initialValue: "${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}",
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
                                    labelText: "세부사항"
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
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
