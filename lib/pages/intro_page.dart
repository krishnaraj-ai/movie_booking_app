import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import '../widget/primary_button.dart';
import 'package:movie_booking_app/pages/login_user_input.dart';
import 'package:movie_booking_app/pages/signup_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/images/cinema_logo.png")),
                  ),
                ),
                Text(
                  "MOVIE BOOKING APP",
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: screenWidth * .7,
                    child: Text(
                      "Immerse yourself in the word of cinema",
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.nunito(color: Colors.black, fontSize: 16),
                    )),
                const SizedBox(
                  height: 60,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpInput(
                          type: "SignUp",
                        ),
                      )),
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(25),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I already have an account?",
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginInput(
                          type: "Login",
                        ),
                      )),
                  child: Text(
                    "Login",
                    style: GoogleFonts.nunito(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),

                const SizedBox(
                  height: 70,
                ),
                Column(
                  children: [
                    Text("Or Sign up with",
                        style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: screenWidth * .5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: const Image(
                                image:
                                    AssetImage("lib/images/google_logo.png")),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
