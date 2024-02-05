import 'package:ecommerce_app/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/features/shop/screens/brand/all_brands.dart';
import 'package:ecommerce_app/features/shop/screens/store/widget/category_tab.dart';

import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/app_bar/tabbar.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/product_cart/brand_card.dart';
import '../../../../common/widgets/product_cart/cart_menu_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppbar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          action: [
            TcartCouncterIcon(
              onpressed: () {},
              iconColor: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.black,
            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          //SearchBar
                          const SizedBox(height: TSizes.spaceBtwItems),
                          const TsearchContanier(
                            text: 'Search In Store',
                            showborder: true,
                            showbackground: false,
                            padding: EdgeInsets.zero,
                          ),

                          const SizedBox(height: TSizes.spaceBtwSections),

                          //Feature Brand
                          TsectionHeading(
                            title: 'Featured brands',
                            onPressed: () =>
                                Get.to(() => const AllBrandScreen()),
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems / 1.5,
                          ),

                          TGridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return const TBrandCard(
                                  showBorder: true,
                                );
                              })
                        ],
                      ),
                    ),
                    //Tab views

                    bottom: const TtabBar(tabs: [
                      Tab(
                        child: Text('Sports'),
                      ),
                      Tab(
                        child: Text('Furnature'),
                      ),
                      Tab(
                        child: Text('Electronics'),
                      ),
                      Tab(
                        child: Text('Cloths'),
                      ),
                      Tab(
                        child: Text('Cosmatics'),
                      ),
                    ]))
              ];
            },
            body: const TabBarView(
              children: [
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
              ],
            )),
      ),
    );
  }
}
