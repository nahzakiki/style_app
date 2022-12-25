import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:style_app/camera/MainCamera.dart';
import 'package:style_app/home/HomePage.dart';
import 'package:style_app/home/ProfilePage.dart';

class IndexPreview extends StatefulWidget {
  const IndexPreview({Key? key}) : super(key: key);

  @override
  State<IndexPreview> createState() => _IndexPreview();
}

class _IndexPreview extends State<IndexPreview> with TickerProviderStateMixin {
  final List<String> StylesList = [
    'Minimal Style',
    'Sweet Style',
    'Vintage Style',
    'Sexy Style',
    'Street Style',
    'Casual Style'
  ];
  int _currentIndex = 0;
  int _activeIndex = 0;

  List<String> pageList = [
    'Minimal Style',
    'Sweet Style',
    'Vintage Style',
    'Sexy Style',
    'Street Style',
    'Casual Style'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: MoltenBottomNavigationBar(
          selectedIndex: _currentIndex,
          onTabChange: (clickedIndex) {
            setState(() {
              _currentIndex = clickedIndex;
            });
          },
          margin: EdgeInsets.all(20),
          borderRaduis: BorderRadius.circular(30),
          domeCircleSize: 50,
          domeCircleColor: Color.fromRGBO(222, 179, 173, 1.0),
          barColor: Color.fromRGBO(223, 211, 248, 1.0),
          tabs: [
            MoltenTab(
              icon: Icon(Icons.home, size: 30),
            ),
            MoltenTab(
              icon: Icon(Icons.camera_alt, size: 30),
            ),
            MoltenTab(
              icon: Icon(Icons.person, size: 30),
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
              _buildSubPage(),
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
  void _showModalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  // Handle camera option tap
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  // Handle gallery option tap
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSubPage() {

    switch (_currentIndex) {
      case 0 :
        return HomePage();
      case 1 :
        return MainCamera();
      case 2 :
        return ProfilePage();
      default:
        return SizedBox.shrink();
    }
  }
}
