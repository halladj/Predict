import 'package:flutter/material.dart';
import 'package:proto/home/home_cubit.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String titleText;
  final HomeCubit homeCubit;
  const CustomAppBar({Key? key, required this.appBar, required this.titleText, required this.homeCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading:  IconButton(
      //   icon: ImageIcon(
      //     AssetImage("assets/menu.png"),
      //     //color: Colors.red,
      //     //size: 24,
      //   ),
      //   onPressed: () => Scaffold.of(context).openDrawer(),
      // ),


      flexibleSpace: Center(
        child: Container(

            margin:  EdgeInsets.only(bottom: 5.0),
            padding: EdgeInsets.symmetric(horizontal: 130.0,vertical: 20.0),
            child: Image.asset("assets/logo3.png",),),
      ),

      leading:
      Container(
        padding: EdgeInsets.only(top: 17.0,bottom: 15.0,left: 12.0),
        child: IconButton(
            icon: const Icon(Icons.arrow_back_rounded,
            size: 30.0),
            color: Colors.purple[200],
            iconSize: 34.0,
            onPressed: () {
              Navigator.of(context).maybePop();
            }),
      ),
      actions: [
          Container(
            padding: EdgeInsets.only(top: 17.0,bottom: 15.0,right: 10.0),
            child: IconButton(onPressed:() => homeCubit.changeTheme() , icon: Icon(
              Icons.wb_sunny_outlined,
              color: Colors.purple[200],
              size: 28.0,
            ),),
          ),

      ],
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      iconTheme: Theme.of(context).appBarTheme.iconTheme,
      systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
      elevation: Theme.of(context).appBarTheme.elevation,
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}

