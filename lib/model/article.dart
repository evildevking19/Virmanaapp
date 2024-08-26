
class Article {
  final int id;
  final String title;
  final String content;
  final String created;
  final String image;



  Article( {required this.id, required this.title,required this.content, required this.created,required this.image});

  factory Article.fromJson(Map<String, dynamic> parsedJson){
    return Article(
      id: parsedJson['id'],
      title : parsedJson['title'],
      content : parsedJson['content'],
      created : parsedJson ['created'],
      image : parsedJson ['image'],
    );
  }
}
