import "package:flutter/material.dart";
import 'package:flutter_hex_color/flutter_hex_color.dart';
import "screens/screens.dart";
import 'package:flutter_hex_color/flutter_hex_color.dart';

//TODO implement deep link to allow QR scanneing duntionality
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //add vars and funcs
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    const QRCodeScanner(),
    const Hub(),
    const GoogleAssistant(),
  ];

  void _onItemTapped(int index) {
    //u get access to index vai cluser
    setState(() => {_selectedIndex = index});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        //elevation: 10.0,
        leading: Icon(Icons.logo_dev, color: HexColor("#726eff")),
        title: Text(
          "ProtoType",
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.sunny, color: HexColor("#726eff")),
            onPressed: () {},
          )
        ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          //selectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner_rounded), label: "QR"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Hub"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: "Google Assistant"),
          ]),
    );
  }
}

