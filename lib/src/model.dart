class MessageModel{
  String heading;
  String message;
  MessageModel(this.heading,this.message);
}

class SingleLinkModel{
  String title;
  String id;
  SingleLinkModel(this.id,this.title);
}

class YouTubeLink{
  SingleLinkModel currentLink;
  List<SingleLinkModel> previousLinks;
  YouTubeLink(this.currentLink,this.previousLinks);
}

class AppDataModel{
  MessageModel dailyGospel;
  MessageModel messageModel;
  YouTubeLink links;
  AppDataModel(this.dailyGospel,this.messageModel,this.links);
}