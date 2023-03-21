import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class BagProductModel {
  final String? id;
  final String? color;
  final String? size;
  final String? image;
  final String? name;
  final int? prize;
  final int? quantity;

  BagProductModel({
    this.id,
    this.color,
    this.size,
    this.image,
    this.name,
    this.prize,
    this.quantity,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'color': color,
      'size': size,
      'image': image,
      'name': name,
      'prize': prize,
      'quantity': quantity,
    };
  }

  factory BagProductModel.fromMap(Map<String, dynamic> map) {
    return BagProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      color: map['color'] != null ? map['color'] as String : null,
      size: map['size'] != null ? map['size'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      prize: map['prize'] != null ? map['prize'] as int : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BagProductModel.fromJson(String source) => BagProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
