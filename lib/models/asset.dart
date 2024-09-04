class Asset {
  final String id;
  final String? locationId;
  final String name;
  final String? parentId;
  final String? sensorType;
  final String? status;

  Asset({
    required this.id,
    this.locationId,
    required this.name,
    this.parentId,
    this.sensorType,
    this.status,
  });

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id: json['id'] as String,
      locationId: json['locationId'] as String?,
      name: json['name'] as String,
      parentId: json['parentId'] as String?,
      sensorType: json['sensorType'] as String?,
      status: json['status'] as String?,
    );
  }
}
