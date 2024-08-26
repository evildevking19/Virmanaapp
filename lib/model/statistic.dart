class Statistic {
  final int id;
  final String name;
  final String home;
  final String away;


  Statistic({required this.id, required this.name, required this.home,required this.away});

  factory Statistic.fromJson(Map<String, dynamic> parsedJson){
    return Statistic(
        id: parsedJson['id'],
        name : parsedJson['name'],
        home : parsedJson ['home'],
        away : parsedJson ['away'],
    );
  }
}
