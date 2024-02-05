import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });

  // Empty helper Function
  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: '', isFeatured: true);

  // Convert model to json
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'isFeatured': isFeatured,
    };
  }

  // Map json oriented
  factory CategoryModel.fromSnapshot(DocumentSnapshot document) {
    if (document.exists) {
      final data = document.data() as Map<String, Object?>?;

      if (data != null) {
        return CategoryModel(
          id: document.id,
          name: data['Name']?.toString() ?? '',
          image: data['Image']?.toString() ?? '',
          parentId: data['ParentId']?.toString() ?? '',
          isFeatured: data['isFeatured'] as bool? ?? false,
        );
      } else {
        // Handle the case where data is null
        return CategoryModel.empty();
      }
    } else {
      // Handle the case where the document doesn't exist.
      return CategoryModel.empty();
    }
  }
}
