
class ProductDataModel {
    final String id;
    final String name;
    final String description;
    final double price;
    final String imageUrl;

  ProductDataModel({required this.id, required this.name, required this.description, required this.price, required this.imageUrl});
   @override
  String toString() {
    return 'ProductDataModel(id: $id, name: $name, price: $price)';
  }
}