import 'dart:convert';

class Comment {
  final int id;
  final String content;
  final String created;
  final String clear;

  final int userid;
  final String username;
  final String userimage;
  final bool enabled;

  Comment( {required this.clear,required this.id, required this.content, required this.created, required this.userid, required this.username, required this.userimage,required this.enabled});

  factory Comment.fromJson(Map<String, dynamic> parsedJson){

    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String _clear = stringToBase64.decode(parsedJson['content']);          // username:password

    return Comment(
            id: parsedJson['id'],
            content : parsedJson['content'],
            created : parsedJson ['created'],
            userid : parsedJson ['userid'],
            username : parsedJson ['username'],
            userimage : parsedJson ['userimage'],
            enabled : parsedJson ['enabled'],
            clear : _clear
    );
  }




}
