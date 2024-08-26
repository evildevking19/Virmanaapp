import 'dart:convert';

import 'package:myteam/model/header.dart';
import 'package:myteam/model/line.dart';

class Table {
  final int id;
  final String title;
  int columns;
  final List<Line> lines;
  final Header header;

  Table({required this.id, required this.title, required this.columns,required this.lines,required this.header});

  factory Table.fromJson(Map<String, dynamic> parsedJson){

    List<Line> linesList = [] ;
    var data = parsedJson['lines'];
    for(Map<String, dynamic> i in data){
      linesList.add(Line.fromJson(i));
    }
    Header _header = Header.fromJson(parsedJson['header']);
    return Table(
        id: parsedJson['id'],
        title : parsedJson['title'],
        columns : parsedJson ['columns'],
        lines : linesList,
        header : _header,
    );
  }
}
