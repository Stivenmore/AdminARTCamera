// ignore_for_file: file_names

import 'package:admin_camera_direct/screens/utils/responsive.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class DetailVideo extends StatefulWidget {
  final String url;
  const DetailVideo({Key? key, required this.url}) : super(key: key);

  @override
  State<DetailVideo> createState() => _DetailVideoState();
}

class _DetailVideoState extends State<DetailVideo> {
  late FlickManager flickManager;

  @override
  void initState() {
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return WillPopScope(
      onWillPop: ()async{
       // flickManager.flickControlManager!.pause();
        return true;
      },
      child: Scaffold(
              appBar: AppBar(
        backgroundColor: Colors.blue[800],
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [IconButton(onPressed: () {
          Share.share(widget.url, subject: "Mira esto!");
        }, icon: const Icon(Icons.share))],
      ),
        body: SizedBox(
          height: responsive.height,
          width: responsive.width,
          child: FlickVideoPlayer(
            flickManager: flickManager,
            flickVideoWithControls: const FlickVideoWithControls(
              closedCaptionTextStyle: TextStyle(fontSize: 8),
              controls: FlickPortraitControls(),
            ),
            flickVideoWithControlsFullscreen: const FlickVideoWithControls(
              controls: FlickLandscapeControls(),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }
}
