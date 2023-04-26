import 'package:cached_network_image/cached_network_image.dart';
import 'package:coocoo/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/post.dart';
import '../utils/colors.dart';
import 'commentCard.dart';

class PostContainer extends StatelessWidget {
  final Post?post;

  const PostContainer({
    Key?key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post!),
                const SizedBox(
                  height: 4.0,
                ),
                Text(post!.caption.toString()),
                post?.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 6.0,
                      ),
              ],
            ),
          ),
          post!.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post!.imageUrl.toString()),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post?post;

  const _PostHeader({
    Key?key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post!.user!.imageUrl.toString()),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post!.user!.name.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post!.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        )
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post?post;

  const _PostStats({
    Key?key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                '${post!.likes}',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              '${post!.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            // const SizedBox(
            //   width: 8.0,
            // ),
            // Text(
            //   '${post.shares} Shares',
            //   style: TextStyle(
            //     color: Colors.grey[600],
            //   ),
            // ),
          ],
        ),
        const Divider(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              InkWell(
                onTap:  () {
                },
                child: Icon(
                  MdiIcons.thumbUpOutline,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
              ),
              Text(" Like"),

               Spacer(),
               InkWell(
                 onTap:  () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> CommentSection()));
                 },
                 child: Container(
                   child: Row(children: [
                   Icon(
                     MdiIcons.commentOutline,
                     color: Colors.grey[600],
                     size: 20.0,
                   ),
                   Text(" Comment")
                 ]),),
               )

              // _PostButton(
              //   icon: Icon(
              //     MdiIcons.commentOutline,
              //     color: Colors.grey[600],
              //     size: 20.0,
              //   ),
              //   label: 'Comment',
              //   onTap: (){
              //     print("hhhhhhhhhhhhhhhhhh");
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=> CommentBox()));
              //   },
              // ),
              // _PostButton(
              //   icon: Icon(
              //     MdiIcons.shareOutline,
              //     color: Colors.grey[600],
              //     size: 25.0,
              //   ),
              //   label: 'Share',
              //   onTap: () => print('Share'),
              // ),
            ],
          ),
        )
      ],
    );
  }
}

// class _PostButton extends StatefulWidget {
//   final Icon icon;
//   final String label;
//   final Function onTap;
//
//   const _PostButton({
//     Key key,
//     this.icon,
//     this.label,
//     this.onTap,
//   }) : super(key: key);
//
//   @override
//   State<_PostButton> createState() => _PostButtonState();
// }
//
// class _PostButtonState extends State<_PostButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Material(
//         color: Colors.white,
//         child: InkWell(
//           onTap: () {},
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             height: 25.0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 widget.icon,
//                 const SizedBox(
//                   width: 4.0,
//                 ),
//                 Text(widget.label),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
