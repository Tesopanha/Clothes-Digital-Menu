import 'brand.dart';

class Product {
  final String id;
  final String name;
  final Brand brand;
  final List<Variant> variants;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.variants,
  });
}

class Variant {
  final String variantId;
  final List<Color> colors;
  final Size size;
  final int stock;
  final List<ProductImage> images;

  Variant({
    required this.variantId,
    required this.colors,
    required this.size,
    required this.stock,
    required this.images,
  });
}

class Color {
  final String id;
  final String name;

  Color({
    required this.id,
    required this.name,
  });
}

class Size {
  final String id;
  final String name;

  Size({
    required this.id,
    required this.name,
  });
}

class ProductImage {
  final String imageURL;
  final bool isMain;

  ProductImage({
    required this.imageURL,
    required this.isMain,
  });
}
