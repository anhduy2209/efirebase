// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imgUrl;

  const Category({
    required this.name,
    required this.imgUrl,
  });

  @override
  List<Object?> get props => [
        name,
        imgUrl,
      ];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(
      name: snap['name'],
      imgUrl: snap['imgUrl'],
    );
    return category;
  }

  // static List<Category> categories = [
  //   Category(
  //     name: 'Soft Drinks',
  //     imgUrl:
  //         'https://images.unsplash.com/photo-1527960471264-932f39eb5846?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  //   ),
  //   Category(
  //     name: 'Smoothies',
  //     imgUrl:
  //         'https://images.unsplash.com/photo-1619898804188-e7bad4bd2127?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80',
  //   ),
  //   Category(
  //     name: 'Water',
  //     imgUrl:
  //         'https://images.unsplash.com/photo-1618683133131-3c8907882c7c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  //   ),
  //   Category(
  //     name: 'Coffee',
  //     imgUrl:
  //         'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  //   )
  // ];
}
