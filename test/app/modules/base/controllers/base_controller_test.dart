import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app/modules/base/controllers/base_controller.dart';
import 'package:grocery_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:grocery_app/utils/dummy_helper.dart';
import 'package:mockito/mockito.dart';

class MockCartController extends Mock implements CartController {}

void main() {
  group('BaseController', () {
    setUp(() {
      Get.testMode = true;
    });
    test('Change Screen', () {
      final controller = BaseController();
      const newIndex = 1;

      controller.changeScreen(newIndex);

      expect(controller.currentIndex, newIndex);
    });

    test('Get Cart Items Count', () {
      final controller = BaseController();

      controller.getCartItemsCount();

      expect(controller.cartItemsCount, DummyHelper.products.fold<int>(0, (p, c) => p + c.quantity));
    });

    test('Increase Pressed', () {
      final controller = BaseController();
      final productId = 1;
      final initialQuantity = DummyHelper.products.firstWhere((p) => p.id == productId).quantity;

      controller.onIncreasePressed(productId);

      expect(DummyHelper.products.firstWhere((p) => p.id == productId).quantity, initialQuantity + 1);
    });

    test('Decrease Pressed', () {
      final controller = BaseController();
      final productId = 1;
      final initialQuantity = DummyHelper.products.firstWhere((p) => p.id == productId).quantity;

      controller.onDecreasePressed(productId);

      expect(DummyHelper.products.firstWhere((p) => p.id == productId).quantity, initialQuantity - 1);
    });
  });
  setUp(() {
    Get.testMode = true;
  });
  test('Decrease Pressed with CartController', () {
    final controller = BaseController();
    final productId = 1;
    final initialQuantity = DummyHelper.products.firstWhere((p) => p.id == productId).quantity;
    final mockCartController = MockCartController();

    controller.onDecreasePressed(productId);

    expect(DummyHelper.products.firstWhere((p) => p.id == productId).quantity, 0);
    verifyNever(mockCartController.getCartProducts()).called(0);
  });
}
