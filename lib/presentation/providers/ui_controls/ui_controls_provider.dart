import 'package:flutter/material.dart';
import 'package:widgets_app/domain/entities/ui_controls/dish_entity.dart';
import 'package:widgets_app/domain/entities/ui_controls/transportation_entity.dart';
import 'package:widgets_app/domain/repositories/ui_controls_repository.dart';

class UiControlsProvider extends ChangeNotifier {
  final UiControlsRepository uiControlsRepository;
  final controller = ExpansionTileController();
  bool isDevelop = false;

  List<TransportationEntity> transportations = [];
  List<DishEntity> dishes = [];
  TransportationEntity? transportationSelected;

  UiControlsProvider(this.uiControlsRepository);

  Future<void> loadUiControls() async {
    final controls = await uiControlsRepository.getControls();

    dishes = controls.dishes;
    transportations = controls.transportations;

    notifyListeners();
  }

  void setTransportation(TransportationEntity value) {
    transportationSelected = value;
    controller.collapse();
    notifyListeners();
  }

  void setDevelopMode(bool value) {
    isDevelop = value;
    notifyListeners();
  }

  void setDishes(List<DishEntity> value) {
    dishes = dishes;
    notifyListeners();
  }
}
