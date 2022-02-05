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
              height: 80.0,
            ),
            const Text(
              'Logo',
              style: TextStyle(
                fontSize: 72.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Digitalize your classes',
              style: GoogleFonts.bitter(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 34, 142, 141),
                  fontSize: 28.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 36.0,
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
                          width: 20.0,
                        ),
                        Text(
                          'Continue with Google',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
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
