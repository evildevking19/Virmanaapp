
class Team {
  final int id;
  final String title;
  final String subtitle;
  final String image;
  final String icon;
  final int position;
  final String type;


  Team( {required this.id, required this.title,required this.subtitle, required this.image,required this.icon,required this.position, required this.type});

  factory Team.fromJson(Map<String, dynamic> parsedJson){
    return Team(
      id: parsedJson['id'],
      title : parsedJson['title'],
      subtitle : parsedJson['subtitle'],
      image : parsedJson ['image'],
      icon : parsedJson ['icon'],
      position : parsedJson ['position'],
      type : parsedJson ['type'],
    );
  }
}
