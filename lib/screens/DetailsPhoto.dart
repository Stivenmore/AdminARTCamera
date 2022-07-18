// ignore_for_file: file_names

import 'package:admin_camera_direct/screens/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DetailPhoto extends StatefulWidget {
  final String url;
  const DetailPhoto({Key? key, required this.url}) : super(key: key);

  @override
  State<DetailPhoto> createState() => _DetailPhotoState();
}

class _DetailPhotoState extends State<DetailPhoto> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
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
        child: InteractiveViewer(
          minScale: 0.1,
          maxScale: 2.5,
          child: FadeInImage.assetNetwork(
            placeholder: "assets/art.png",
            image: widget.url,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
