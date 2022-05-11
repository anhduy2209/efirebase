// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/widgets/widgets.dart';

class OrderConfirmation extends StatelessWidget {
  static const String routeName = '/order-confirmation';

  // static Route route() {
  //   return MaterialPageRoute(
  //     settings: RouteSettings(name: routeName),
  //     builder: (context) => OrderConfirmation(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: CustomAppBar(title: 'Order Confirmation'),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          color: Colors.black,
          child: Text(
            'Order Confirmation',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.black54,
                  width: double.infinity,
                  height: 300,
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  top: 125,
                  child: SvgPicture.asset(
                    'assets/svg/garlands.svg',
                    height: 100,
                    width: 100,
                  ),
                ),
                Positioned(
                  top: 250,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Your order is complete!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Duy,',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Thank you for purchasing on my Ecommerce App.',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'ORDER CODE: #d229-nhnt4',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  OrderSummary(),
                  SizedBox(height: 20),
                  Text(
                    'ORDER DETAILS',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Divider(thickness: 2),
                  SizedBox(height: 5),
                  // ListView(
                  //   shrinkWrap: true,
                  //   padding: EdgeInsets.zero,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   children: [
                  //     ProductCard.summary(
                  //       product: Product.products[0],
                  //       quantity: 2,
                  //     ),
                  //     ProductCard.summary(
                  //       product: Product.products[0],
                  //       quantity: 2,
                  //     ),
                  //   ],
                  // ),
                  // ListView.builder(
                  //   itemCount: cart.keys.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return ProductCard.cart(
                  //       product: cart.keys.elementAt(index),
                  //       quantity: cart.values.elementAt(index),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
