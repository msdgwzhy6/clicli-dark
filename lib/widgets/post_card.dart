import 'package:cached_network_image/cached_network_image.dart';
import 'package:clicili_dark/pages/player_page.dart';
import 'package:clicili_dark/utils/reg_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final Map data;

  PostCard(this.data);

  @override
  State<StatefulWidget> createState() {
    return _PostCardState();
  }
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return PlayerPage(
            id: widget.data['id'],
          );
        }), (Route<dynamic> route) => true);
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: Offset(0.5, 0.5),
              blurRadius: 0.5,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: getSuo(widget.data['content']),
              height: 115,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      widget.data['title'].trimLeft(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    widget.data['time']?.trimLeft() ?? '',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
