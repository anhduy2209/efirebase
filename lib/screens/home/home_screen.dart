// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '/blocs/blocs.dart';
import '/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // static Route route() {
  @override
  Widget build(BuildContext context) {
    // final TextEditingController _test = TextEditingController();

    // return Scaffold(
    //   body: Container(
    //     child: Form(
    //       key: _formKey,
    //       child: Padding(
    //         padding: EdgeInsets.all(20),
    //         child: TextFormField(
    //           controller: _test,
    //           decoration: const InputDecoration(hintText: 'Test'),
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    // return Scaffold(
    //     body: Center(
    //   child: ElevatedButton(
    //     onPressed: () {
    //       Navigator.pushNamed(context, '/checkout');
    //     },
    //     child: const Text('La'),
    //   ),
    // ));

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: 'Ecommerce',
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: CustomNavBar(screen: HomeScreen.routeName),
        body: Column(
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                    items: state.categories
                        .map((category) => CarouselCard(category: category))
                        .toList(),
                  );
                } else {
                  return Text('Something went wrong.');
                }
              },
            ),
            SectionTitle(title: 'Recommended'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products
                        .where((product) => product.isRecommended)
                        .toList(),
                  );
                } else {
                  return Text('Something went wrong.');
                }
              },
            ),
            SectionTitle(title: 'Most Popular'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products
                        .where((product) => product.isPopular)
                        .toList(),
                  );
                } else {
                  return Text('Something went wrong.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
