import 'brand_model.dart';

class ProductModel {
  final String id;
  final String name;
  final BrandModel brand;
  final List<VariantModel> variants;

  ProductModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.variants,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      brand: BrandModel.fromJson(json['brand']),
      variants: (json['variants'] as List)
          .map((v) => VariantModel.fromJson(v))
          .toList(),
    );
  }
}

class VariantModel {
  final String variantId;
  final List<ColorModel> colors;
  final SizeModel size;
  final int stock;
  final List<ImageModel> images;

  VariantModel({
    required this.variantId,
    required this.colors,
    required this.size,
    required this.stock,
    required this.images,
  });

  factory VariantModel.fromJson(Map<String, dynamic> json) {
    return VariantModel(
      variantId: json['variantId'],
      colors:
          (json['colors'] as List).map((c) => ColorModel.fromJson(c)).toList(),
      size: SizeModel.fromJson(json['size']),
      stock: json['stock'],
      images:
          (json['images'] as List).map((i) => ImageModel.fromJson(i)).toList(),
    );
  }
}

class ColorModel {
  final String id;
  final String name;

  ColorModel({
    required this.id,
    required this.name,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      id: json['_id'],
      name: json['name'],
    );
  }
}

class SizeModel {
  final String id;
  final String name;

  SizeModel({
    required this.id,
    required this.name,
  });

  factory SizeModel.fromJson(Map<String, dynamic> json) {
    return SizeModel(
      id: json['_id'],
      name: json['name'],
    );
  }
}

class ImageModel {
  final String imageURL;
  final bool isMain;

  ImageModel({
    required this.imageURL,
    required this.isMain,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      imageURL: json['imageURL'],
      isMain: json['isMain'] ?? false,
    );
  }
}
