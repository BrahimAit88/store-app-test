import 'package:store_app/helper/api.dart';
import 'package:store_app/model/prodact_model.dart';

class GetProdact {
  Future<List<ProdactModel>> getProdact() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products',
    );

    List<ProdactModel> prodactList = [];

    for (int i = 0; i < data.length; i++) {
      prodactList.add(
        ProdactModel.fromJson(
          data[i],
        ),
      );
    }

    return prodactList;
  }
}
