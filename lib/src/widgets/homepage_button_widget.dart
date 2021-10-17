import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomepageButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function buttonClick;
  const HomepageButtonWidget({Key? key,
  required this.buttonText,
  required this.buttonClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 15,bottom: 15),
      height: 60,
      child: ElevatedButton(
          child: Text(
              this.buttonText,
              style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Color(0xffFFE599)
              )
          ),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xff990000)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                 const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: Color(0xff990000))
                  )
              )
          ),
          onPressed: () => this.buttonClick()
      ),
    );
  }
}


