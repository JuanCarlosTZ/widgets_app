import 'package:widgets_app/domain/entities/ui_controls/dish_entity.dart';

final List<Map<String, dynamic>> dishesList = [
  {'included': false, 'caption': '¿Desayuno?'},
  {'included': false, 'caption': '¿Almuerzo?'},
  {'included': false, 'caption': '¿Cena?'},
];

class DishModel {
  final String caption;
  final bool included;

  DishModel({required this.caption, required this.included});

  factory DishModel.fromJson(Map<String, dynamic> json) {
    assert(json['caption'] != null, 'Caption expected');

    return DishModel(
      caption: json['caption'],
      included: json['type'] ?? false,
    );
  }

  DishEntity toDishesElement() =>
      DishEntity(caption: caption, included: included);
}
