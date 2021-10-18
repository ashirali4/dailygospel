import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';

import '../model.dart';

class FirebaseOperations {
  final databaseReference = FirebaseDatabase.instance.reference();

  Future<AppDataModel> readData() async {
    AppDataModel data=AppDataModel(MessageModel('',''), MessageModel('',''),YouTubeLink(SingleLinkModel('',''),[]));
    await databaseReference.once().then((DataSnapshot snapshot) {
      data.messageModel.heading =snapshot.value['appdata']['today_message']['heading'] ?? 'No Data Found';
      data.messageModel.message =snapshot.value['appdata']['today_message']['message'] ?? 'No Data Found';
      data.dailyGospel.heading =snapshot.value['appdata']['daily_gospel']['heading'] ?? 'No Data Found';
      data.dailyGospel.message =snapshot.value['appdata']['daily_gospel']['message'] ?? 'No Data Found';
      data.links.currentLink.id=snapshot.value['appdata']['videos']['current']['id'] ?? 'DB3D-mtWR0c';
      data.links.currentLink.title=snapshot.value['appdata']['videos']['current']['title'] ?? 'No Title Found';
      snapshot.value['appdata']['videos']['previous'].forEach((key, values) {
        data.links.previousLinks.add(SingleLinkModel(values['id'],values['title']));
      });

    });
    return data;
  }



  Future<void> createData(String dailyGospelHeading,String dailyGospelMessage,
      String todaymessageheading,String todaymessagecontent,
      String youtubeid,String youtubeHeading) async {
    if(dailyGospelHeading!='' && dailyGospelMessage!=''){
      await databaseReference.child("appdata").child('daily_gospel').set({
        'heading': dailyGospelHeading,
        'message': dailyGospelMessage
      });
    }
    if(todaymessageheading!='' && todaymessagecontent!=''){
      await databaseReference.child("appdata").child('today_message').set({
        'heading': todaymessageheading,
        'message': todaymessagecontent
      });
    }

    if(youtubeid!='' && youtubeHeading!=''){
      await databaseReference.child('appdata').child("videos").child('current').set({
        'title': youtubeHeading,
        'id': youtubeid
      });
      await databaseReference.child('appdata').child("videos").child('previous').child(youtubeid).set({
        'title': youtubeHeading,
        'id': youtubeid
      });
    }


  }
}