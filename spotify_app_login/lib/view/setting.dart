import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_app_login/view/update_profile.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final userName = user.email.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(onPressed: (){
            }, icon: Icon(Icons.keyboard_arrow_left_outlined , size:  35,)),
            SizedBox(width: 10,),
            Text('Cài đặt hồ sơ'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(0,255,255,255), Colors.black],
          )),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image: NetworkImage(
                              'https://file.tinnhac.com/resize/600x-/2021/07/09/20210709135019-0459.jpeg'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  userName,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
                Text(
                  'Nguoi dung thong thuong',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => UpdateProfile()),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        side: BorderSide.none,
                        shape: StadiumBorder()),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                MenuProfileWidget(
                  title: 'Setting',
                  icon: Icons.settings,
                  onPress: () {},
                ),
                MenuProfileWidget(
                  title: 'Billing Details',
                  icon: Icons.add_card,
                  onPress: () {},
                ),
                MenuProfileWidget(
                  title: 'User Management',
                  icon: Icons.personal_injury_outlined,
                  onPress: () {},
                ),
                const Divider(),
                MenuProfileWidget(
                  title: 'Premium',
                  icon: Icons.workspace_premium,
                  onPress: () {},
                ),
                ListTile(
                  onTap: () {
                    signOut();
                  },
                  leading: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black),
                      child: const
                      Icon(
                        Icons.logout,
                        color: Colors.red,
                      )),
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 23,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuProfileWidget extends StatelessWidget {
  const MenuProfileWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.black),
          child: Icon(
            icon,
            color: Colors.green,
          )),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontSize: 23, fontWeight: FontWeight.w500),
      ),
      trailing: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.green),
          child: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
          )),
    );
  }
}
