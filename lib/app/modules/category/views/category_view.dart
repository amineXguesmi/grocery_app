import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../components/product_item.dart';
import '../controllers/category_controller.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Use context.theme to get theme
    final controller = Get.find<CategoryController>(); // Manually find the controller

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories', style: context.theme.textTheme.headline3),
        centerTitle: true,
      ),
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: GetBuilder<CategoryController>(
                id: 'categories',
                builder: (context) {
                  return ListView.builder(
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      return _buildCategoryItem(context, theme, controller, index); // Pass context
                    },
                  );
                }),
          ),
          // Product List (75%)
          Expanded(
            child: controller.selectedCategoryIndex >= 0
                ? _buildProductList(context, controller)
                : const Center(child: Text("Select a Category")),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, ThemeData theme, CategoryController controller, int index) {
    final isSelected = index == controller.selectedCategoryIndex;
    return InkWell(
      onTap: () {
        controller.updateSelectedCategoryIndex(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[100] : null,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 37.r,
              backgroundColor: theme.cardColor,
              child: SvgPicture.asset(controller.categories[index].image),
            ).animate().fade(duration: 200.ms),
            const SizedBox(width: 10.0),
            Text(controller.categories[index].title),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(BuildContext context, CategoryController controller) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        mainAxisExtent: 214.h,
      ),
      shrinkWrap: true,
      primary: false,
      itemCount: controller.products.length,
      itemBuilder: (context, index) => ProductItem(
        product: controller.products[index],
      ),
    );
  }
}
