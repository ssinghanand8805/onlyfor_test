import 'package:flutter/material.dart';

import '../data/data.dart';

class FriendsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Teammates', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 15.0),
            Column(
              children: List.generate(userMessages.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child:  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(userMessages[index]["img"],),
                        radius: 40.0,
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(userMessages[index]['name'], style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                            SizedBox(height: 15.0),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5.0)
                                  ),
                                  child: Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                                ),
                                SizedBox(width: 10.0),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(5.0)
                                  ),
                                  child: Text('Delete', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
            SizedBox(height: 20.0)
          ],
        )
      ),
    );
  }
}