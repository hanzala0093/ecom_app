// ignore_for_file: file_names
import 'package:ecommerce_app/features/shop/screens/Home/Widgets/home_categories.dart';
import 'package:ecommerce_app/features/shop/screens/Home/Widgets/promo_slider.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_contanier.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../all_product/all_products.dart';
import 'Widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TPrimaryHeaderWidget(
                  child: Column(
                children: [
                  //HomeAppBAr
                  ThomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  //SearchBar
                  TsearchContanier(
                    text: 'Search in Store',
                  ),
                  //Heading
                  SizedBox(height: TSizes.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TsectionHeading(
                          title: 'Populatr Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        //Categories
                        SizedBox(height: TSizes.spaceBtwSections),
                        THomeCategories(),
                      ],
                    ),
                  ),

                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              )),

              //White contanier part

              Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                      const TPromoSlider(
                        banners: [
                          TImages.promoBanner1,
                          TImages.promoBanner2,
                          TImages.promoBanner3,
                        ],
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      //Heading
                      TsectionHeading(
                        title: 'Popular Products',
                        onPressed: () => Get.to(() => const AllProducts()),
                      ),

                      const SizedBox(height: TSizes.spaceBtwItems),

                      //GridView of images

                      TGridLayout(
                        itemCount: 4,
                        itemBuilder: (_, index) => const TProductCardVertical(),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
