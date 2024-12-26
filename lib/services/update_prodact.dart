import 'package:store_app/helper/api.dart';
import 'package:store_app/model/prodact_model.dart';

class UpdateProdactService {
  Future<ProdactModel> updateProdact({
    required String titel,
    required String price,
    required String desc,
    required String image,
    required String category,
    required int id,
  }) async {
    print('id = $id');
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
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
