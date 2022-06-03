import 'package:flow_builder/flow_builder.dart';
import "package:flutter/material.dart";
import 'package:proto/app_bloc/app_bloc.dart';
import 'package:proto/favorite/favorites.dart';
import 'package:proto/login/view/login_page.dart';
import 'package:proto/screens/google_assistant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/screens/profile_page.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AppStatus>(
      state: context.select((AppBloc bloc) => bloc.state.status),
      onGeneratePages: onGenerateViewPages,
    );
  }
}

List<Page> onGenerateViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [ProfilePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
