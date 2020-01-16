
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List users;
  Map datas;
  Future setUser() async {
   String url = "https://pixabay.com/api/?key=14001068-da63091f2a2cb98e1d7cc1d82&q=beautiful&image_type=photo&pretty=true";
    http.Response response = await http.get(url);
    // debugPrint(response.body);
    datas =  json.decode(response.body); 
    setState(() {
    users = datas["hits"];
    });
  }
  @override
  void initState() {
    super.initState();
    setUser();
  }
  Widget build(BuildContext context) {
    return Scaffold(
     
     appBar: AppBar( 
      
       title: Text("User Information"),
     ),
     body: ListView.builder(  
       itemCount: users == null ? 0 : users.length,
       itemBuilder: (BuildContext context, int i) {
         return Card (         
             child: Column(
                children: <Widget>[
                Container(padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                    backgroundImage: NetworkImage("${users[i]["previewURL"]}"),
                    ),
                    SizedBox(width: 20.0,),
                    Text("${users[i]["user"]}", style: TextStyle(fontSize: 20.0),)
                  ],
                )
                ),
                Container(padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Image.network("${users[i]["largeImageURL"]}",
                      fit: BoxFit.cover,
                      width: 383,
                      ),
                    )
                  ],
                 )
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
