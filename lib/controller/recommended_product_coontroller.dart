import 'package:e_commerce_app/data/repository/popular_product_repo.dart';
import 'package:e_commerce_app/data/repository/recommended_product_repo.dart';
import 'package:e_commerce_app/models/products_models.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommndedProductRepo;

  RecommendedProductController({required this.recommndedProductRepo});

  List<dynamic> _recommndedProductList = [];
  List<dynamic> get recommndedProductList => _recommndedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommndedProductRepo.getRecommendedProductRepo();
    if (response.statusCode == 200) {
      _recommndedProductList = [];
      _recommndedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      print('get no recommnded');
    }
  }
}
