import 'package:http/http.dart' as http;
import 'dart:convert';

const baseUrl = 'https://apiadvisor.climatempo.com.br';

const token = 'f37080f891482f9a7918d485419845a7';

String url = '$baseUrl/api/v1/weather/locale/3693/current?token=$token';

Future<Map<String, dynamic>> getWeather() async {
  http.Response response = await http.get(Uri.parse(url));
  if(response.statusCode != 200)
    throw response.body;

  Map<String, dynamic> responseJson = json.decode(response.body);

  return responseJson;  
}