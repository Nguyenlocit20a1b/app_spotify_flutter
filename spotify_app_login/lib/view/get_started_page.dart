import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_app_login/view/home_page.dart';
import 'package:spotify_app_login/view/login_page.dart';
class GetStartPage extends StatelessWidget {
  const GetStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 24),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1614680376593-902f74cf0d41?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3BvdGlmeXxlbnwwfHwwfHw%3D&w=1000&q=80'),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('A digital music, podcast, and video service that givers you access to millions' ,
                style: TextStyle(color: Colors.white , fontSize: 17 ,fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 32),
              MaterialButton(
                color: Colors.greenAccent,
                  height: 58,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(31)),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>   LoginPage()) , ),
                child: const Text('Get Started' ,
                  style: TextStyle(color: Colors.white , fontWeight: FontWeight.w500 , fontSize: 23) , ),
              ) ,
              const SizedBox(height: 32)
            ],

          ),
        ),
    );
  }
}
