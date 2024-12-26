import 'package:store_app/helper/api.dart';

class AllCategories {
  Future<List<dynamic>> getAllCategor() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
