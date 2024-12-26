class ProdactModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModel rate;

  ProdactModel({
    required this.id,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rate,
    required this.title,
  });
  factory ProdactModel.fromJson(jsonData) {
    return ProdactModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rate: RatingModel.fromJson(
        jsonData['rating'],
      ),
    );
  }
}

class RatingModel {
  final dynamic rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: jsonData['rate'],
      count: jsonData['count'],
    );
  }
}
