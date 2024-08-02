import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:okto_flutter_sdk/okto_flutter_sdk.dart';
import 'package:okto_flutter_starter_app/homepage.dart';
import 'package:okto_flutter_starter_app/okto.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
      'openid',
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5166EE),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(40),
                child: const Text(
                  'Login with google',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 30),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
                    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
                    if (googleAuth != null) {
                      final String? idToken = googleAuth.idToken;
                      final res = await okto.authenticate(idToken: idToken!);
                      if (res is AuthenticationResponse) {
                        await okto.setPin(pin: '123456');
                      }
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    }
                  } catch (e) {
                      throw Exception(e);
                  }
                },
                child: const Text('Login with Google')),

          ],
        ),
      ),
    );
  }
}
