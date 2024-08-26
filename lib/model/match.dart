
import 'dart:convert';

import 'package:myteam/model/club.dart';
import 'package:myteam/model/competition.dart';

class Match {
  final int id;
  final String title;

  final Club homeclub;
  final Club awayclub;

   String homeresult;
   String awayresult;
   String homesubresult;
   String awaysubresult;
  final String date;
  final String time;
  final String stadium;
  final String highlights;


  final String state;
  final Competition competition;


  Match({
      required this.id,
      required this.title,
      required this.homeresult,
      required this.awayresult,
      required this.homesubresult,
      required this.awaysubresult,
      required this.date,
      required this.time,
      required this.stadium,
      required this.highlights,
      required this.state,
      required this.competition,
      required this.awayclub,
      required this.homeclub
  });

  factory Match.fromJson(Map<String, dynamic> parsedJson){

    Competition _competition = Competition.fromJson(parsedJson['competition']) ;
    Club _homeclub = Club.fromJson(parsedJson['homeclub']) ;
    Club _awayclub = Club.fromJson(parsedJson['awayclub']) ;

    return Match(
      id: parsedJson['id'],
      title : parsedJson['title'],
      homeresult : parsedJson['homeresult'],
      awayresult : parsedJson['awayresult'],
      homesubresult : parsedJson['homesubresult'],
      awaysubresult : parsedJson['awaysubresult'],
        date : parsedJson['date'],
      time : parsedJson['time'],
      stadium : parsedJson['stadium'],
      highlights : parsedJson['highlights'],
      state : parsedJson['state'],
      competition : _competition,
      awayclub: _awayclub,
      homeclub: _homeclub
    );
  }

  static Map<String, dynamic> toMap(Match post) => {
    'id': post.id,
    'title': post.title,
    'homeresult': post.homeresult,
    'awayresult': post.awayresult,
    'homesubresult': post.homesubresult,
    'awaysubresult': post.awaysubresult,
    'time': post.time,
    'date': post.date,
    'stadium': post.stadium,
    'highlights': post.highlights,
    'state': post.state,
    'competition': post.competition,
    'awayclub':post.awayclub,
    'homeclub':post.homeclub
  };


}
