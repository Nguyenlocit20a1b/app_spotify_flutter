import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_app_login/view/home_page.dart';
import 'package:spotify_app_login/view/login_page.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: height / 2,
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.network(
                          'https://www.scdn.co/i/_global/open-graph-default.png'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Millions of songs, free on spotify',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: height,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: height / 1.2,
                          margin: const EdgeInsets.only(left: 20 , right: 20, bottom: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 40),
                          decoration: BoxDecoration(
                             boxShadow: const [
                               BoxShadow(
                                 color: Colors.black45,
                                 blurRadius: 4,
                                 offset: Offset(4,8),
                               )
                             ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(child: Text('Spotify' , style: TextStyle(color: Colors.green , fontWeight: FontWeight.w900 , fontSize: 40 , fontFamily: 'RaleWay'),)),
                              const Text(
                                'Start listening with a free Spotify Account',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: userNameController,
                                cursorColor: Colors.white,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(labelText: 'User Name'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: emailController,
                                cursorColor: Colors.white,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(labelText: 'Email'),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (email) =>
                                email != null && !EmailValidator.validate(email)?'Enter a valid email' : null,

                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: passwordController,
                                cursorColor: Colors.white,
                                textInputAction: TextInputAction.done,
                                decoration:
                                InputDecoration(labelText: 'Password'),
                                obscureText: true,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) => value != null && value.length < 6 ? 'Enter min 6 characters' : null,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  signUp();
                                },
                                color: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(31)),
                                height: 40,
                                child: const Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Row(
                                children: const [
                                  Expanded(
                                    child: Divider(
                                      thickness: 1,
                                      height: 1,
                                      color: Colors.black26,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'or',
                                    style: TextStyle(
                                        color: Colors.black26,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Divider(
                                      thickness: 1,
                                      height: 1,
                                      color: Colors.black26,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 40,
                                    child: OutlinedButton.icon(
                                      label: const Text(
                                        'Sign In With Facebook',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "RobotoCondensed",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(31),
                                        ),
                                        side: const BorderSide(
                                            width: 1, color: Colors.black),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                      ),
                                      icon: const Icon(
                                        Icons.facebook_outlined,
                                        color: Colors.black45,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                               const LoginPage()),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 40,
                                    child: OutlinedButton.icon(
                                      label: const Text(
                                        'Sign In With Apple',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "RobotoCondensed",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(31),
                                        ),
                                        side: BorderSide(
                                            width: 1, color: Colors.black),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                      ),
                                      icon: Icon(Icons.apple,
                                          color: Colors.black45),
                                      onPressed: () {

                                      },
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Forget Password',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ]),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text:   TextSpan(
                                    text:  "Don't have an account?",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black45),
                                    children: [
                                      TextSpan(
                                        text:  '   Sign In now',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ]
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
   Future signUp() async {
    print('click');
    final isValid = formKey.currentState!.validate();
    if(!isValid) return ;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CheckedPopupMenuItem(),)
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
      );
      await FirebaseAuth.instance.currentUser!.displayName == userNameController.text;
    }
    on FirebaseAuthException catch (e) {
      print(e);
    }
    Get.to(() => LoginPage());
  }
}
