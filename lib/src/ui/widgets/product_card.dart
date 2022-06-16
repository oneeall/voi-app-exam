import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/src/ui/themes/colors.dart';

enum ProductItemSize { small, medium }
enum ProductItemSelected { none, selected, unselected }

class ProductCard extends StatelessWidget {
  final String productId;
  final String title;
  final String subTitle;
  final String slug;
  final String imageUrl;
  final String price;
  final VoidCallback onPressed;
  final String priceLineThrough;
  final String discount;
  final ProductItemSize itemSize;
  final ProductItemSelected? itemSelected;
  final ValueChanged<ProductItemSelected>? onSelected;

  const ProductCard({
    Key? key,
    required this.productId,
    required this.title,
    required this.subTitle,
    required this.slug,
    required this.imageUrl,
    required this.price,
    required this.onPressed,
    this.priceLineThrough = '',
    this.discount = '',
    this.itemSize = ProductItemSize.small,
    this.itemSelected,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Center(
          child: Container(
            height: 256,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: kNeutral10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 140,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 10, top: 8, right: 10),
                        alignment: Alignment.center,
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          width: 139,
                          height: 140,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 16,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 32,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    subTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 16,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    price,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Text LineThrough
                    Container(
                      height: 16,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        priceLineThrough,
                      ),
                    ),
                    //Discount
                    Container()
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
