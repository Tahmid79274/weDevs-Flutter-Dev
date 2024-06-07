class ProductModel {
  String id,
      name,
      slug,
      shortDescription,
      totalSales,
      imageLink,
      rating,
      regularPrice,
      salePrice;
  DateTime dateCreated;
  bool showRating = true;
  ProductModel(
      {required this.id,
      required this.name,
      required this.slug,
      required this.dateCreated,
      required this.shortDescription,
      required this.totalSales,
      required this.imageLink,
      required this.rating,
      required this.regularPrice,
      required this.salePrice});
}
