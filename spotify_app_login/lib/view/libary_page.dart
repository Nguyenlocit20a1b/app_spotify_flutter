
import 'package:flutter/material.dart';
import 'package:spotify_app_login/json/songs_json.dart';
class Libary extends StatelessWidget {
  const Libary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3 , right: 3 ),
      child: ListView(
        children: [
          SizedBox(height: 54,),
          MoreTitle(),
          GridView.builder(
            physics: PageScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
              gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) ,
              itemBuilder: ((context, index){
                var song = songs[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius:  BorderRadius.circular(10)
                  ),
                  padding:  EdgeInsets.only(top:10 ),
                  margin:  EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Wrap(
                        children: [
                          PlayListImage(image: song['img']),
                          PlayListImage(image: song['img']),
                          PlayListImage(image: song['img']),
                          PlayListImage(image: song['img']),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Text(song['title'] ,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          fontWeight: FontWeight.w600
                        ),)
                    ],
                  ),
                );
              })),
          TextButton(onPressed: (){},
              child: const Text('See all' ,
                style: TextStyle(
                    color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15
                ),)),
          const SizedBox(height: 8,),
          const Text('You Activity' , style: TextStyle(color:  Colors.white ,
          fontSize: 25,
            fontWeight: FontWeight.w700
          ),),
          SizedBox(height: 10,),
          InkWell(
            onTap: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.favorite, color: Colors.white, size: 25,),
                ),
                Text('Liked Songs' , style:  TextStyle(color: Colors.white, fontWeight: FontWeight.w500 , fontSize: 16),),
                Icon(Icons.keyboard_arrow_right , color: Colors.white, size: 30, )
              ],
            ),
          ),
          Divider(color: Colors.green,),
          InkWell(
            onTap: () {
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.people, color: Colors.white, size: 25,),
                ),
                Text('Follow Artist' , style:  TextStyle(color: Colors.white, fontWeight: FontWeight.w500 , fontSize: 16),),
                Icon(Icons.keyboard_arrow_right , color: Colors.white, size: 30, )
              ],
            ),
          ),
          Divider(color: Colors.green,),
          InkWell(
            onTap: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.mic, color: Colors.white, size: 25,),
                ),
                Text('Follow Podcaster' , style:  TextStyle(color: Colors.white, fontWeight: FontWeight.w500 , fontSize: 16),),
                Icon(Icons.keyboard_arrow_right , color: Colors.white, size: 30, )
              ],
            ),
          ),
          Divider(color: Colors.green,)
        ],
      ),
    );
  }
  Widget MoreTitle() {
    return
      Row (
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Your Library', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24
        ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
            },
                icon: Icon(Icons.search_rounded ,  color: Colors.white,)
            ),
            IconButton(onPressed: (){},
                icon: Icon(Icons.person ,  color: Colors.white,)
            )          ],
        )
      ],
    );
  }
}
class PlayListImage extends StatelessWidget {
  const PlayListImage({Key? key ,  required this.image}) : super(key: key);
  final String image ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: 75,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
          )
      ),
    );
  }
}

