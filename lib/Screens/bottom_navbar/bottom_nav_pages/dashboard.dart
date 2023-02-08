import 'package:flutter/material.dart';
import 'package:project_3/api_services/api_sevices.dart';
import 'package:project_3/models/posts_model.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: ApiSevices.fetchPostApi(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }else{
                   return ListView.builder(
                      itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.purple,
                                child: Text(snapshot.data![index].id.toString()),
                              ),
                              title: Text(snapshot.data![index].title.toString()),
                              subtitle: Text(snapshot.data![index].body.toString()),
                            ),
                          );
                        });
                  }
                  },),
          )
        ],
      ),
    );
  }
}
