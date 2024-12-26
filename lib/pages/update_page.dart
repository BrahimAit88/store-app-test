import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/model/prodact_model.dart';
import 'package:store_app/services/update_prodact.dart';
import 'package:store_app/widget/custom_text_fild.dart';
import 'package:store_app/widget/show_snack_bar.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});
  static String id = 'Update Page';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? titel, image, desc;
  String? price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProdactModel prodact =
        ModalRoute.of(context)!.settings.arguments as ProdactModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Paage'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                CustomTextFild(
                  hintText: 'Ptodact Name',
                  onChanged: (data) {},
                ),
                CustomTextFild(
                  inputType: TextInputType.number,
                  hintText: 'Enter Price',
                  onChanged: (data) {},
                ),
                CustomTextFild(
                  hintText: 'Enter descreption',
                  onChanged: (data) {},
                ),
                CustomTextFild(
                  hintText: 'Enter image',
                  onChanged: (data) {},
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProdact(prodact);
                      showSnakBar(context, 'seccess');
                    } catch (e) {
                      print(e.toString());
                      showSnakBar(context, 'some think wrong');
                    }
                    isLoading = false;
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                        child: Text(
                      'Updete',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProdact(ProdactModel prodact) async {
    await UpdateProdactService().updateProdact(
        titel: titel == null ? prodact.title : titel!,
        price: price == null ? prodact.price.toString() : price!.toString(),
        desc: desc == null ? prodact.description : desc!,
        image: image == null ? prodact.image : image!,
        category: prodact.category,
        id: prodact.id);
  }
}
