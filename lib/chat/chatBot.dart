// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:graduation_project/diseases/Bone_Fracture_Detection.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  var chatController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? mess;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        elevation: 5,
        centerTitle: true,
        title: Text(
          "Chat Bot",
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 22,
              wordSpacing: 3,
              fontWeight: FontWeight.w600,
              fontFamily: "Kalam"),
        ),
        leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blueAccent,
            )),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(left: 5, top: 5),
          child: Form(
            key: formKey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                    maxLines: 1,
                    cursorColor: Colors.blueGrey,
                    autocorrect: true,
                    autofillHints: ['diagnoses,diseases,brain'],
                    controller: chatController,
                    decoration: InputDecoration(
                        hintText: 'how can i help you,today?',
                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 27.0),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          mess = chatController.text;
                        }
                        setState(() {
                          mess = mess;
                          chatController.clear();
                        });
                      },
                      icon: Icon(Icons.send),
                      iconSize: 35,
                      color: Colors.blueGrey,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        // physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              textAlign: TextAlign.center,
              'Welcome to MBot\n i\'m here to help you',
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Kalam',
                  letterSpacing: 2,
                  color: Colors.blue.shade400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(
                              0,
                              2,
                            ),
                            blurRadius: 3)
                      ],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                      color: Colors.grey[300]!.withOpacity(0.9)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Some Suggestios",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        buildCustomChatButton(
                          context,
                          text: "To Bone Fracture Detection",
                          onpress: () {},
                        ),
                        buildCustomChatButton(
                          context,
                          text: "To Brain Tumor Detection",
                          onpress: () {},
                        ),
                        buildCustomChatButton(
                          context,
                          text: "To Alzheimer Detection",
                          onpress: () {},
                        ),
                        buildCustomChatButton(
                          context,
                          text: "To Heart Detection",
                          onpress: () {},
                        ),
                        buildCustomChatButton(
                          context,
                          text: "To Pneumonia Detection",
                          onpress: () {},
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          if (mess == null)
            Container()
          else
            buildMessageFromUser(context, mess),
          if (mess == 'help me')
            buildMessageFromBot(context,
                messBot: "it's ok, don't worry i will help you"),
          if (mess == 'help me to diagnose bone frature')
            buildMessageFromBot(context,
                messBot: buildCustomChatButton(context,
                    text: 'to diagnose click here', onpress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BoneFractureDetection(),
                      ));
                }))
        ],
      ),
    );
  }
}

Widget buildCustomChatButton(context,
        {required String text, required VoidCallback onpress}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey[200])),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // color: Colors.grey[400],
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  )),
            ),
          ],
        ),
        onPressed: onpress,
      ),
    );

Widget buildMessageFromBot(context, {required dynamic messBot}) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width * 0.65,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(
                        0,
                        2,
                      ),
                      blurRadius: 3)
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                color: Colors.grey[300]!.withOpacity(0.9)),
            child: Row(
              children: [
                Expanded(child: messBot),
              ],
            ),
          )
        ]));

Widget buildMessageFromUser(context, message) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.4),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: Color.fromARGB(255, 36, 87, 105).withOpacity(0.8),
                    ),
                    child: Text(
                      "$message",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
