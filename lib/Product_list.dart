import 'package:flutter/material.dart';
import 'package:flutter_application_1/global_variables.dart';
import 'package:flutter_application_1/product_card.dart';
import 'package:flutter_application_1/product_detail_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> items = ['ALL', 'Adidas', 'Puma', 'Nike'];
  late String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = items[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; // Gives us all the data depending upon the device we are on

    const border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
        style: BorderStyle.solid,
        width: 1.5,
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          const SafeArea(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final instance = items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = instance;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedItem == instance
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      label: Text(
                        instance,
                        style: const TextStyle(fontSize: 15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // using gridView Builder
          //using layout builder
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 1080) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.4,
                      crossAxisCount: 2,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final instance = products[index];
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ProductDetails(product: instance);
                            }));
                          },
                          child: ProductCard(
                            title: instance['title'] as String,
                            price: instance['price'] as double,
                            image: instance['imageURL'] as String,
                            backgroundColor: index.isEven
                                ? const Color.fromRGBO(216, 240, 253, 1)
                                : const Color.fromRGBO(245, 247, 149, 1),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final instance = products[index];
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ProductDetails(product: instance);
                            }));
                          },
                          child: ProductCard(
                            title: instance['title'] as String,
                            price: instance['price'] as double,
                            image: instance['imageURL'] as String,
                            backgroundColor: index.isEven
                                ? const Color.fromRGBO(216, 240, 253, 1)
                                : const Color.fromRGBO(245, 247, 149, 1),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )

          // ```dart
          // Expanded(
          //   child: size.width > 650
          //       ? GridView.builder(
          //           gridDelegate:
          //               const SliverGridDelegateWithFixedCrossAxisCount(
          //                 childAspectRatio: 1.4,
          //             crossAxisCount: 2,
          //           ),
          //           itemCount: products.length,
          //           itemBuilder: (context, index) {
          //             final instance = products[index];
          //             return Padding(
          //               padding: const EdgeInsets.all(10),
          //               child: GestureDetector(
          //                 onTap: () {
          //                   Navigator.of(context)
          //                       .push(MaterialPageRoute(builder: (context) {
          //                     return ProductDetails(product: instance);
          //                   }));
          //                 },
          //                 child: ProductCard(
          //                   title: instance['title'] as String,
          //                   price: instance['price'] as double,
          //                   image: instance['imageURL'] as String,
          //                   backgroundColor: index.isEven
          //                       ? const Color.fromRGBO(216, 240, 253, 1)
          //                       : const Color.fromRGBO(245, 247, 149, 1),
          //                 ),
          //               ),
          //             );
          //           },
          //         )
          //       : ListView.builder(
          //           itemCount: products.length,
          //           itemBuilder: (context, index) {
          //             final instance = products[index];
          //             return Padding(
          //               padding: const EdgeInsets.all(10),
          //               child: GestureDetector(
          //                 onTap: () {
          //                   Navigator.of(context)
          //                       .push(MaterialPageRoute(builder: (context) {
          //                     return ProductDetails(product: instance);
          //                   }));
          //                 },
          //                 child: ProductCard(
          //                   title: instance['title'] as String,
          //                   price: instance['price'] as double,
          //                   image: instance['imageURL'] as String,
          //                   backgroundColor: index.isEven
          //                       ? const Color.fromRGBO(216, 240, 253, 1)
          //                       : const Color.fromRGBO(245, 247, 149, 1),
          //                 ),
          //               ),
          //             );
          //           },
          //         ),
          // ),
          // ```
        ],
      ),
    );
  }
}
