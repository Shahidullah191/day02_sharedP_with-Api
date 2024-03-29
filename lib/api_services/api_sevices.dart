import 'dart:convert';

import 'package:project_3/models/details_model.dart';
import 'package:project_3/models/posts_model.dart';
import 'package:http/http.dart' as http;

import '../models/image_api_model.dart';

class ApiServices{
  
//fetch posts api...................
  static Future <List<PostsModel>> fetchPostApi() async {
    List<PostsModel> postsList = [];

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    final data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for (Map<String, dynamic> i in data) {
        postsList.add(PostsModel.fromJson(i));
      }
      return postsList;
    }else{
      return postsList;
    }
  }

  //fetch posts api using id ...................

  static Future <DetailsModel> fetchPostApiUsingId({required var id}) async {
    DetailsModel postsDetailsList = DetailsModel();

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));

    final data = jsonDecode(response.body.toString());

    print(response.body);

    if(response.statusCode == 200){
        postsDetailsList=DetailsModel.fromJson(data);
      return postsDetailsList;
    }else{
      return postsDetailsList;
    }
  }

  //fetch posts api using pagination package...................

  static Future <List<PostsModel>> fetchPostApiWithPagination() async {
    List<PostsModel> postsList = [];

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    final data = jsonDecode(response.body.toString());


    if(response.statusCode == 200){
      for (Map<String, dynamic> i in data) {
        postsList.add(PostsModel.fromJson(i));
      }
      return postsList;
    }else{
      return postsList;
    }
  }


  //fetch image api ...................

  static Future <List<ImageModel>> fetchImageApi() async {
    List<ImageModel> imageList = [];
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    print(response.statusCode);
    final data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for (Map<String, dynamic> i in data) {
        imageList.add(ImageModel.fromJson(i));
      }
      print(imageList.first.toString());

      return imageList;
    }else{
      return imageList;
    }
  }



}