import 'package:flutter/material.dart';
import 'package:flutter_application_1/change_notfier.dart';
// import 'package:flutter_application_1/global_variables.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final cart = context.watch<CartProvider>().cart; can use this instead 
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartItem = cart[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(cartItem['imageURL'] as String),
                  radius: 30,
                ),
                title: Text(
                  cartItem['title'] as String,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text(
                  'Size : ${cartItem['size']}',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //     content: Column(
                    //   children: [
                    //     Text(
                    //         'Are you sure you want to remove the item from the cart?'),
                    //     IconButton(
                    //         onPressed: () {
                    //           Provider.of<CartProvider>(context, listen: false)
                    //               .removeProduct(cartItem);
                    //         },
                    //         icon: Icon(Icons.youtube_searched_for)),
                    //     IconButton(
                    //           onPressed: () {
                    //           areYouSure = false;
                    //         },
                    //         icon: Icon(Icons.signal_cellular_no_sim_sharp)),
                    //   ],
                    // )));
                    showDialog(
                      barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            
                            title: Text(
                              'Delete Product',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            content: const Text(
                                'Are you sure you want to remove the product fromt the cart ?'),
                            actions: [
                              TextButton(
                                  onPressed: () {

                                    // context.read<CartProvider>().removeProduct(cartItem); can use this 
                                    Provider.of<CartProvider>(context, listen: false)
                                  .removeProduct(cartItem);
                                  Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Yes',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'No',
                                    style: TextStyle(
                                      color: Colors.red,
                                       fontWeight: FontWeight.bold,
                                    ),
                                  ))
                            ],
                          );
                        });
                  },
                ),
              );
            }));
  }
}
