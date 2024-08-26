import 'package:myteam/model/table.dart';

class Competition {
  final int id;
  final String name;
  final String image;
  final String season;
  final List<Table> tables;
  bool selected = false;


  Competition( {required this.id, required this.name, required this.image,required this.tables, required this.season,this.selected = false});

  factory Competition.fromJson(Map<String, dynamic> parsedJson){


    List<Table> tablesList = [] ;
    var data = parsedJson['tables'];
    if(data != null) {
      for (Map<String, dynamic> i in data) {
        tablesList.add(Table.fromJson(i));
      }
    }

    return Competition(
        id: parsedJson['id'],
        name : parsedJson['name'],
        image : parsedJson['image'],
        tables : tablesList,
        season : parsedJson ['season']
    );
  }
}
