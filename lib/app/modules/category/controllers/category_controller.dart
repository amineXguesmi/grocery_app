import 'package:get/get.dart';

import '../../../../utils/dummy_helper.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/product_model.dart';

class CategoryController extends GetxController {
  List<CategoryModel> categories = [];
  List<ProductModel> products = [];
  int selectedCategoryIndex = 0;
  @override
  void onInit() {
    getCategories();
    getProducts();
    super.onInit();
  }

  /// get categories from dummy helper
  getCategories() {
    categories = DummyHelper.categories;
  }

  /// get products from dummy helper
  getProducts() {
    products = DummyHelper.products;
  }

  updateSelectedCategoryIndex(int index) {
    selectedCategoryIndex = index;
    update(['categories']);
  }
}
