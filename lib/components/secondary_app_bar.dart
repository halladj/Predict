import 'package:flutter/material.dart';
import 'package:proto/home/home_cubit.dart';

class SecondaryAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const SecondaryAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      centerTitle: true,
      // flexibleSpace: Center(
      //   child: Container(
      //
      //     margin:  EdgeInsets.only(bottom: 5.0),
      //     padding: EdgeInsets.symmetric(horizontal: 130.0,vertical: 20.0),
      //     child: Image.asset("assets/logo3.png",),),
      // ),

      leading: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 5.0),
        child: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, size: 30.0),
            color: Theme.of(context).appBarTheme.iconTheme?.color,
            iconSize: 34.0,
            onPressed: () {

              Navigator.of(context).pop();
              //Navigator.pop(context);
            }),
      ),

      // actions: [
      //   Container(
      //     padding: EdgeInsets.only(top: 17.0,bottom: 15.0,right: 10.0),
      //     child: IconButton(onPressed:() => homeCubit.changeTheme() , icon: Icon(
      //       Icons.wb_sunny_outlined,
      //       color: Colors.purple[200],
      //       size: 28.0,
      //     ),),
      //   ),
      //
      // ],
      backgroundColor: Colors.white.withOpacity(0.2),
      iconTheme: Theme.of(context).appBarTheme.iconTheme,
      systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
      elevation: Theme.of(context).appBarTheme.elevation,
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
