import 'package:flutter/material.dart';
import 'package:myapps/deteksi.dart';
import 'package:myapps/page/chatbot.dart';
import 'package:myapps/page/login_page.dart';
import 'package:myapps/page/sign_up.dart';
import 'package:myapps/page/splash_Page.dart';
import 'package:myapps/page/tentang_kami.dart';

class MakeDashboardItems extends StatefulWidget {
  const MakeDashboardItems({Key? key}) : super(key: key);

  @override
  _MakeDashboardItemsState createState() => _MakeDashboardItemsState();
}

class _MakeDashboardItemsState extends State<MakeDashboardItems> {
  ElevatedButton makeElevatedButton(String title, String img, Widget page) {
    return ElevatedButton(
      onPressed: () {
        navigateToPage(page);
      },
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(133, 158, 213, 1),
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              navigateToPage(page);
            },
            child: Center(
              child: Image.asset(
                img,
                height: 60,
                width: 60,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void navigateToPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(146, 146, 189, 1),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Dashboard",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Items:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(2),
              children: [
                makeElevatedButton("Mulai Deteksi", "assets/deteksi.jpg", MyApp()),
                makeElevatedButton("Chatbot", "assets/chatbot.png", ChatbotPage()), 
                makeElevatedButton("Tentang Kami", "assets/abour1.png", TentangKamiPage()),
                makeElevatedButton("LogOut", "assets/logout.png", LoginPage()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
