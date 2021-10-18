import 'package:dailygospel/src/net/firebase_functions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Main_Page_Admin extends StatefulWidget {
  const Main_Page_Admin({Key? key}) : super(key: key);

  @override
  _Main_PageState createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page_Admin> {
  TextEditingController todayGospelHeading=TextEditingController();
  TextEditingController todayGospelmessage=TextEditingController();
  TextEditingController messageheading=TextEditingController();
  TextEditingController messagecontent=TextEditingController();
  TextEditingController youtubelinkTitle=TextEditingController();
  TextEditingController youtubelinkid=TextEditingController();
  FirebaseOperations operations = FirebaseOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biblx Admin Manager'),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () async {
                await operations.createData(todayGospelHeading.text, todayGospelHeading.text,
                messageheading.text,messageheading.text,
                youtubelinkid.text,youtubelinkTitle.text);
                Fluttertoast.showToast(
                    msg: "Settings has been Saved",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black87,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                todayGospelHeading.clear();
                todayGospelmessage.clear();
                messageheading.clear();
                messagecontent.clear();
                youtubelinkTitle.clear();
                youtubelinkid.clear();
              },
              child: Center(
                child: Text('Save',style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Row(
               children: [
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(5.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         headingText('Daily Gospel Management'),
                         textFormField('Daily Gospel Heading',todayGospelHeading,false),
                         textFormField('Daily Gospel Message',todayGospelmessage,true),

                       ],
                     ),
                   ),
                 ),
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(5.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         headingText('Today\'s Message Management'),
                         textFormField('Today\'s Message Heading',messageheading,false),
                         textFormField('Today\'s Message Content',messagecontent,true),

                       ],
                     ),
                   ),
                 ),
               ],
             ),
              SizedBox(height: 20,),
              headingText('Youtube Link Management'),
              Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: textFormField('Youtube Video Title',youtubelinkTitle,false),
                  )),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: textFormField('Youtube Video ID',youtubelinkid,false),
                  )),
                ],
              )

            ],
          )
        ),
      ),
    );
  }

  Widget headingText(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget textFormField(String hint,TextEditingController controller,bool isPara) {
    return Container(
      margin: EdgeInsets.only(top: 5,bottom: 5),
      child: TextFormField(
        maxLines: isPara?15:1,
          controller: controller,
          decoration: new InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        hintText: hint,
      )),
    );
  }
}
