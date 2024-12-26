import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/model/prodact_model.dart';
import 'package:store_app/services/get_all_prodact.dart';
import 'package:store_app/widget/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'home Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New trand',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.cartPlus,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 55),
        child: FutureBuilder<List<ProdactModel>>(
            future: GetProdact().getProdact(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProdactModel> prodact = snapshot.data!;
                return GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 210,
                  ),
                  itemCount: prodact.length,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      prodact: prodact[index],
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
