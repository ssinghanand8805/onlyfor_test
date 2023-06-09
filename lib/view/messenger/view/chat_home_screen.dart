
import 'package:flutter/material.dart';

import '../../../data/data.dart';
import '../../../utils/colors.dart';
import 'chat_details.dart';

class ChatPageScreen extends StatefulWidget {
  @override
  _ChatPageScreenState createState() => _ChatPageScreenState();
}

class _ChatPageScreenState extends State<ChatPageScreen> {
  TextEditingController _searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),
                          fit: BoxFit.cover)),
                ),
                Text(
                  "Chats",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.edit)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: grey, borderRadius: BorderRadius.circular(15)),
              child: TextField(
                cursorColor: black,
                controller: _searchController,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: black.withOpacity(0.5),
                    ),
                    hintText: "Search",
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: List.generate(userMessages.length, (index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatDetailScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 75,
                          height: 75,
                          child: Stack(
                            children: <Widget>[
                              userMessages[index]['story']
                                  ? Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: blue_story, width: 3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                userMessages[index]['img']),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              )
                                  : Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            userMessages[index]['img']),
                                        fit: BoxFit.cover)),
                              ),
                              userMessages[index]['online']
                                  ? Positioned(
                                top: 48,
                                left: 52,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Palette.online,
                                      shape: BoxShape.circle,
                                      border:
                                      Border.all(color: white, width: 3)),
                                ),
                              )
                                  : Container()
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              userMessages[index]['name'],
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 135,
                              child: Text(
                                userMessages[index]['message'] +
                                    " - " +
                                    userMessages[index]['created_at'],
                                style: TextStyle(
                                    fontSize: 15, color: black.withOpacity(0.8)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ));
  }
}