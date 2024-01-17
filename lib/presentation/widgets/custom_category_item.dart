import 'package:flutter/material.dart';

import 'package:tourist_guide_app/const.dart';

class CustomCategoryItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function()? onTap;
  const CustomCategoryItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(widthScreen * .05),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(widthScreen * .035),
            child: Image.network(
              imageUrl,
              height: heightScreen * .27,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(widthScreen * .02),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(widthScreen * .035),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        ],
      ),
    );
  }
}
