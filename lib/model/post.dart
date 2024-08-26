
import 'dart:convert';

class Post {
  final int id;
  final String title;
  final String image;
  final String created;
  final String video;
  final String date;
  final String content;
  int views;
  int shares;
  final String type;
  int comments;
  bool comment;
  bool favorite;
  Post({required this.id, required this.title, required this.image, required this.created, required this.views,required this.shares,required this.comments,required this.comment,required this.content,required this.type,required this.date,required this.video,this.favorite = false});

  factory Post.fromJson(Map<String, dynamic> parsedJson){
    return Post(
        id: parsedJson['id'],
        title : parsedJson['title'],
        image : parsedJson ['image'],
        content : parsedJson ['content'],
        created : parsedJson ['created'],
        date : parsedJson ['date'],
        views : parsedJson ['views'],
        shares : parsedJson ['shares'],
      comments : parsedJson ['comments'],
      comment : parsedJson ['comment'],
        video : parsedJson ['video'],
        type : parsedJson ['type'],
        favorite : parsedJson ['favorite'],
    );
  }

  static Map<String, dynamic> toMap(Post post) => {
    'id': post.id,
    'title': post.title,
    'image': post.image,
    'created': post.created,
    'video': post.video,
    'date': post.date,
    'content': post.content,
    'views': post.views,
    'shares': post.shares,
    'type': post.type,
    'comments': post.comments,
    'comment': post.comment,
    'favorite': post.favorite,
  };

  static String encode(List<Post> posts) => json.encode(
    posts
        .map<Map<String, dynamic>>((post) => Post.toMap(post))
        .toList(),
  );

  static List<Post> decode(String posts) =>
      (json.decode(posts) as List<dynamic>)
          .map<Post>((item) => Post.fromJson(item))
          .toList();
}
