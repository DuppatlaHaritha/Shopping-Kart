class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  double? newPrice; // <-- optional field for offer price
  String? imagePath;
  final Map<String, dynamic>? category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.newPrice,
    this.imagePath,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> j) {
    return Product(
      id: j['id'],
      name: j['name'] ?? '',
      description: j['description'] ?? '',
      price: (j['price'] is int) ? (j['price'] as int).toDouble() : (j['price'] ?? 0.0),
      newPrice: j['newPrice'] != null
          ? (j['newPrice'] is int
          ? (j['newPrice'] as int).toDouble()
          : (j['newPrice'] ?? 0.0))
          : null,
      imagePath: j['imagePath'],
      category: j['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'newPrice': newPrice,
      'imagePath': imagePath,
      'category': category,
    };
  }
}
