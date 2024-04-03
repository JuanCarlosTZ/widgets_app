import 'package:widgets_app/domain/entities/ui_controls/dish_entity.dart';
import 'package:widgets_app/domain/entities/ui_controls/transportation_entity.dart';

class UiControlsEntity {
  List<DishEntity> dishes;
  List<TransportationEntity> transportations;

  UiControlsEntity({required this.dishes, required this.transportations});
}
