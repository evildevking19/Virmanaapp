
class Trophy {
  final int id;
  final String title;
  final String description;
  final String content;
  final String image;
  final String icon;
  final int position;
  final String number;


  Trophy( {required this.id, required this.title,required this.description,required this.content, required this.image,required this.icon,required this.position,required this.number});

  factory Trophy.fromJson(Map<String, dynamic> parsedJson){
    return Trophy(
      id: parsedJson['id'],
      title : parsedJson['title'],
      description : parsedJson['description'],
      content : parsedJson['content'],
      image : parsedJson ['image'],
      icon : parsedJson ['icon'],
      position : parsedJson ['position'],
      number : parsedJson ['number'],
    );
  }
}
