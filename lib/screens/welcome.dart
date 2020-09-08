import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revelationtea/widgets/dashed_container.dart';
import 'package:revelationtea/widgets/signin_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//          Container(
//            padding: EdgeInsets.symmetric(horizontal: 80),
//            height: 100,
//            child: Hero(
//              tag: 'balance',
//              child: Image(
//                image: AssetImage('assets/img/gender_balance.webp'),
//              ),
//            ),
//          ),
            // Chá Revelação
            Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage("assets/img/cloud_b.png"),
                    height: 35.0,
                  ),
                  Text(
                    'Chá Revelação',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Sacramento',
                      fontWeight: FontWeight.w900,
                      fontSize: 45,
                    ),
                  ),
                  Image(
                    image: AssetImage("assets/img/cloud_p.png"),
                    height: 35.0,
                  ),
                ],
              ),
            ),
            // Uma chuva
            Expanded(
              flex: 5,
              child: Text(
                'Uma chuva de amor está chegando para nos'
                ' ajudar a descorbrir o sexo do nosso bebê!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Tangerine',
                  wordSpacing: 2,
                  fontSize: 40,
                ),
              ),
            ),
            // Dashed
            Expanded(
              flex: 6,
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                child: DashedContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.cloud,
                              size: 25,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          Text(
                            'Chuva de amor!',
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontFamily: 'Gaegu',
                              fontSize: 35,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.calendar_today,
                              size: 20,
                              color: Colors.orangeAccent,
                            ),
                          ),
                          Text(
                            '19/09/2020',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(
                              Icons.timer,
                              size: 20,
                              color: Colors.orangeAccent,
                            ),
                          ),
                          Text(
                            '16h00',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.location_on,
                              size: 20,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            'Rua: Ataulfo Alves, 157 - Itaquá',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '*sugestão de presente: fraldas P ou M',
                            style: TextStyle(
                              color: Colors.white60,
                              fontFamily: 'IndieFlower',
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Corações
            Expanded(
              flex: 6,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Image(
                      image: AssetImage('assets/img/heart_b.png'),
                    ),
                  ),
                  Expanded(
                    child: Image(
                      image: AssetImage('assets/img/heart_p.png'),
                    ),
                  ),
                ],
              ),
            ),
            // Menino ou Menina
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Menino',
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'ou',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Menina',
                      style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Acompanhe
            Expanded(
              flex: 3,
              child: Text(
                'Entre e vote agora e acompanhe os resultados da torcida!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 20,
                ),
              ),
            ),
            // Entrar
            SigninButton(),
          ],
        ),
      ),
    );
  }
}
