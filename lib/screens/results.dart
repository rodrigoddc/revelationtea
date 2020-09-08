import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revelationtea/modules/get_all_results.dart';

class Results extends StatefulWidget {
  final int m;
  final int f;
  Results({this.m, this.f});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Total de votos',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Menino: ${widget.m}',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'Menina: ${widget.f}',
                      style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
                child: Row(
                  children: [
                    Text(
                      'Lista de Votos em ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'tempo real',
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListAllResults()
            ],
          ),
        ),
      ),
    );
  }
}
