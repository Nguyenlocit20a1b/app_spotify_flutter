import 'package:flutter/material.dart';
import 'package:spotify_app_login/json/hexColor.dart';
import 'package:spotify_app_login/json/songs_json.dart';
import 'package:spotify_app_login/view/BrowseCard.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Search',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: !FocusScope.of(context).isFirstFocus
                            ? Colors.white
                            : Colors.green,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.green,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: song_type_1
                        .map((item) => Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                item,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                              ),
                            ))
                        .toList()),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Songs',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 13,
                ),
                ListSong(),
                const SizedBox(height: 15,),
                const Text('Browse all' ,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                const SizedBox(height: 15,),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:  List.generate(songs.length, (index){
                    return BrowseCard(title: songs[index]['title'], color1: songs[index]['color']);
                  })
                )
    ],
            ),
          ),
        ),
      ),
    ]);
  }

  Widget ListSong() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: songs.length,
          itemBuilder: ((context, index) {
            final song = songs[index];

            return Container(
              height: 195,
              width: 155,
              decoration: BoxDecoration(
                color: Colors.white60.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 0),
              margin: EdgeInsets.all(2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 113,
                    width: 125,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(song['img']))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      song['title'],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      song['description'],
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  )
                ],
              ),
            );
          })),
    );


  }
}
