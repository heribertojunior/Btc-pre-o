import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _valor = "0";
  void _btcv() async {
    Uri url = Uri.parse('https://blockchain.info/ticker');

    http.Response response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _valor = retorno["BRL"]["buy"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/bitcoin.png"),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                "R\$ " + _valor,
                style: TextStyle(fontSize: 35),
              ),
            ),
            RaisedButton(
              onPressed: _btcv,
              child: Text(
                "Atualizar",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              color: Colors.orange,
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            )
          ],
        )),
      ),
    );
  }
}
