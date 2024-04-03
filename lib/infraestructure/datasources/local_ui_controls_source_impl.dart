import 'package:widgets_app/config/helpers/data/local_data.dart';
import 'package:widgets_app/domain/datasources/ui_controts_datasource.dart';
import 'package:widgets_app/domain/entities/ui_controls/ui_controls_entity.dart';
import 'package:widgets_app/infraestructure/model/ui_controls/ui_controls_model.dart';

class LocalUiControlsSourceImpl implements UiControlsDatasource {
  @override
  Future<UiControlsEntity> getControls() async {
    await Future.delayed(const Duration(milliseconds: 400));

    final jsonResponse = LocalData.getUIControls;
    final controls =
        UiControlsModel.fromJson(jsonResponse).toUiControlsEntity();

    return controls;
  }
}
