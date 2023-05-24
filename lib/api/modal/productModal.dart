class ProductModal {
  int? id;
  double? price;
  String? title, description, category, image;
  RattingModal? rattingModal;

  ProductModal(
      {this.id,
      this.price,
      this.title,
      this.description,
      this.category,
      this.image,
      this.rattingModal});

  factory ProductModal.fromJson(Map m1) {
    return ProductModal(
        id: m1['id'],
        title: m1['title'],
        price: m1['price'],
        category: m1['category'],
        image: m1['image'],
        description: m1['description'],
        rattingModal: RattingModal.fromJson(m1['rating']));
  }
}

class RattingModal {
  int?  count;

  double? rate;
  RattingModal({this.rate, this.count});

  factory RattingModal.fromJson(Map m1) {
    return RattingModal(rate: m1['rate'], count: m1['count']);
  }
}
