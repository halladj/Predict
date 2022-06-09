import 'package:proto/prediction_form/model/pc.model.dart';

class History {
  final PcInfo pc;
  final double price;
  final int id;

  const History({
    required this.id,
    required this.pc,
    required this.price,
  });
}
