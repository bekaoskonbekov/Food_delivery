import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../testResturantScreen.dart';

class MoreSettingsBody extends StatelessWidget {
  const MoreSettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'More'),
          const SizedBox(
            height: 21,
          ),
          Expanded(
              child: Column(
            children: [
              buildListTile(
                onTap: () => Navigator.pushNamed(
                    context, ResturantsScreen.resturantScreen),
                image: 'assets/icons/payment.png',
                icon: 'assets/icons/arrow.png',
                title: 'Payment Details',
              ),
              const SizedBox(
                height: 5,
              ),
              buildListTile(
                onTap: () => print('my orders'),
                image: 'assets/icons/orders.png',
                icon: 'assets/icons/arrow.png',
                title: 'My Orders',
              ),
              const SizedBox(
                height: 5,
              ),
              buildListTile(
                onTap: () => print('my notifications'),
                image: 'assets/icons/notifi.png',
                icon: 'assets/icons/arrow.png',
                title: 'Notifications',
              ),
              const SizedBox(
                height: 5,
              ),
              buildListTile(
                onTap: () => print('my inbox'),
                image: 'assets/icons/inbox.png',
                icon: 'assets/icons/arrow.png',
                title: 'Inbox',
              ),
              const SizedBox(
                height: 5,
              ),
              buildListTile(
                onTap: () => print('about us'),
                image: 'assets/icons/about-us.png',
                icon: 'assets/icons/arrow.png',
                title: 'About Us',
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget buildListTile({
    required String image,
    required String icon,
    required String title,
    @required VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: ListTile(
        onTap: onTap,
        leading: Image.asset(image),
        title: Text(
          title,
          style: const TextStyle(color: primaryFontColor),
        ),
        trailing: Image.asset(icon),
      ),
    );
  }
}
