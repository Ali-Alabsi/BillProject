import 'dart:convert';

BillModel billModelFromJson(String str) => BillModel.fromJson(json.decode(str));

String billModelToJson(BillModel? data) => json.encode(data?.toJson());

class BillModel {
  String? title;
  String? title2;
  int? id;
  String? details2;
  String? amount2;
  int? favorite;
  String? categoryName;
  DateTime? createdAt;
  String? billNumber;
  String? details;
  String? amount;
  int? categoryId;
  String? image;

  BillModel({
    this.title,
    this.title2,
    this.id,
    this.details2,
    this.amount2,
    this.favorite,
    this.categoryName,
    this.createdAt,
    this.billNumber,
    this.details,
    this.amount,
    this.categoryId,
    this.image,
  });

  factory BillModel.fromJson(Map<String, dynamic> json) => BillModel(
    id: json["bill_id"],
    title: json["bill_title"],
    billNumber: json["bill_number"],
    details: json["bill_details"],
    amount: json["bill_amount"],
    favorite: json["favorite"],
    categoryName: json["category_name"],
    image: json["bill_image"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "bill_number": billNumber,
    "details": details,
    "amount": amount,
    "category_id": categoryId,
    "image": image,
  };
}

