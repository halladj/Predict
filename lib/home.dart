import "package:flutter/material.dart";
import 'package:proto/components/appbar.dart';
import 'package:proto/constants.dart';
import 'package:proto/home/home_cubit.dart';
import 'package:proto/home/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/custom_bottom_navigation_bar.dart';
import 'components/side_bar.dart';



class Home extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: Home());
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    //WE USED THE BLOC BUILDER HERE TO ALLOW

    return BlocBuilder<HomeCubit, HomeState>(builder: (context, cubit) {
      return SafeArea(
        child: Container(
          decoration: BoxDecoration(
            // gradient:LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //
            //   kLightBackgroundColor,
            //   Colors.red,
            // ],
            //
            // ),
            image: DecorationImage(image: AssetImage("assets/light_backgrounddd.png"),fit: BoxFit.cover,
              
            ),

//     return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
//       return Scaffold(
//         body: homeCubit.pages[homeCubit.selectedIndex],
//         //BOTTOM NAVIGATION STYLING
//         bottomNavigationBar: Container(
//           height: 68,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(30), topLeft: Radius.circular(30)),
//             boxShadow: [
//               BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 6),
//             ],

          ),
          //color: Colors.white,
          child: Scaffold(
            //backgroundColor: kLightBackgroundColor,
            backgroundColor: Colors.transparent,
            drawer: SideBar(),
            appBar: CustomAppBar(
              homeCubit: homeCubit,
              appBar: AppBar(),
              titleText: '',
            ),
            body: homeCubit.pages[homeCubit.selectedIndex],
            //BOTTOM NAVIGATION STYLING
            bottomNavigationBar: CustomBottomNavigation(homeCubit: homeCubit),
          ),
        ),
      );
    });
  }
}

