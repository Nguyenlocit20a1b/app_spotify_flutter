import 'package:flutter/material.dart';
import 'package:spotify_app_login/view/libary_page.dart';
import 'package:spotify_app_login/view/search_page.dart';
import 'package:spotify_app_login/view/setting.dart';

import 'home_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getFooter() {
    List items = [
      Icons.home_outlined,
      Icons.library_books_sharp,
      Icons.search,
      Icons.settings
    ];
    // danh sach Icon hien thi
    return Container(
      height: 80,
      decoration: const BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length,(index) {
            return IconButton(
                icon: Icon(
                  items[index],
                  color: activeTab == index ? Colors.green : Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    activeTab = index;
                  });
                });
          } // 1 mang chua items.length phan tu icon
          ),
        ),
      ),
    );
  }

  Widget getBody() {
     // IndexedStack là một Stack mà chỉ một element được
     // hiển thị tại một thời điểm bằng index của nó
    return IndexedStack(
      index: activeTab,
      children: const [
        HomePage(),
        // Center(
        //   child: Text("Home", style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.white
        //   ),
        //   ),
        // ),

        Libary(),
        SearchPage(),
        // Center(
        //   child: Text("Search", style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.white
        //   ),
        //   ),
        // ),]
        SettingPage()

      ],
    );
  }


}

