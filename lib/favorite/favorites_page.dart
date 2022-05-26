import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:proto/favorite/favorite_model.dart';
import 'package:proto/helpers/constants.dart';
import 'package:proto/prediction_form/model/cpu/cpu.model.dart';
import 'package:proto/prediction_form/model/gpu/gpu.model.dart';
import 'package:proto/prediction_form/model/pc.model.dart';

class FavoritesPage extends HookWidget {
  const FavoritesPage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: FavoritesPage());
  @override
  Widget build(BuildContext context) {
    //this is the values to be displayed
    final futuerFavorite =
        useState<dynamic>(const Favorite(pc: PcInfo(), price: 0.0, id: -1));

    //we put the function into aseMemo to
    final future = useMemoized(() async {
      return fetchFavorite();
    });
    final snapshot = useFuture(future, initialData: null);
    useEffect(
      () {
        if (snapshot.data != null) {
          futuerFavorite.value = snapshot.data.toList();
        }
      },
    );
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: futuerFavorite.value ==
              const Favorite(pc: PcInfo(), price: 0.0, id: -1)
          ? const CircularProgressIndicator()
          : ListView.separated(
              itemCount: futuerFavorite.value.length,
              separatorBuilder: (BuildContext, index) {
                return const Divider(height: 3);
              },
              itemBuilder: (BuildContext context, index) {
                return Card(
                  child: Container(
                      height: 70,
                      color: HexColor("#ebf3fb"),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("${futuerFavorite.value[index].pc.brand}",
                              style: const TextStyle(fontSize: 26)),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Brand: ${futuerFavorite.value[index].pc.brand}",
                                        ),
                                        Text(
                                          "Cpu Brand: ${futuerFavorite.value[index].pc.cpu.brand}",
                                        ),
                                        Text(
                                          "Price: ${futuerFavorite.value[index].price}",
                                        )
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: SpinKitPumpingHeart(
                            color: Colors.red,
                            size: 36.0,
                          ),
                        )
                        //IconButton(
                        //    icon: const Icon(Icons.favorite, color: Colors.red),
                        //    onPressed: () {}),
                      ])),
                );
              }),
    );
  }
}

fetchFavorite() async {
  final response = await Dio().get('${favoriteURL}/',
      //data: {"laptop": data.toJson(), "price": price},
      options: Options(
        headers: {
          "authorization": "Bearer 1|u9jkQig3rq7tpo5OYeUQRNX0YKCv2Fmw0kDc6Jfv",
        },
        contentType: Headers.jsonContentType,
        validateStatus: (status) => true,
      ));
  if (response.statusCode == 200) {
    return response.data.map((data) => Favorite(
        id: data["id"],
        pc: PcInfo(
            brand: data["brand"],
            cpu: CPU(
                brand: data["cpu_brand"],
                family: data["cpu_family"],
                generation: data["cpu_generation"],
                modifier: data["cpu_modifier"],
                numberIdentifier: data["cpu_number_identifier"],
                frequency: double.parse(data["cpu_frequency"].toString())),
            gpu: GPU(
                brand: data["gpu_brand"],
                numberIdentifier: data["cpu_number_identifier"].toString(),
                wordsIdentifier: data["gpu_words_identifier"],
                vram: data["gpu_vram"]),
            ram: data["ram"],
            ramType: data["ram_type"],
            ramFrequency: double.parse(data["ram_frequency"].toString()),
            hdd: data["hdd"],
            ssd: data["ssd"],
            screenSize: double.parse(data["screen_size"].toString()),
            screenResolution: data["screen_resolution"],
            screenRefreshRate: data["screen_refresh_rate"],
            state: data["state"],
            antiGlare: data["anti_glare"],
            touchScreen: data["touch_screen"]),
        price: double.parse(data["price"].toString())));
  } else {
    throw Exception('this is a fucking exception mate init');
  }
}
