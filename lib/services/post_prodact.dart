import 'package:store_app/helper/api.dart';
import 'package:store_app/model/prodact_model.dart';

class PostProdact {
  Future<ProdactModel> post({
    required String titel,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        "title": titel,
        'price': price,
        "description": desc,
        "image": image,
        "category": category,
      },
    );

    return ProdactModel.fromJson(data);
  }
}
