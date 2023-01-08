import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> StylesList = [
    'Minimal Style',
    'Sweet Style',
    'Vintage Style',
    'Sexy Style',
    'Street Style',
    'Casual Style'
  ];

  List<String> pageList = [
    'Minimal Style',
    'Sweet Style',
    'Vintage Style',
    'Sexy Style',
    'Street Style',
    'Casual Style'
  ];

  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/LOGO1.png',
              fit: BoxFit.contain,
              height: 80,
            ),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 85,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildButton(),
                  ],
                ),
              ),
              Container(
                child: Text(pageList[_activeIndex]), //เรียก database
              ),
              //_buildSubPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton() {
    return Row(
      children: [
        for (int i = 0; i < StylesList.length; i++)
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _activeIndex = i;
                  });
                },
                child: Text(
                  '${StylesList[i]}',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: (_activeIndex == i)
                        ? Color.fromRGBO(222, 179, 173, 1.0)
                        : Color.fromRGBO(223, 211, 248, 1.0))),
          ),
      ],
    );
  }
}
