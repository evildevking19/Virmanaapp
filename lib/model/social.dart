class Social {
  final int id;
  final String social;
  final String value;
  final String username;
  final String color;
  final String icon;

  Social(  {required this.id, required this.social,required this.value,required this.username, required this.color,required this.icon});

  factory Social.fromJson(Map<String, dynamic> parsedJson){

    return Social(
        id: parsedJson['id'],
        social : parsedJson['social'],
        value : parsedJson['value'],
        username : parsedJson['username'],
        color : parsedJson['color'],
        icon : parsedJson['icon']
    );
  }

  int getColor() {
    String hexColor= this.color;
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
