import 'package:flutter/material.dart';
import 'package:project_3/api_services/api_sevices.dart';

class DashboardDetails extends StatefulWidget {
  var id;
   DashboardDetails({Key? key, required this.id,}) : super(key: key);

  @override
  State<DashboardDetails> createState() => _DashboardDetailsState();
}

class _DashboardDetailsState extends State<DashboardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  title: Center(
                    child: Text("Id No: "+widget.id,
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ),

              ),
              Expanded(
                child: FutureBuilder(
                  future: ApiSevices.fetchPostApiUsingId(id: widget.id),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {

                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                      child: ListTile(
                        title:
                        Text(snapshot.data!.title.toString()),
                        subtitle:
                        Text(snapshot.data!.body.toString()),
                      ),
                    );


                    }
                  },
                ),
              )

            ],
          )
        ),
      ),
    );
  }
}
