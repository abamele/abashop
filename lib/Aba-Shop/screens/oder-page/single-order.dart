import 'package:abashop/Aba-Shop/constants/colors.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/product-model.dart';
import '../../widgets/text/text-widget.dart';
import 'order-details.dart';


class SingleOrder extends StatelessWidget {
  ProductModel productModel;
  SingleOrder({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: TextWidget(
              text: "${productModel.dateAdded}",
              color: Colors.black,
              textSize: 20,
            ),
            subtitle: TextWidget(
              text: "${productModel.timeAdded}",
              color: Colors.black,
              textSize: 18,
            ),
            trailing: InkWell(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWidget(
                    text: "Details ",
                    color: blueColor,
                    textSize: 18,
                    isTile: true,
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderDetails(
                          productModel: productModel,
                        )));
              },
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Total: ",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextWidget(
                text: "\$${productModel.totalPrice.toStringAsFixed(2)}",
                color: Colors.black,
                textSize: 20,
                isTile: true,
              ),
            ],
          ),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: blueColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextWidget(
                          text: "${productModel.status}",
                          color: kPrimaryColor,
                          textSize: 18),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: FancyShimmerImage(
                      alignment: Alignment.bottomCenter,
                      imageUrl: "${productModel.productImage![0]}",
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.3,
                      boxFit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                      text:
                      "${productModel.orderQuantity} items have been ordered. ",
                      color: Colors.black,
                      textSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
