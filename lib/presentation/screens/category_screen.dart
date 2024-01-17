import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tourist_guide_app/business_logic/provider/category_provider.dart';
import 'package:tourist_guide_app/const.dart';
import 'package:tourist_guide_app/presentation/widgets/custom_category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CategoryProvider>(
        builder: (context, categoryProvider, child) => GridView.builder(
          padding: EdgeInsets.symmetric(
              vertical: heightScreen * .013, horizontal: widthScreen * .023),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: widthScreen * .5,
            childAspectRatio: 7 / 8,
            crossAxisSpacing: widthScreen * .025,
            mainAxisSpacing: heightScreen * .012,
          ),
          itemCount: categoryProvider.cateogryCount,
          itemBuilder: (context, index) {
            return CustomCategoryItem(
              imageUrl: categoryProvider.allCategory[index].imageUrl,
              title: categoryProvider.allCategory[index].title,
              onTap: () {
                Navigator.of(context).pushNamed(
                  RoutesScreen.categoryTripsScreen,
                  arguments: {
                    "id": categoryProvider.allCategory[index].id,
                    "title": categoryProvider.allCategory[index].title,
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
