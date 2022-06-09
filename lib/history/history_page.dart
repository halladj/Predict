import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:proto/app_bloc/app_bloc.dart';
import 'package:proto/history/history_item.dart';
import 'package:proto/history/history_model.dart';
import 'package:proto/helpers/api/predictions.dart';
import 'package:proto/history/history_item.dart';
import 'package:proto/prediction_form/model/pc.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/home/home_cubit.dart';
import 'package:proto/login/view/login_page.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: MyDialog());

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    Future.delayed(Duration.zero, () {
      showAlertDialog(context);
    });
    homeCubit.changeButtomNavIndex(4);
    return const LoginPage();
  }
}

showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Auth"),
        content: const Text(
            "This action requires Authentication\nplease login to check your Historys"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          )
        ],
      );
    },
  );
}

class HistorysPage extends HookWidget {
  const HistorysPage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: HistorysPage());
  @override
  Widget build(BuildContext context) {
    //this is the values to be displayed
    final futuerHistory =
        useState<dynamic>(const History(pc: PcInfo(), price: 0.0, id: -1));
    final user = context.select((AppBloc bloc) => bloc.state.user);

    //we put the function into aseMemo to
    final future = useMemoized(() async {
      return HistoryApi.fetchHistory(user.token);
    });
    final snapshot = useFuture(future, initialData: null);
    useEffect(
      () {
        if (snapshot.data != null) {
          futuerHistory.value = snapshot.data.toList();
          print(futuerHistory.value);
        }
      },
    );
    return Scaffold(
      appBar: AppBar(title: const Text("history")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: futuerHistory.value ==
                const History(pc: PcInfo(), price: 0.0, id: -1)
            ? const Center(
                child: SizedBox(
                    height: 50, width: 50, child: CircularProgressIndicator()))
            //? Text("بالاستغفا")
            : ListView.separated(
                itemCount: futuerHistory.value.length,
                separatorBuilder: (BuildContext context, index) {
                  return const Divider(height: 3);
                },
                itemBuilder: (BuildContext context, index) {
                  var condition = true;
                  return Dismissible(
                      direction: DismissDirection.endToStart,
                      background: Container(
                          color: Colors.red,
                          alignment: Alignment.center,
                          child: const Icon(Icons.delete_forever,
                              color: Colors.white, size: 50)),
                      key: Key(index.toString()),
                      onDismissed: (direction) async {
                        condition = false;
                        await HistoryApi.deleteHistory(
                            futuerHistory.value[index].id, user.token);
                        condition = true;
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "this Prediction was removerd from your history")));
                      },
                      child: !condition
                          ? const CircularProgressIndicator()
                          : HistoryItem(history: futuerHistory.value[index]));
                }),
      ),
    );
  }
}
