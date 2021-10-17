import 'package:dailygospel/src/utils/enum_message.dart';
import 'package:dailygospel/src/widgets/homepage_button_widget.dart';
import 'package:flutter/material.dart';
class MessageScreen extends StatefulWidget {
  final MessageType messageType;
  final String  messageTypeText;
  final String message;
  final String messageHeading;
  const MessageScreen({
    Key? key,
    required this.messageType,
    required this.messageTypeText,
    required this.message,
    required this.messageHeading,
  }) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff990000),
        title: Text(
            widget.messageTypeText,
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color:Color(0xffFFE599)
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 25,right: 25,top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.messageHeading,
              style: const TextStyle(
                fontSize: 21
              ),),
              SizedBox(height: 30,),
              Text(widget.message,
                style: const TextStyle(
                    fontSize: 17,
                  backgroundColor: Colors.white,
                  height: 1.4
                ),),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
