
import 'dart:convert';

class Status {
  final int id;
  final String kind;
  final String description;
  final bool review;
  final bool comment;
   int comments;
   int downloads;
   int views;
  final String username;
  final int userid;
  final String userimage;
  final bool trusted;
  final String type;
  final String extension;
  final String thumbnail;
  final String original;
  final String image;
  final String color;
  final String created;
  int likes;
  final String quote;
   int shares;
  bool liked;


  Status(
    {
        required this.id,
        required this.kind,
        required this.description,
        required this.review,
        required this.comment,
        required this.comments,
        required this.downloads,
        required this.views,
        required this.username,
        required this.userid,
        required this.userimage,
        required this.trusted,
        required this.type,
        required this.extension,
        required this.thumbnail,
        required this.original,
        required this.image,
        required this.color,
        required this.created,
        required this.likes,
        required this.shares,
        required this.quote,
        this.liked = false
    }
  );

  factory Status.fromJson(Map<String, dynamic> parsedJson){
    return Status(
      id: parsedJson['id'],
      kind : parsedJson['kind'],
      description : parsedJson ['description'],
      review : parsedJson ['review'],
      comment : parsedJson ['comment'],
      comments : parsedJson ['comments'],
      downloads : parsedJson ['downloads'],
      views : parsedJson ['views'],
      username : parsedJson ['username'],
      userid : parsedJson ['userid'],
        userimage : parsedJson ['userimage'],
        trusted : parsedJson ['trusted'],
      type : parsedJson ['type'],
      extension : parsedJson ['extension'],
      thumbnail : parsedJson ['thumbnail'],
      original : parsedJson ['original'],
        image : parsedJson ['image'],
      color : parsedJson ['color'],
      created : parsedJson ['created'],
      likes : parsedJson ['likes'],
      shares : parsedJson ['shares'],
        quote : parsedJson ['quote'],
        liked : parsedJson ['liked']
    );
  }

  static Map<String, dynamic> toMap(Status post) => {
    'id': post.id,
    'kind': post.kind,
    'description': post.description,
    'review': post.review,
    'comment': post.comment,
    'comments': post.comments,
    'downloads': post.downloads,
    'views': post.views,
    'username': post.username,
    'userid': post.userid,
    'userimage': post.userimage,
    'trusted': post.trusted,
    'type': post.type,
    'extension': post.extension,
    'thumbnail': post.thumbnail,
    'original': post.original,
    'image': post.image,
    'color': post.color,
    'created': post.created,
    'likes': post.likes,
    'shares': post.shares,
    'quote': post.quote,
    'liked': post.liked,
  };

  static String encode(List<Status> posts) => json.encode(
    posts
        .map<Map<String, dynamic>>((post) => Status.toMap(post))
        .toList(),
  );

  static List<Status> decode(String posts) =>
      (json.decode(posts) as List<dynamic>)
          .map<Status>((item) => Status.fromJson(item))
          .toList();
}
