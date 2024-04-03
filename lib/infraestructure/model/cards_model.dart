import 'package:widgets_app/domain/entities/card_entity.dart';

class CardsModel {
  final double elevation;
  final String label;

  CardsModel({required this.elevation, required this.label});

  factory CardsModel.fromJson(Map<String, dynamic> json) => CardsModel(
        elevation: json['elevation'] ?? 0.0,
        label: json['label'] ?? '',
      );

  CardElement toCardElement() =>
      CardElement(elevation: elevation, label: label);
}
