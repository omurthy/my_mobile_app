import 'package:dio/dio.dart';
import 'package:my_mobile_app/product_model.dart';

class ProductService {
  final String productsURL = 'http://192.168.1.28:5000/products';
  final Dio dio = Dio();

  ProductService();

  Future<List<Product>> getProducts() async {
    late List<Product> products;
    try {
      final res = await dio.get(productsURL);

      products = res.data['products']
        .map<Product>(
          (item) => Product.fromJson(item),
        )
        .toList();
    }
    on DioError catch(e) {
      products = [];
    }

    return products;
  }
}