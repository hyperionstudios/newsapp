import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/models/post.dart';

class SinglePost extends StatefulWidget {
  final Post post;

  SinglePost(this.post);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            expandedHeight: 300.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.post.featuredImage),
                      fit: BoxFit.cover),
                ),
              ),
            )),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, position) {
            if( position == 0 ){
              return Container(
                height: 500,
                color: Colors.teal,
              );
            }else{
              return Container(
                height: 250,
                color: getRandomColor(),
              );
            }

          }, childCount: 25),
        ),
      ],
    );
  }

  Color getRandomColor({int minBrightness = 50}) {
    final random = Random();
    assert(minBrightness >= 0 && minBrightness <= 255);
    return Color.fromARGB(
      0xFF,
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
    );
  }
}
