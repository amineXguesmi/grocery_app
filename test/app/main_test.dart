import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grocery_app/app/data/local/my_shared_pref.dart';
import 'package:mockito/mockito.dart';

class MockMySharedPref extends Mock implements MySharedPref {
  @override
  Future<void> init() async {} // Define the method to mock
}

void main() {
  group('Main', () {
    testWidgets('should initialize shared preference', (tester) async {
      // Arrange
      final mockMySharedPref = MockMySharedPref();
      when(mockMySharedPref.init()).thenAnswer((_) async {});
      await tester.pumpWidget(GetMaterialApp(
        builder: (context, widget) {
          return MaterialApp(
            home: Container(),
          );
        },
      ));

      // Act
      await mockMySharedPref.init();

      // Assert
      verify(mockMySharedPref.init()).called(1);
    });
  });
}
