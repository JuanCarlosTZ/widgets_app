import 'package:widgets_app/domain/dishes_element.dart';

final List<Map<String, dynamic>> dishesList = [
  {'included': false, 'caption': '¿Desayuno?'},
  {'included': false, 'caption': '¿Almuerzo?'},
  {'included': false, 'caption': '¿Cena?'},
];

class DishesModel {
  final String caption;
  final bool included;

  DishesModel({required this.caption, required this.included});

  factory DishesModel.fromJson(Map<String, dynamic> json) {
    assert(json['caption'] != null, 'Caption expected');

    return DishesModel(
      caption: json['caption'],
      included: json['type'] ?? false,
    );
  }

  DishesElement toDishesElement() =>
      DishesElement(caption: caption, included: included);
}
