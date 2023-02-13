import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullImageView extends StatefulWidget {

   String image;
   FullImageView({Key? key, required this.image}) : super(key: key);

  @override
  State<FullImageView> createState() => _FullImageViewState();
}

class _FullImageViewState extends State<FullImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Full Image View"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: PhotoView(
            imageProvider: NetworkImage(widget.image),
        ),
      ),
    );
  }
}
