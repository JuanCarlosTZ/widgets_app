import 'package:widgets_app/domain/entities/ui_controls/ui_controls_entity.dart';

abstract class UiControlsRepository {
  Future<UiControlsEntity> getControls();
}
