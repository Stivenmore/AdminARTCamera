// ignore_for_file: file_names

import 'package:admin_camera_direct/domain/models/doc_models.dart';
import 'package:admin_camera_direct/screens/DetailsPhoto.dart';
import 'package:admin_camera_direct/screens/DetailsVideo.dart';
import 'package:admin_camera_direct/screens/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DetailFolder extends StatefulWidget {
  final DocumentModel doc;
  const DetailFolder({Key? key, required this.doc}) : super(key: key);

  @override
  State<DetailFolder> createState() => _DetailFolderState();
}

class _DetailFolderState extends State<DetailFolder> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: responsive.height,
          width: responsive.width,
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              GestureDetector(
                onTap: () {
                  widget.doc.file0 != null
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPhoto(url: widget.doc.file0!)))
                      : null;
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: widget.doc.file0 != null
                      ? FadeInImage.assetNetwork(
                          height: 150,
                          width: responsive.wp(30),
                          placeholder: "assets/art.png",
                          image: widget.doc.file0!,
                          fit: BoxFit.fitWidth,
                        )
                      : null,
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.doc.file1 != null
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPhoto(url: widget.doc.file1!)))
                      : null;
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: widget.doc.file1 != null
                      ? FadeInImage.assetNetwork(
                          height: 150,
                          width: responsive.wp(30),
                          placeholder: "assets/art.png",
                          image: widget.doc.file1!,
                          fit: BoxFit.fitWidth,
                        )
                      : null,
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.doc.file2 != null
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailVideo(url: widget.doc.file2!)))
                      : null;
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: widget.doc.file2 != null
                      ? Lottie.asset("assets/play.json",
                          height: 150,
                          width: responsive.wp(30),
                          repeat: false,
                          reverse: true)
                      : null,
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.doc.file3 != null
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailVideo(url: widget.doc.file3!)))
                      : null;
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: widget.doc.file3 != null
                      ? Lottie.asset("assets/play.json",
                          height: 150,
                          width: responsive.wp(30),
                          repeat: false,
                          reverse: true)
                      : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
