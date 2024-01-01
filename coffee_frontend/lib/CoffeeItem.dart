class CoffeeItem {
  final String name;
  final String subtitle;
  final String imagePath;
  final double price;
  CoffeeItem({
    required this.name,
    required this.subtitle,
    required this.imagePath,
    required this.price,
  });

  // Add a factory method to convert JSON data to a CoffeeItem instance
  factory CoffeeItem.fromJson(Map<String, dynamic> json) {
    return CoffeeItem(
      name: json['name'] ?? '',
      subtitle: json['description'] ?? '',
      price: json['price'] ?? '',
      imagePath: json['image'] ?? '',
    );
  }
}
