import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spotify_app_login/json/songs_json.dart';
import 'package:spotify_app_login/view/album_page.dart';
// import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu1 = 0;
  int activeMenu2 = 0;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final userName = user.displayName.toString();
    // // kiem tra ngay gio
    // final now = new DateTime.now();
    // String formatterSession =  DateFormat.Hm().format(DateTime.now());
    // String closeTime = "12:00";
    // String session = (formatterSession <= closeTime)? "Buoi Sang" : "Buoi Chieu";

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                'Hello , $userName',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Icon(Icons.list_outlined)
            ],
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      children: List.generate(song_type_1.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activeMenu1 = index;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song_type_1[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: activeMenu1 == index
                                      ? CupertinoColors.activeGreen
                                      : CupertinoColors.systemGrey2),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            activeMenu1 == index
                                ? Container(
                                    width: 30,
                                    height: 3,
                                    decoration: BoxDecoration(
                                        color: CupertinoColors.activeGreen,
                                        borderRadius: BorderRadius.circular(5)),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    );
                  })),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                  children: List.generate(songs.length - 5, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,PageTransition(
                            alignment: Alignment.bottomCenter,
                              child: AlbumPage(song:songs[index]),
                              type: PageTransitionType.scale));
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(songs[index]['img']) , fit:BoxFit.cover),
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Text(songs[index]['title'] , style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600
                            ),),
                            const SizedBox(height: 5,),
                            SizedBox(
                              width: 180,
                              child: Text(songs[index]['description'],
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400
                                ),),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
            ),
          ),
          const SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      children: List.generate(song_type_2.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                activeMenu2 = index;
                              });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  song_type_2[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: activeMenu2 == index
                                          ? CupertinoColors.activeGreen
                                          : CupertinoColors.systemGrey2),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                activeMenu2 == index
                                    ? Container(
                                  width: 30,
                                  height: 3,
                                  decoration: BoxDecoration(
                                      color: CupertinoColors.activeGreen,
                                      borderRadius: BorderRadius.circular(5)),
                                )
                                    : Container()
                              ],
                            ),
                          ),
                        );
                      })),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30 , right:20),
              child: Row(
                  children: List.generate(songs.length - 5, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: AlbumPage(song:songs[index + 5 ]),
                              type: PageTransitionType.scale));
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(songs[index + 5]['img']) , fit:BoxFit.cover),
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Text(songs[index + 5 ]['title'] , style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600
                            ),),
                            const SizedBox(height: 5,),
                            SizedBox(
                              width: 180,
                              child: Text(songs[index + 5]['description'],
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400
                                ),),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
            ),
          ),
        ],
      ),
    );
  }
}

