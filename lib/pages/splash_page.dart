import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nlug_miniproject/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamed(context, '/main');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrayColor,
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: defaultMarginTop,
                    left: defaultMargin,
                  ),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Your ',
                          style: cyanTextStyle.copyWith(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: regular,
                          ),
                        ),
                        TextSpan(
                          text: 'cheating\n',
                          style: whiteTextStyle.copyWith(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: regular,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 1,
                            decorationColor: kWhiteColor,
                          ),
                        ),
                        TextSpan(
                          text: 'studying assistant.',
                          style: cyanTextStyle.copyWith(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 280,
              ),
              child: Column(
                children: [
                  Text(
                    "Welcome to Budi",
                    style: whiteTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: light,
                      letterSpacing: 3.20,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "It's Brainly without the ",
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                        TextSpan(
                          text: "#maaf kalau salah",
                          style: cyanTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 72,
              ),
              height: 320,
              width: 320,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/budi_logo.png'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
