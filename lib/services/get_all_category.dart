import 'package:store_app/helper/api.dart';
import 'package:store_app/model/prodact_model.dart';

class GetCategory {
  Future<List<ProdactModel>> getCategoryProdact(
      {required String categoryName}) async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/category/$categoryName',
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
