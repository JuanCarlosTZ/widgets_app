class TransportationEntity {
  final String caption;
  final TransportationType type;

  TransportationEntity({required this.caption, required this.type});

  @override
  String toString() {
    super.toString();
    return '${type.name} - caption';
  }
}

enum TransportationType { car, motorcyclo, boat, maritine, plane }
