import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String titleText;
  const CustomAppBar({Key? key, required this.appBar, required this.titleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleText),
      leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          iconSize: 34.0,
          onPressed: () {
            Navigator.pop(context);
          }),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.logo_dev),
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
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

