import 'package:flutter/material.dart';

import 'package:like_button/like_button.dart';
import 'package:store_app/model/prodact_model.dart';
import 'package:store_app/pages/update_page.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({
    required this.prodact,
    super.key,
  });

  ProdactModel prodact;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdatePage.id, arguments: prodact);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 150,
            width: 200,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  spreadRadius: 0,
                  offset: Offset(5, 5),
                  blurRadius: 40,
                  color: Colors.grey.withAlpha(10)),
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      prodact.title.substring(0, 10),
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${prodact.price.toString()}'),
                        LikeButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 35,
            top: -40,
            child: Image.network(
              prodact.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
