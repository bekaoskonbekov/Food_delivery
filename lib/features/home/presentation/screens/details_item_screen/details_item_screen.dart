import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/strings/routes.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../../core/widgets/custpm_snackbar.dart';
import '../../widgets/bottom_appbar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsItemScreen extends StatelessWidget {
  DetailsItemScreen({Key? key}) : super(key: key);

  double rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppbar(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: placeholderColor,
        onPressed: () => Navigator.pushReplacementNamed(context, homeScreen),
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const TabBarMaterialWidget(),
    );
  }

  InkWell appBarActionButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(50.r),
      onTap: () {},
      child: Image.asset('assets/icons/shopping-white_cart.png'),
    );
  }

  SliverAppBar _buildSliverAppbar(BuildContext context) {
    return SliverAppBar(
      actions: [
        appBarActionButton(),
      ],
      expandedHeight: MediaQuery.of(context).size.height,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
          background: Stack(
        children: [
          imageitemWidget(context),
          shadowImageItemWidget(context),
          detailsItemWidget(context),
          favoriteButtonWidget(context),
        ],
      )),
    );
  }

  SizedBox imageitemWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        'assets/images/2.png',
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
    );
  }

  Positioned shadowImageItemWidget(BuildContext context) {
    return Positioned(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 385.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0),
            ],
            stops: [0, 0.6.r],
          ),
        ),
      ),
    );
  }

  Transform detailsItemWidget(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, MediaQuery.of(context).size.height / 2.7),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 500.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(40.r),
            ),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.r, left: 15.r, right: 15.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tandoori Chicken Pizza',
                    style: TextStyle(
                      color: primaryFontColor,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ratingBar(context),
                  priceWidgetStack(
                    context,
                    Offset(
                      MediaQuery.of(context).size.width / 1.66.w,
                      MediaQuery.of(context).size.height / -25.h,
                    ),
                  ),
                  descriptionField(),
                ],
              ),
            ),
            numbersAndTotalItems(context),
          ],
        ),
      ),
    );
  }

  Widget descriptionField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
              color: primaryFontColor,
              fontSize: 17.sp,
              fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare leo non mollis id cursus. Eu euismod faucibus in leo malesuada',
          style: TextStyle(
              height: 1.9.h,
              color: secondaryFontColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 12.h,
        ),
      ],
    );
  }

  Expanded numbersAndTotalItems(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(top: 0.r),
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.r, right: 15.r),
            child: counterItemWidget(),
          ),
          SizedBox(
            height: 27.h,
          ),
          SizedBox(
            height: 171.h,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  height: 171.h,
                  width: 97.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.r),
                        bottomRight: Radius.circular(50.r)),
                    color: mainColor,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(18.r),
                    width: 277.w,
                    height: 122.h,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(0, 1.5.w),
                            blurRadius: 5.r),
                        const BoxShadow(
                            color: mainColor,
                            offset: Offset(-1, 0),
                            blurRadius: 0),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(
                              color: primaryFontColor, fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          'EGP 1500',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 21.sp,
                            color: primaryFontColor,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        SizedBox(
                          width: 157.w,
                          height: 29.h,
                          child: CusttomIconButton(
                            color: mainColor,
                            padding: 10.r,
                            onPressed: () => SnackBarMessage()
                                .showSuccessMessage(
                                    message: 'Chech Your Cart',
                                    context: context),
                            // BlocProvider.of<UserInfoCubit>(context)
                            //     .addToCart(
                            //         productData: ProductDataModel(
                            //             id: '5',
                            //             name: 'name',
                            //             description: 'description',
                            //             price: 12,
                            //             discount: 2,
                            //             rate: 3,
                            //             countInStock: 5,
                            //             category: CategoryDataModel(
                            //                 id: '1',
                            //                 name: 'ss',
                            //                 image: 's'),
                            //             brand: 'brand',
                            //             images: ['images'],
                            //             color: 'color'),
                            //         count: 5),
                            text: 'Add to Cart',
                            icon: Image.asset(
                              'assets/icons/add-to-cart.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    MediaQuery.of(context).size.width / 1.25.h,
                    MediaQuery.of(context).size.width / 5.9.w,
                  ),
                  child: CustomRoundedIconButton(
                    width: 40.w,
                    height: 40.h,
                    onTap: () {},
                    icon:
                        Image.asset('assets/icons/shopping-maincolor-cart.png'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
        ],
      ),
    );
  }

  Row counterItemWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Number of Portions',
          style: TextStyle(
              color: primaryFontColor,
              fontSize: 17,
              fontWeight: FontWeight.w800),
        ),
        Counter(
          count: 1,
        ),
      ],
    );
  }

  Transform priceWidgetStack(BuildContext context, Offset offset) {
    return Transform.translate(
      offset: offset,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text(
            'EGP. 750',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 31,
                color: primaryFontColor),
          ),
          Text(
            '/ per Portion',
            style: TextStyle(
                fontSize: 12,
                color: secondaryFontColor,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Transform favoriteButtonWidget(BuildContext context) {
    return Transform.translate(
      offset: Offset(MediaQuery.of(context).size.width / 1.3,
          MediaQuery.of(context).size.height / 3.1),
      child: InkWell(
        splashColor: primaryFontColor,
        onTap: () {},
        // child: Image.asset('assets/icons/Add to favorites button.png'),
        child: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    secondaryFontColor, BlendMode.srcATop),
                child: SvgPicture.asset(
                  'assets/icons/Add to favorites button1.svg',
                ),
              ),
            ),
            Positioned(
              top: -3.r,
              child: SvgPicture.asset(
                'assets/icons/Add to favorites button1.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ratingBar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingBar(
            itemPadding: const EdgeInsets.all(3),
            itemSize: 20,
            initialRating: 3,
            maxRating: 5,
            minRating: 1,
            direction: Axis.horizontal,
            ratingWidget: RatingWidget(
                empty: Image.asset('assets/icons/star-empty.png'),
                full: Image.asset('assets/icons/star-1.png'),
                half: Container()),
            onRatingUpdate: (rating) {
              rating = rating;
            }),
        SizedBox(
          height: 4.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 6.0.r),
          child: Text(
            '${rating.toStringAsFixed(0)} Star Ratings',
            style: TextStyle(
              color: mainColor,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}

class Counter extends StatefulWidget {
  Counter({
    required this.count,
    Key? key,
  }) : super(key: key);
  int count;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 30.h,
          width: 52.w,
          child: CusttomIconButton(
              color: mainColor,
              onPressed: () {
                if (widget.count > 1) {
                  widget.count -= 1;
                  setState(() {});
                }
              },
              withText: false,
              text: '',
              icon: Image.asset('assets/icons/-.png')),
        ),
        SizedBox(
          width: 5.w,
        ),
        Container(
          width: 52.w,
          height: 30.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(
              color: mainColor,
              style: BorderStyle.solid,
              width: 1.5.w,
            ),
          ),
          child: Center(
            child: Text(
              '${widget.count}',
              style: const TextStyle(color: mainColor),
            ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        SizedBox(
          height: 30.h,
          width: 52.w,
          child: CusttomIconButton(
              color: mainColor,
              onPressed: () {
                widget.count += 1;
                setState(() {});
              },
              withText: false,
              text: '',
              icon: Image.asset('assets/icons/+.png')),
        )
      ],
    );
  }
}
