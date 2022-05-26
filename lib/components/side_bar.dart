import 'package:flutter/material.dart';
class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("accountName"),
            accountEmail: Text("accountEmail"),
            currentAccountPicture: CircleAvatar(
              child: Image.asset('assets/laptop1.png',fit: BoxFit.cover,),
            ),
            // decoration: BoxDecoration(
            //   color: Colors.teal,
            // ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favorites"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("History"),
            onTap: (){},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text("Policies"),
            onTap: (){},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Exit"),
            onTap: (){},
          ),

        ],
      ),
    );
  }
}
