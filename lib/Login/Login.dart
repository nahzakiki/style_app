import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:style_app/IndexPreview.dart';
import 'package:style_app/services/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  GoogleSignInAccount? _googleUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 241, 240, 1.0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/LOGO1.png',
                fit: BoxFit.contain,
                height: 150,
                width: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Text(
                  'Create account / Login',
                  style: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(172, 170, 169, 1.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: SocialLoginButton(
                    onPressed: () async {
                      // Call _googleSignIn and assign its result to _googleUser
                      _googleUser = await _googleSignIn();
                      if (_googleUser != null) {
                        // If _googleUser is not null, navigate to IndexPreview
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => IndexPreview()));
                      } else {
                        // If _googleUser is null, show a SnackBar with an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Sign in failed')));
                      }
                    },
                    buttonType: SocialLoginButtonType.google,
                    text: 'Continue with Google',
                    borderRadius: 60,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: SocialLoginButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const IndexPreview();
                      }));
                    },
                    buttonType: SocialLoginButtonType.facebook,
                    text: 'Continue with Facebook',
                    borderRadius: 60,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<GoogleSignInAccount?> _googleSignIn() async {
    return await GoogleSignInApi.login();
  }
}
