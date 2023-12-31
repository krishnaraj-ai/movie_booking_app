import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import '../controller/auth_controller.dart';
import '../pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LoginInput extends StatefulWidget {
  LoginInput({super.key, required this.type});
  String type;

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  bool showAnimated = false;
  bool showPass = false;
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  //final authController = Get.find<AuthController>();

  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 1), () {
      setState(() {
        showAnimated = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            setState(() {
              showAnimated = false;
            });
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        title: Text(
          widget.type,
          style: GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: screenWidth,
                height: screenHeight,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * .2,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Hi user! Please login",
                      style:
                          GoogleFonts.nunito(color: Colors.black, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email Address : ",
                              style: GoogleFonts.nunito(
                                  color: Colors.black, fontSize: 14),
                            ),
                            Container(
                              width: screenWidth * .8,
                              height: 50,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: TextField(
                                controller: emailC,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password : ",
                              style: GoogleFonts.nunito(
                                  color: Colors.black, fontSize: 14),
                            ),
                            Container(
                              width: screenWidth * .8,
                              height: 50,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: TextField(
                                controller: passwordC,
                                obscureText: !showPass,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            showPass = !showPass;
                                          });
                                        },
                                        icon: Icon(
                                          showPass
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                        ))),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: GoogleFonts.nunito(
                                  color: Colors.black,
                                  textStyle: const TextStyle(
                                      decoration: TextDecoration.underline)),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        /*                       GestureDetector(
                          onTap: () {
                            //                           if (widget.type == "Login") {
                            //authController.login(emailC.text, passwordC.text);
                            //                         } else {
                            //authController.signUp(emailC.text, passwordC.text);
                            //                       }
                          },
                          child: PrimaryButton(
                            title: "Sign Up",
                            width: screenWidth * .8,
                            height: 50,
                          ),
                        ),*/

                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const homePage(),
                            ),
                          ),
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(25),
                            child: const Center(
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //    ),
                      ],
                      // ],
                    ),
                    //     ),
                    /*             AnimatedPositioned(
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 80),
                bottom: showAnimated ? -screenHeight * .08 : screenHeight * .3,
                right: showAnimated ? -screenWidth * .15 : screenWidth * .18,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: showAnimated ? 1 : 0,
                ),
              ), */
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
