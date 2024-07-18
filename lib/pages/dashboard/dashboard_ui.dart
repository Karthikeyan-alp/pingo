// ignore_for_file: prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../globals/app.dart' as app;

class DashboardUI extends StatelessWidget {
  var productList;

  DashboardUI({super.key, required this.productList});

  test() {}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<String> snapshot) {
        return GridView.builder(
          itemCount: productList.length,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (BuildContext context, int index) {
            if(app.withoutDiscount) {
              return Card(
                color: app.cardColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: SizedBox(
                          height: 110,
                          child: CachedNetworkImage(
                            imageUrl: productList[index]['thumbnail'],
                            placeholder: (context, url) =>
                            const LinearProgressIndicator(
                                backgroundColor: Colors.grey,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.grey,
                                )),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text(
                            productList[index]['title'],
                            style:  TextStyle(
                                fontFamily: "Poppins",
                                color: app.text,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(child: Text(
                        "\$""${productList[index]['price']}",
                        style:  TextStyle(fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,color: app.text),)),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(child: Container(
                        width: 120, height: 35, decoration: BoxDecoration(
                          color: app.buttonColor,
                          borderRadius: BorderRadius.circular(15)),
                        child: Center(child: Text("View Details",
                          style: TextStyle(fontFamily: "Poppins",
                              color: app.background,
                              fontSize: 12),)),
                      ))
                    ],
                  ),
                ),
              );
            }else{
                var discountAmount = productList[index]['price'] * (productList[index]['discountPercentage'] / 100);
                var finalPrice = productList[index]['price'] - discountAmount;
                return Card(
                  color: app.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text("${productList[index]['discountPercentage']} % off",style: const TextStyle(fontFamily: "Poppins",color: Colors.green,fontWeight: FontWeight.w600),),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: SizedBox(
                            height: 100,
                            child: CachedNetworkImage(
                              imageUrl: productList[index]['thumbnail'],
                              placeholder: (context, url) =>
                              const LinearProgressIndicator(
                                  backgroundColor: Colors.grey,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.grey,
                                  )),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                            child: Text(
                              productList[index]['title'],
                              style:  TextStyle(
                                  fontFamily: "Poppins",
                                  color: app.text,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            "\$""${productList[index]['price']}",
                            style:  TextStyle(fontFamily: "Poppins",
                                color: app.text,
                                fontWeight: FontWeight.w300,decoration: TextDecoration.lineThrough),),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(child: Container(
                          width: 120, height: 35, decoration: BoxDecoration(
                            color: app.buttonColor,
                            borderRadius: BorderRadius.circular(15)),
                          child: Center(child: Text("Buy - ""\$"+finalPrice.toStringAsFixed(2),
                            style: TextStyle(fontFamily: "Poppins",
                                color: app.background,
                                fontSize: 12),)),
                        ))
                      ],
                    ),
                  ),
                );
              }
            }
        );
      },
      future: test(),
    );
  }
}
