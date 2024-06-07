class ProductDataModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String price;
  ProductDataModel(
      {required this.description,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.price});
}
