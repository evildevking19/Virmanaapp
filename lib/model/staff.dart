
class Staff {
  final int id;
  final String name;
  final String status;
  final String image;
  final String bio;


  Staff({required this.id, required this.name,required this.status, required this.image,required this.bio});

  factory Staff.fromJson(Map<String, dynamic> parsedJson){
    return Staff(
      id: parsedJson['id'],
      name : parsedJson['name'],
      status : parsedJson['status'],
      image : parsedJson ['image'],
      bio : parsedJson ['bio'],
    );
  }
}
