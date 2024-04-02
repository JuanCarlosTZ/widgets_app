import 'package:widgets_app/domain/transportation.dart';

final List<Map<String, dynamic>> transportations = [
  {'type': TransportationType.car, 'caption': 'Viaje por carro'},
  {'type': TransportationType.motorcyclo, 'caption': 'Viaje por motocicleta'},
  {'type': TransportationType.boat, 'caption': 'Viaje por bote'},
  {'type': TransportationType.maritine, 'caption': 'Viaje por barco'},
  {'type': TransportationType.plane, 'caption': 'Viaje por avión'},
];

class TransportationModel {
  final String caption;
  final TransportationType type;

  TransportationModel({required this.caption, required this.type});

  factory TransportationModel.fromJson(Map<String, dynamic> json) {
    assert(json['caption'] != null, 'Caption expected');
    assert(json['type'] != null, 'type expected');

    return TransportationModel(
      caption: json['caption'],
      type: json['type'],
    );
  }

  Transportation toTransportation() =>
      Transportation(caption: caption, type: type);
}
