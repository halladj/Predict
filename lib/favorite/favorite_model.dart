import 'package:proto/prediction_form/model/pc.model.dart';

class Favorite {
  final PcInfo pc;
  final double price;
  final int id;

  const Favorite({
    required this.id,
    required this.pc,
    required this.price,
  });
}
