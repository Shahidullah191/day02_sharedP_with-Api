import 'package:flutter/material.dart';
import 'package:project_3/Screens/bottom_navbar/bottom_nav_pages/bottom_navbar_other_spages/dashboard_details.dart';
import 'package:project_3/api_services/api_sevices.dart';
import 'package:project_3/models/posts_model.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
   Future<bool> showExitPopup() async {
    return await showDialog( //show confirm dialogue 
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App'),
        content: Text('Do you want to exit an App?'),
        actions:[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
            ),
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:Text('No'),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green
            ),
            onPressed: () => Navigator.of(context).pop(true),
            //return true when click on "Yes"
            child:Text('Yes'),
          ),

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }

  //ApiServices apiServices = ApiServices();
  // List items  = ApiServices.fetchPostApi() as List;
  //  bool isLoading = false;
  //  bool hasMoreData = true;
  //
  //  void getData() async{
  //    if(isLoading && hasMoreData){
  //      isLoading = true;
  //      setState(() {});
  //
  //      await Future.delayed(Duration(seconds: 1));
  //
  //      List dataList = items.length>100? []: List.generate(20, (index) => (index) => "Index : ${index + items.length}");
  //
  //      if(dataList.isEmpty){
  //        hasMoreData = false;
  //      }
  //      items.addAll(dataList);
  //
  //      isLoading = false;
  //      setState(() {
  //
  //      });
  //    }
  //
  //  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Dashboard"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: ApiServices.fetchPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DashboardDetails(
                                  id: snapshot.data![index].id.toString(),
                                ),
                              ));
                            },
                            child: Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.purple,
                                  child:
                                      Text(snapshot.data![index].id.toString()),
                                ),
                                title:
                                    Text(snapshot.data![index].title.toString()),
                                subtitle:
                                    Text(snapshot.data![index].body.toString()),
                              ),
                            ),
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
