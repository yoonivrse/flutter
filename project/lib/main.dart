import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyCustomHomepage(),
    );
  }
}

class MyCustomHomepage extends StatelessWidget {
  const MyCustomHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('당근'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            CustomCard(
              title: '아이스크림',
              description: '6.1km ・ 신수동 ・ 1시간전',
              price: '1000원',
              image:"assets/images/icecream.jpg",
            ),
            CustomCard(
              title: '도넛',
              description: '6.1km ・ 신수동 ・ 1시간전',
              price: '나눔🧡',
              image:"assets/images/donut.jpg",
            ),
            CustomCard(
              title: '아이스크림',
              description: '6.1km ・ 신수동 ・ 1시간전',
              price: '1000원',
              image:"assets/images/icecream.jpg",
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String image;

  CustomCard({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(padding: const EdgeInsets.only(right: 5.0),
                  child: Image.asset(
                    image, width: 60, height: 60, fit: BoxFit.fill,),
                ),
                Column(
                  children: <Widget>[
                    Row(
                        children: [
                          Container(
                            width: 230,
                            child: Text(
                              title,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        BottomMenu(),
                        ]
                    ),
                    Container(
                      width: 290,
                      child: Row(
                          children: [
                            Icon(Icons.location_on),
                            Text(
                              description,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ]
                      ),
                    ),
                    Container(
                      width: 290,
                      child: Text(
                        price,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: _showBottomMenu, icon: Icon(Icons.menu));
  }
  void _showBottomMenu(){

    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return ClipRect(
          // borderRadius: BorderRadius.only(
          //   topRight: Radius.circular(0),
          //   topLeft: Radius.circular(0),
          // ),
          child:Container(
            height: 220,
            color: Colors.white70,
            child: ListView(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                      top: 10
                    ),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.visibility_off_outlined),
                          label: const Text('이 글 숨기기'),
                          iconAlignment: IconAlignment.start,
                          style: style,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.help_outline_outlined),
                          label: const Text('게시글 노출 기준'),
                          iconAlignment: IconAlignment.start,
                          style: style,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.notifications_active_outlined),
                          label: const Text('신고하기'),
                          iconAlignment: IconAlignment.start,
                          style: style,
                        ),
                      ),
                    ],
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10
                  ),
                  child: ElevatedButton(
                    child: const Text("닫기"),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                )
              ],
            ),
          )

        );
      },
      isDismissible: true,
      backgroundColor: Colors.grey,
    )
    .then((value) {});
  }
}

