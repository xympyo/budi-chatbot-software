import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:nlug_miniproject/shared/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];
  String activeIndicatorPath = "assets/active_indicator.png";
  String inactiveIndicatorPath = "assets/inactive_indicator.png";
  String normalHint = "Hey, what's going on?";
  String scientificHint = "Einstein here.";
  bool isScientific = false;
  bool isLoading = false;

  void sendMessage() {
    if (_controller.text.isEmpty) return;

    setState(() {
      messages.add(
        {"sender": "user", "text": _controller.text},
      );
      isLoading = true;
    });
    String userMessage = _controller.text;
    _controller.clear();

    getBotResponse(userMessage).then(
      (userMsg) {
        setState(() {
          messages.add({"sender": "bot", "text": "Bot Response: $userMessage"});
          isLoading = false;
        });
      },
    );
  }

  Future<String> getBotResponse(String message) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    return "yes";

    /* 
    TO DO LIST :
    1. CREATE IF ELSE FUNCTION TO HANDLE LOGIC, WHICH API TO CALL (SCIENTIFIC OR NOT)
    JUST BELOW HERE 
    isScientific ? callScienceApi : callNormalApi 
    */

    // final response = await http.post(
    //   Uri.parse("http://127.0.0.1:5000/chatbot"),
    //   headers: {"Content-Type": "application/json"},
    //   body: jsonEncode(
    //     {"message": message},
    //   ),
    // );

    // if (response.statusCode == 200) {
    //   var data = jsonDecode(response.body);
    //   return data["response"];
    // } else {
    //   return "Error: Bot is not available";
    // }
  }

  void changeTopic() {
    setState(() {
      isScientific == false ? isScientific = true : isScientific = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrayColor,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: defaultMarginTop,
              bottom: 24,
            ),
            child: Text(
              "#maaf kalau salah",
              style: cyanTextStyle.copyWith(
                fontSize: 12,
                fontWeight: bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isUser = messages[index]["sender"] == "user";
                return Container(
                  margin: EdgeInsets.only(
                    left: defaultMargin,
                    right: defaultMargin,
                    bottom: 16,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: isUser
                        ? [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: ShapeDecoration(
                                  color: kWhiteColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  messages[index]["text"]!,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: regular,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/user_icon.png"),
                                ),
                              ),
                            ),
                          ]
                        : [
                            Stack(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(isLoading
                                          ? "assets/bot_icon_loading.png"
                                          : "assets/bot_icon.png"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: ShapeDecoration(
                                  color: kCyanColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  messages[index]["text"]!,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: regular,
                                  ),
                                ),
                              ),
                            ),
                          ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              bottom: defaultMargin,
              top: 8,
            ),
            child: Column(
              children: [
                Divider(
                  color: kWhiteColor,
                  thickness: 1.5,
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: kWhiteColor,
                          hintText: isScientific ? scientificHint : normalHint,
                          hintStyle: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                          hintMaxLines: 1,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: sendMessage,
                        icon: Icon(
                          Icons.send,
                          color: kCyanColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: changeTopic,
                      child: Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              isScientific
                                  ? activeIndicatorPath
                                  : inactiveIndicatorPath,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
