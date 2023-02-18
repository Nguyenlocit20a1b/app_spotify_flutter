import 'dart:io';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spotify_app_login/json/songs_json.dart';
class MusicDetailPage extends StatefulWidget {
  final int indexSong ;
  final String title;
  final String description;
  final Color color;
  final String img;
  final String songUrl;

  const MusicDetailPage({Key? key, required this.title, required this.description, required this.color, required this.img, required this.songUrl, required this.indexSong}) : super(key: key);
  @override
  State<MusicDetailPage> createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
   bool isPlaying = false;
  final audioPlayer = AudioPlayer();


  @override
  void initState() {
    super .initState();
    // Listen to statses : playing , paused , stpped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    
    // Listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // Listen to audio position
    audioPlayer.onPositionChanged.listen((newPosision) {
      setState(() {
        position = newPosision;
      });
    });
  }

  @override
  void dispose() {
    super .dispose();
  }
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black ,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined , color: Colors.white,))
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody(){
    int indexSongCurrent = widget.indexSong ;
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30 , right: 30 , top: 20 ),
                child: Container(
                  width: size.width - 100,
                  height: size.width - 100,
                  decoration:  BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: widget.color,
                        blurRadius: 35,
                        offset: const Offset(-5 , 40)
                      )] ,
                      color: Colors.green ,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30 , right: 30 , top: 20 ),
                child: Container(
                  width: size.width - 60,
                  height: size.width - 60,
                  decoration:  BoxDecoration(
                      image: DecorationImage(image: AssetImage(widget.img) , fit: BoxFit.cover),
                      color: Colors.green ,
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10 , right:10 ),
            child: Container(
              width: size.width - 80,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.add_card , color: Colors.white,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.title ,
                        style:  TextStyle(
                        color: Colors.white,
                        fontSize: 20 ,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      Container(
                        width: 150,
                        child: Text(
                          widget.description,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.white.withOpacity(0.5)
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.more_vert_outlined, color: Colors.white,),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Slider(
            activeColor: Colors.green,
              value: position.inSeconds.toDouble(),
              min: 0,
              max: duration.inSeconds.toDouble(),
              onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await audioPlayer.seek(position);
              // Optional : Play audio if was paused
                await audioPlayer.resume();
                // seekSound();
              }),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25 , right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${position.inSeconds.toString()} s', style: TextStyle(
                  color: Colors.white.withOpacity(0.5)
                ),),
                Text('${duration.inSeconds.toString()} s ', style: TextStyle(
                    color: Colors.white.withOpacity(0.5)
                ),)
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25 , right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               IconButton(onPressed: (){} ,
                   icon: Icon(Icons.shuffle_outlined,
                     color: Colors.white.withOpacity(0.8),
                     size: 25,
                   )),
                IconButton(onPressed: (
                    ){
                  audioPlayer.pause();
                  Navigator.push(
                      context,
                      PageTransition(alignment: Alignment.bottomCenter,
                          child: MusicDetailPage(
                            indexSong: indexSongCurrent - 1,
                            title: songs[indexSongCurrent - 1]['title'],
                            songUrl: songs[indexSongCurrent - 1]['song_url'],
                            color: songs[indexSongCurrent - 1]['color'],
                            description: songs[indexSongCurrent - 1]['description'],
                            img: songs[indexSongCurrent - 1]['img'],
                          ),
                          type: PageTransitionType.scale),
                  );
                } ,
                    icon: Icon(Icons.skip_previous_outlined,
                      color: Colors.white.withOpacity(0.8),
                      size: 25,
                    )),
                IconButton(
                    onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.play(AssetSource(widget.songUrl));
                        }
                    } ,
                    iconSize: 50,
                    icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green,
                      ) ,
                      child: Center(
                        child: isPlaying ? Icon(Icons.pause, color: Colors.white,) : Icon(Icons.play_arrow, color: Colors.white,),
                      ),
                    )),
                IconButton(onPressed: (){
                  // next bài thì dừng bài trước
                  audioPlayer.pause();
                  Navigator.push(
                      context,
                      PageTransition(alignment: Alignment.bottomCenter,
                          child: MusicDetailPage(
                            indexSong: indexSongCurrent + 1,
                            title: songs[indexSongCurrent + 1]['title'],
                            songUrl: songs[indexSongCurrent + 1]['song_url'],
                            color: songs[indexSongCurrent + 1]['color'],
                            description: songs[indexSongCurrent + 1]['description'],
                            img: songs[indexSongCurrent + 1]['img'],
                          ),
                          type: PageTransitionType.scale));
                } ,
                    icon: Icon(Icons.skip_next_outlined,
                      color: Colors.white.withOpacity(0.8),
                      size: 25,
                    )),
                IconButton(onPressed: (){} ,
                    icon: Icon(Icons.reset_tv,
                      color: Colors.white.withOpacity(0.8),
                      size: 25,
                    ))
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.tv_outlined , color: Colors.green, size: 20,),
              Text("   Chomecast is ready" , style: TextStyle(color: Colors.green),)
            ],
          )
        ],
      ),
    );
  }

}
