// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

// import 'dart:convert';

// List<ProductsModel> productsModelFromJson(String str) => List<ProductsModel>.from(json.decode(str).map((x) => ProductsModel.fromJson(x)));

// String productsModelToJson(List<ProductsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ProductsModel {
//     ProductsModel({
//         this.id,
//         this.title,
//         this.price,
//         this.description,
//         this.category,
//         this.images,
//     });

//     int? id;
//     String? title;
//     int? price;
//     String? description;
//     Category? category;
//     List<String>? images;

//     factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
//         id: json["id"],
//         title: json["title"],
//         price: json["price"],
//         description: json["description"],
//         category: Category.fromJson(json["category"]),
//         images: List<String>.from(json["images"].map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "price": price,
//         "description": description,
//         "category": category!.toJson(),
//         "images": List<dynamic>.from(images!.map((x) => x)),
//     };
// }

// class Category {
//     Category({
//         this.id,
//         this.name,
//         this.image,
//     });

//     int? id;
//     Name? name;
//     String? image;

//     factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         name: nameValues.map![json["name"]],
//         image: json["image"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": nameValues.reverse[name],
//         "image": image,
//     };
// }

// enum Name { CLOTHES, OTHERS, FURNITURE, ELECTRONICS, SHOES }

// final nameValues = EnumValues({
//     "Clothes": Name.CLOTHES,
//     "Electronics": Name.ELECTRONICS,
//     "Furniture": Name.FURNITURE,
//     "Others": Name.OTHERS,
//     "Shoes": Name.SHOES
// });

// class EnumValues<T> {
//     Map<String, T>? map;
//     Map<T, String>? reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map!.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap!;
//     }
// }


// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) => List<ProductsModel>.from(json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
    int id;
    String title;
    double price;
    String description;
    Category category;
    String image;
    Rating rating;

    ProductsModel({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating,
    });

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: categoryValues.map[json["category"]]!,
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": categoryValues.reverse[category],
        "image": image,
        "rating": rating.toJson(),
    };
}

enum Category {
    ELECTRONICS,
    JEWELERY,
    MEN_S_CLOTHING,
    WOMEN_S_CLOTHING
}

final categoryValues = EnumValues({
    "electronics": Category.ELECTRONICS,
    "jewelery": Category.JEWELERY,
    "men's clothing": Category.MEN_S_CLOTHING,
    "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
    double rate;
    int count;

    Rating({
        required this.rate,
        required this.count,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
