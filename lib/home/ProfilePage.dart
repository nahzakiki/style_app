import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage("assets/images/S__5963780.jpg")),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.cyanAccent),
                        child: Icon(Icons.edit_rounded,color: Colors.black12),
                      ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "Crimson bababa",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          //const SizedBox(height: 10),
          Container(
            width: 300,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color.fromRGBO(219, 221, 243, 1.0),
            ),
            child: Center(
                child: Text('My Blog',
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.6)))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: SizedBox(
              height: 60,
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(252, 222, 116, 1.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 60,
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "About NGstyle",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(252, 222, 116, 1.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Log out",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(238, 111, 111, 1.0),
                shape: StadiumBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
