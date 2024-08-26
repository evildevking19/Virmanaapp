class Answer {
  final int id;
  final String answer;
  int votes;

  Answer({required this.id, required this.answer, required this.votes});

  factory Answer.fromJson(Map<String, dynamic> parsedJson){
    return Answer(
        id: parsedJson['id'],
        answer : parsedJson['answer'],
        votes : parsedJson ['votes']
    );
  }
}
