int get connectTimeout => 30000;
int get receiveTimeout => 30000;
Map<String, String> get headers => <String, String>{
      'accept': '*/*',
      'Content-Type': 'application/json',
    };
String get mapAPI => 'https://maps.googleapis.com/maps/api';
const apiKey = 'AIzaSyAfr4FJ-Xt4f_R0USADABvsovV6FKP7qVE';
