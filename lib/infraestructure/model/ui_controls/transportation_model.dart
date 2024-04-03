import 'package:widgets_app/domain/entities/ui_controls/transportation_entity.dart';

final List<Map<String, dynamic>> transportations = [
  {'type': TransportationType.car, 'caption': 'Viaje por carro'},
  {'type': TransportationType.motorcyclo, 'caption': 'Viaje por motocicleta'},
  {'type': TransportationType.boat, 'caption': 'Viaje por bote'},
  {'type': TransportationType.maritine, 'caption': 'Viaje por barco'},
  {'type': TransportationType.plane, 'caption': 'Viaje por avión'},
];

class TransportationModel {
  final String caption;
  final String type;

  TransportationModel({required this.caption, required this.type});

  factory TransportationModel.fromJson(Map<String, dynamic> json) {
    assert(json['caption'] != null, 'Caption expected');
    assert(json['type'] != null, 'type expected');

    return TransportationModel(
      caption: json['caption'],
      type: json['type'],
    );
  }

  TransportationEntity toTransportation() => TransportationEntity(
      caption: caption,
      type: TransportationType.values
          .firstWhere((element) => element.name == type));
}
