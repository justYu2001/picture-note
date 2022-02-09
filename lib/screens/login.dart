import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picture_note/services/google_%20authentication_services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/welcome_page_background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            const SizedBox(
              height: 84.0,
            ),
            const Image(
              image: AssetImage("assets/images/logo.png"),
              width: 156.0,
            ),
            Stack(
              children: [
                Text(
                  'Picademy',
                  style: GoogleFonts.bitter(
                    textStyle: TextStyle(
                      fontSize: 60.0,
                      fontStyle: FontStyle.italic,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3.0
                        ..color = Colors.black
                    )
                  ),
                ),
                Text(
                  'Picademy',
                  style: GoogleFonts.bitter(
                    textStyle: const TextStyle(
                      fontSize: 60.0,
                      fontStyle: FontStyle.italic,
                      color: Color(0xfff1b248),
                    )
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 96.0,
                  horizontal: 48.0,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 18.0,
                      )),
                    ),
                    child: Row(
                      children: const [
                        Image(
                          image: AssetImage("assets/images/google_logo.png"),
                          height: 24.0,
                          width: 24.0,
                        ),
                        SizedBox(
                          width: 18.0,
                        ),
                        Text(
                          'Continue with Google',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      final googleAuthenticationService =
                          GoogleAuthenticationService();
                      googleAuthenticationService.signIn();
                    },
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
