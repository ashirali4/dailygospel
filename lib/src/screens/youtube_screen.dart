import 'package:dailygospel/src/model.dart';
import 'package:dailygospel/src/utils/enum_message.dart';
import 'package:dailygospel/src/widgets/homepage_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class YouTubeScreen extends StatefulWidget {
  final SingleLinkModel youtubeUrl;
  final List<SingleLinkModel> listurl;
  const YouTubeScreen({
    Key? key,
    required this.youtubeUrl,
    required this.listurl

  }) : super(key: key);

  @override
  _YouTubeScreenState createState() => _YouTubeScreenState();
}

class _YouTubeScreenState extends State<YouTubeScreen> {
  YoutubePlayerController? controller;

  @override
  void initState() {
    controller = YoutubePlayerController(
      initialVideoId: widget.youtubeUrl.id,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff990000),
        title: Text(
            'Sunday Mass Briefing',
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
              Text(widget.youtubeUrl.title,
                style: const TextStyle(
                    fontSize: 21
                ),),
              SizedBox(height: 30,),
              YoutubePlayer(
                controller: controller!,
                liveUIColor: Colors.amber,
              ),
              SizedBox(height: 40,),
              HomepageButtonWidget(buttonText: 'Previous Videos', buttonClick: (){},),
              SizedBox(height: 10,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.listurl.length,
                itemBuilder: (context, position) {
                  return listViewItems(widget.listurl[position].id, widget.listurl[position].title);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget listViewItems(String videoId,String data){
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        height: 60,
        child: Text(data,
          style: const TextStyle(
              fontSize: 21
          ),),
      ),
    );
  }
}
