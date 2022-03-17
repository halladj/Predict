import "package:flutter/material.dart";
import "screens/screens.dart";

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
    Signin(),
  ];

  void _onItemTapped(int index) {
    //u get access to index vai cluser
    setState(() => {_selectedIndex = index});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10.0,
          leading: const Icon(Icons.logo_dev, color:Colors.black)          ,
          title: Text(
              "ProtoType",
              style: Theme.of(context).textTheme.headline6,
        ),
          actions: [
            IconButton(
                icon: const Icon(Icons.sunny, color: Colors.black),
                onPressed: (){
                }  ,
            )
          ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
              //Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner_rounded ), label: "QR"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Hub"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: "Profile"),
          ]),
    );
  }
}

