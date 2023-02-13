import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api_services/api_sevices.dart';
import '../../../models/image_api_model.dart';
import '../bottom_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'bottom_navbar_other_spages/full_image_view.dart';


class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: (() async => await Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavBar(),
            ))),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text("Image in Gridview"),
            centerTitle: true,
          ),
          body:  Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: ApiServices.fetchImageApi(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 2.0,
                              mainAxisSpacing: 2.0
                          ),
                          shrinkWrap: true,

                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FullImageView(
                                    image: snapshot.data![index].thumbnailUrl.toString(),
                                  ),
                                ));
                              },
                              child: Column(
                                //alignment: Alignment.center,
                                children: [
                                  Card(
                                    child: Image(image: NetworkImage(snapshot.data![index].thumbnailUrl.toString()) ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 20, right: 20),
                                    child: Text(snapshot.data![index].title.toString(),
                                    overflow: TextOverflow.ellipsis, ),
                                  ),
                                ],
                              )
                            );
                          });
                    }
                  },
                ),
              )
            ],
          ),
        ),
    );
  }
}

