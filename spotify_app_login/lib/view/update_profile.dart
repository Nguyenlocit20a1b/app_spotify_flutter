import 'package:flutter/material.dart';
class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  late String _displayName;
  late String _email;
  late String _profileImageUrl;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Cài đặt hồ sơ'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Tên hiển thị',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _displayName = value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'URL hình đại diện',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _profileImageUrl = value;
                  });
                },
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  // Xử lý cài đặt hồ sơ
                },
                child: Text('Cài đặt'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

