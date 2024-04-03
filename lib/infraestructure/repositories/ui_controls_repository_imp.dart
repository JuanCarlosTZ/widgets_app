import 'package:widgets_app/domain/datasources/ui_controts_datasource.dart';
import 'package:widgets_app/domain/entities/ui_controls/ui_controls_entity.dart';
import 'package:widgets_app/domain/repositories/ui_controls_repository.dart';

class UiControlsRepositoryImpl implements UiControlsRepository {
  final UiControlsDatasource datasource;

  UiControlsRepositoryImpl(this.datasource);

  @override
  Future<UiControlsEntity> getControls() {
    return datasource.getControls();
  }
}
