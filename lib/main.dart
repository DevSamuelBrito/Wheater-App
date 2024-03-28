import 'package:flutter/material.dart';
import 'styles.dart';
import 'service.dart';

void main() => runApp(const WheaterApp());

class WheaterApp extends StatelessWidget {
  const WheaterApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF255AF4),
        body: FutureBuilder<Map<String, dynamic>>(
          future: getWeather(),
          builder: (context, snapshot) {

            if(!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  snapshot.data!['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                  ),
                ),
                Column(
                  children: [
                    Image.asset(
                      'images/sol.png',
                      width: 96,
                      height: 96,
                    ),
                    Text(
                      snapshot.data!['data']['condition'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                      ),
                    ),
                    Text(
                      "${snapshot.data!['data']['temperature']}º",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            offset: Offset(4, 4),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset('images/umidade.png'),
                        Text(
                          'HUMIDITY',
                          style: reportTitleText,
                        ),
                        Text("${snapshot.data!['data']['humidity']}", style: reportTitleText),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('images/vento.png'),
                        Text(
                          'WIND',
                          style: reportTitleText,
                        ),
                        Text("${snapshot.data!['data']['wind_velocity']}km/h", style: reportTitleText),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('images/sensacao.png'),
                        Text(
                          'FEELS LIKE',
                          style: reportTitleText,
                        ),
                        Text("${snapshot.data!['data']['sensation']}º", style: reportTitleText),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 110,
                  child: Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Forecast('Now', 'nublado', 18),
                        Forecast('10 AM', 'sol', 18),
                        Forecast('11 AM', 'chuva', 18),
                        Forecast('12 PM', 'nublado', 18),
                        Forecast('01 PM', 'sol', 18),
                        Forecast('Now', 'nublado', 18),
                        Forecast('10 AM', 'sol', 18),
                        Forecast('11 AM', 'chuva', 18),
                        Forecast('12 PM', 'nublado', 18),
                        Forecast('01 PM', 'sol', 18),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}

class Forecast extends StatelessWidget {
  late String horario;
  late String image;
  late int temperatura;

  Forecast(this.horario, this.image, this.temperatura);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 39),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            horario,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          Image.asset(
            'images/$image.png',
            width: 36,
            height: 36,
          ),
          Text(
            '$temperatura°',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
