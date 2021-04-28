// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.responce,
    this.data,
  });

  bool responce;
  List<CategoryDatum> data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    responce: json["responce"] == null ? null : json["responce"],
    data: json["data"] == null ? null : List<CategoryDatum>.from(json["data"].map((x) => CategoryDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responce": responce == null ? null : responce,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CategoryDatum {
  CategoryDatum({
    this.id,
    this.title,
    this.slug,
    this.parent,
    this.leval,
    this.description,
    this.image,
    this.type,
    this.status,
  });

  String id;
  String title;
  String slug;
  String parent;
  String leval;
  String description;
  String image;
  String type;
  String status;

  factory CategoryDatum.fromJson(Map<String, dynamic> json) => CategoryDatum(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    slug: json["slug"] == null ? null : json["slug"],
    parent: json["parent"] == null ? null : json["parent"],
    leval: json["leval"] == null ? null : json["leval"],
    description: json["description"] == null ? null : json["description"],
    image: json["image"] == null ? null : json["image"],
    type: json["type"] == null ? null : json["type"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "slug": slug == null ? null : slug,
    "parent": parent == null ? null : parent,
    "leval": leval == null ? null : leval,
    "description": description == null ? null : description,
    "image": image == null ? null : image,
    "type": type == null ? null : type,
    "status": status == null ? null : status,
  };
}
