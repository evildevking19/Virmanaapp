
import 'package:myteam/model/value.dart';

class Player {
  final int id;
  final String fname;
  final String lname;
  final String image;
  final String number;

  final String position;

  final String age;

  final String height;

  final String weight;

  final String country;
  final String country_image;

  final List<Value> socials ;
  final List<Value> statistics;




  Player( {required this.id, required this.fname,required this.lname, required this.image,required this.number,required this.position, required this.age, required this.height, required this.weight, required this.country, required this.country_image, required this.socials, required this.statistics});

  factory Player.fromJson(Map<String, dynamic> parsedJson){
     List<Value> _socials = [];
     List<Value> _statistics =  [];
    if(parsedJson['socials'] !=null)
    for(Map<String, dynamic> i in parsedJson['socials']){
      Value value = Value.fromJson(i);

      _socials.add(value);
    }

    if(parsedJson['statistics'] !=null)
    for(Map<String, dynamic> i in parsedJson ['statistics']){
      Value value = Value.fromJson(i);
     _statistics.add(value);
   }

    return Player(
        id: parsedJson['id'],
        fname : parsedJson['fname'],
        lname : parsedJson['lname'],
        image : parsedJson ['image'],
        number : parsedJson ['number'],
        position : parsedJson ['position'],
        age : parsedJson ['age'],
        height : parsedJson ['height'],
        weight : parsedJson ['weight'],
        country : parsedJson ['country'],
        country_image : parsedJson ['country_image'],
        socials : _socials,
        statistics : _statistics
    );
  }
}
