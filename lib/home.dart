import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:flutter_bloc_restapi_firebase/widget/custom_container.dart";
import "package:flutter_bloc_restapi_firebase/widget/custom_text.dart";
import "package:flutter_bloc_restapi_firebase/widget/round_image.dart";
import "package:flutter_bloc_restapi_firebase/utils/device_parameters.dart";
import "package:flutter_bloc_restapi_firebase/components/price_row.dart";

import 'bloc/product_bloc.dart';
import 'model/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductBloc>(context).add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("List Product"),
          ),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state is ProductLoaded) {
            List<ProductModel> listData = state.data;
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (() {}),
                    child: CustomContainer(
                      color: Colors.grey[350],
                      borderRadius: 10,
                      borderShadow: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: CustomContainer(
                                    borderRadius: 30,
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: CustomText(
                                        text: '30% OFF',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RoundImage(
                            imageAsset: listData[index].image,
                            width: DeviceParameters.screenWidth(context) / 2.75,
                            aspectRatio: 0.9,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.5),
                            child: CustomContainer(
                              borderRadius: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: listData[index].name,
                                      textColor: Colors.grey[700],
                                    ),
                                    const SizedBox(height: 5),
                                    PriceRow(
                                      saleOffPrice:
                                          listData[index].originalPrice,
                                      originalPrice:
                                          listData[index].originalPrice,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else if (state is ProductLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Text("fail");
          }
        }));

    // return ListView.builder(
    //   itemCount: listData.length,
    //   itemBuilder: (_, index) {
    //     print(listData[index].name);
    //     return Card(
    //       child: ListTile(
    //         title: Text(listData[index].name),
    //         // trailing: Text(listData[index].originalPrice.toString()),
    //       ),
    //     );
    //   },
    // );
  }
}
