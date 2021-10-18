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
}