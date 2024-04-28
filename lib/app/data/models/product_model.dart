class ProductModel {
  int id;
  String image;
  String name;
  String description;
  int quantity;
  double price;
  ProductModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.quantity,
      required this.price,
      required this.description});

  @override
  bool operator ==(Object other) {
    return (other is ProductModel) &&
        other.id == id &&
        other.quantity == quantity &&
        other.image == image &&
        other.name == name &&
        other.price == price &&
        other.description == description;
  }

  @override
  int get hashCode =>
      id.hashCode ^ quantity.hashCode ^ image.hashCode ^ name.hashCode ^ price.hashCode ^ description.hashCode;
}
