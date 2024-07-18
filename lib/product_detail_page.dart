import 'package:flutter/material.dart';
import 'package:flutter_application_1/change_notfier.dart';
// import 'package:flutter_application_1/global_variables.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int filter = 0;
  int selectedSizeOfShoe = 0;

  void onTap() {
    if (selectedSizeOfShoe != 0) {
      //
      Provider.of<CartProvider>(context, listen: false).addProduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'size': selectedSizeOfShoe,
        'imageURL': widget.product['imageURL'],
        'company': widget.product['company'],
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Item Added to the Cart !')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please Select a Size')));
    }
    // print(Provider.of<CartProvider>(context, listen: false).cart);//
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Details',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.of(context).push(MaterialPageRoute(builder: (context){
        //         return const  Homepage();
        //       }));
        //     },
        //     icon: const Icon(
        //       Icons.skip_previous,
        //     )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.product['title'] as String,
            style: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Center(child: Image.asset(widget.product['imageURL']! as String,height: 350,)),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            // width: double.infinity,
            child: Column(
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: const TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        // print((product['sizes'] as List<int>).length,);
                        final size =
                            (widget.product['sizes'] as List<int>)[index];
                        // print(size);
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: GestureDetector(
                            onTap: () {
                              selectedSizeOfShoe = size;
                              filter = size;
                              setState(() {});
                            },
                            child: Chip(
                              label: Text(
                                size.toString(),
                              ),
                              backgroundColor: filter == size
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.white,
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Add To Cart',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
