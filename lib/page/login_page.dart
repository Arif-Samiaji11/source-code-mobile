import 'package:flutter/material.dart';
import 'package:myapps/deteksi.dart';
import 'package:myapps/core/colors.dart';
import 'package:myapps/core/space.dart';
import 'package:myapps/core/text_style.dart';
import 'package:myapps/page/sign_up.dart';
import 'package:myapps/widget/main_button.dart';
import 'package:myapps/widget/text_fild.dart';
import 'package:myapps/page/dashboardss.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBG,
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SpaceVH(height: 50.0),
              Text(
                'Silahkan Masuk Akun Anda',
                style: headline1,
              ),
              SpaceVH(height: 10.0),
              Text(
                'Atau buat akun baru',
                style: headline3,
              ),
              SpaceVH(height: 60.0),
              textFild(
                controller: userName,
                image: 'user.svg',
                hintTxt: 'Username',
              ),
              textFild(
                controller: userPass,
                image: 'hide.svg',
                isObs: true,
                hintTxt: 'Password',
              ),
              SpaceVH(height: 10.0),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lupa Password?',
                      style: headline3,
                    ),
                  ),
                ),
              ),
              SpaceVH(height: 100.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Mainbutton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => MakeDashboardItems()));
                      },
                      btnColor: blueButton,
                      text: 'Sign In',
                    ),
                    SpaceVH(height: 20.0),
                    Mainbutton(
                      onTap: () {},
                      text: 'Sign in with google',
                      image: 'google.png',
                      btnColor: white,
                      txtColor: blackBG,
                    ),
                    SpaceVH(height: 20.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => SignUpPage()));
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Tidak punya akun? ',
                            style: headline.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                          TextSpan(
                            text: ' Sign Up',
                            style: headlineDot.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
