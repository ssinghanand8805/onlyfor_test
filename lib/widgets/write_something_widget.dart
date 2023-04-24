import 'package:flutter/material.dart';

class WriteSomethingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 28.0,
                  backgroundImage: AssetImage('assets/Mike Tyler.jpg'),
                ),

                SizedBox(width: 7.0),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  height: 75.0,
                  width: MediaQuery.of(context).size.width/1.4,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[400]
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'What\'s on your mind?'),
                  )
                )
              ],
            ),
          ),

          Divider(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.emoji_emotions, size: 20.0, color: Colors.pink,),
                    SizedBox(width: 5.0,),
                    Text('Emoji', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 16.0)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.display_settings_rounded, size: 20.0, color: Colors.green,),
                    SizedBox(width: 5.0),
                    Text('Video', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 16.0)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.broken_image_outlined, size: 20.0, color: Colors.purple,),
                    SizedBox(width: 5.0,),
                    Text('Image', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 16.0)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.poll, size: 20.0, color: Colors.purple,),
                    SizedBox(width: 5.0,),
                    Text('Poll', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 16.0)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}