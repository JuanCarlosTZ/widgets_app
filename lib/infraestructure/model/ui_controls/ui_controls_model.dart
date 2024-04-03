import 'package:widgets_app/domain/entities/ui_controls/ui_controls_entity.dart';
import 'package:widgets_app/infraestructure/model/ui_controls/dish_model.dart';
import 'package:widgets_app/infraestructure/model/ui_controls/transportation_model.dart';

class UiControlsModel {
  final List<TransportationModel> transportations;
  final List<DishModel> dishes;

  UiControlsModel({
    required this.transportations,
    required this.dishes,
  });

  factory UiControlsModel.fromJson(Map<String, dynamic> json) =>
      UiControlsModel(
        transportations: List<TransportationModel>.from(json["transportations"]
            .map((x) => TransportationModel.fromJson(x))),
        dishes: List<DishModel>.from(
            json["dishes"].map((x) => DishModel.fromJson(x))),
      );

  UiControlsEntity toUiControlsEntity() => UiControlsEntity(
        dishes: dishes.map((e) => e.toDishesElement()).toList(),
        transportations:
            transportations.map((e) => e.toTransportation()).toList(),
      );
}
