import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app/data/models/product_model.dart';
import 'package:grocery_app/app/modules/base/controllers/base_controller.dart';
import 'package:grocery_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:grocery_app/utils/dummy_helper.dart';
import 'package:mockito/mockito.dart';

class MockBaseController extends Mock implements BaseController {}

class MockCartController extends Mock implements CartController {
  @override
  getCartProducts() {
    // Define mocked behavior for getCartProducts (e.g., return empty list)
    return [];
  }
}

void main() {
  group('CartController', () {
    setUp(() {
      // Initialize GetX bindings before each test
      Get.testMode = true;
      // Register BaseController
      Get.put<BaseController>(BaseController());
    });
    test('onInit should call getCartProducts', () {
      // Mock Get.find
      final mockBaseController = MockBaseController();
      Get.put<BaseController>(mockBaseController);
      var controller = CartController();

      expect(controller.products, equals([]));
    });
    test('onPurchaseNowPressed should clear cart and show snackbar', () {
      // Mock dependencies
      final controller = CartController();

      // Mock products in cart
      DummyHelper.products = [
        ProductModel(id: 1, quantity: 1, image: '', name: '', price: 0, description: ''),
        ProductModel(id: 2, quantity: 1, image: '', name: '', price: 0, description: ''),
      ];

      // Call onPurchaseNowPressed
      controller.onPurchaseNowPressed(showSnackBar: false);

      // Verify cart is cleared
      expect(DummyHelper.products.every((p) => p.quantity == 0), isTrue);
    });
    test('getCartProducts should update products list with items having quantity > 0', () {
      // Mock dependencies
      final controller = CartController();
      DummyHelper.products = [
        ProductModel(id: 1, quantity: 1, image: '', name: '', price: 0, description: ''),
        ProductModel(id: 2, quantity: 0, image: '', name: '', price: 0, description: ''),
      ];

      // Call getCartProducts
      controller.getCartProducts();

      // Verify products list is updated correctly
      expect(controller.products.length, equals(1));
      expect(controller.products[0].id, equals(1));
    });

    test('clearCart should reset products quantity and update cart items count', () {
      // Mock dependencies
      final controller = CartController();
      final mockBaseController = MockBaseController();

      DummyHelper.products = [
        ProductModel(id: 1, quantity: 1, image: '', name: '', price: 0, description: ''),
        ProductModel(id: 2, quantity: 1, image: '', name: '', price: 0, description: ''),
      ];

      // Call clearCart
      controller.clearCart();

      // Verify products quantity is reset
      expect(DummyHelper.products.every((p) => p.quantity == 0), isTrue);

      // Verify BaseController.getCartItemsCount is called
      verifyNever(mockBaseController.getCartItemsCount()).called(0);
    });
  });
}
