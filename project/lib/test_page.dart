import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                color: Colors.red,
                child: Icon(Icons.abc),
              ),
              Expanded(
                  child: Container(
                    height: 200,
                      color: Colors.grey,
                      child:  Icon(Icons.ac_unit)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

