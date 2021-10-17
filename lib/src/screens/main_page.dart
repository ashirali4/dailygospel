import 'package:dailygospel/src/screens/message_screen.dart';
import 'package:dailygospel/src/screens/youtube_screen.dart';
import 'package:dailygospel/src/utils/enum_message.dart';
import 'package:dailygospel/src/widgets/homepage_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void onClick(String messageHeading, String message, String messageTypeText,
      MessageType messageType) {
    Get.to(() => MessageScreen(
          message: message,
          messageTypeText: messageTypeText,
          messageType: messageType,
          messageHeading: messageHeading,
        ));
  }

  void youtubeCall(String messageHeading, String url, List<String> urlList) {
    Get.to(() => YouTubeScreen(
          messageHeading: messageHeading,
          listurl: [],
          youtubeUrl: '',
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 20,
          left: 25),
          child: DropdownButton(
            value: Locale('en'),
            onChanged: (v) => setState(() { }),
            icon: Icon(Icons.language,color: Colors.black,),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20
            ),
            items: const [
               DropdownMenuItem(
                value: Locale('en'),
                child: Text('English'),
              ),
              //  DropdownMenuItem(
              //   value: Locale('ar'),
              //   child: Text('العربية'),
              // )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 20),
            child: Image.asset('assets/sign.png'),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomepageButtonWidget(
                buttonText: 'Today\'s Gospel',
                buttonClick: () {
                  onClick(MESSAGE_HEADING, MESSAGE, 'Today\'s Gospel',
                      MessageType.Gospel);
                },
              ),
              HomepageButtonWidget(
                buttonText: 'Today\'s Message',
                buttonClick: () {
                  onClick(MESSAGE_HEADING, MESSAGE, 'Today\'s Message',
                      MessageType.Message);
                },
              ),
              HomepageButtonWidget(
                buttonText: 'Sunday Mass Briefing',
                buttonClick: () {
                  youtubeCall('26 September 2021 XXVI', '', []);
                },
              ),
              this._imageSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageSection() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: ClipOval(
          child: Image.network(
        'https://i.pinimg.com/736x/9e/77/2d/9e772d5eeec836fc4d1b70a0d79334ec--christian-faith-lam.jpg',
        width: 300,
        height: 300,
        fit: BoxFit.cover,
      )),
    );
  }
}
