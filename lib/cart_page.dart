import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    // or final cart = context.watch<CardProvider>().cart
    return Scaffold(
        // Appbar
        appBar: AppBar(
          title: Text('Cart'),
        ),

        // Listview is used so that it will lazy load the data in cart
        // Listview has title and subtitle options using listtile.
        body: ListView.builder(
            // Previously we were taking dummy cart value. now used providers
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartItem = cart[index];

              return ListTile(
                // using leading to display icon on left side - circularavatar for circled image  icon.
                leading: CircleAvatar(
                  backgroundImage: AssetImage(cartItem['imageurl'] as String),
                  radius: 30,
                ),

                // using trailing to have delete icon on rightside.
                trailing: IconButton(
                    onPressed: () {
                      // need to show dialog box which return alert box
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "Are you sure you want to remove the item from cart?",
                                style: TextStyle(fontSize: 15),
                              ),

                              // need yes or no which can be done using action
                              // need yes or no with button type and should perform some function on pressing on it

                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // to come out of dialog box on pressing on No.
                                    },
                                    child: Text('No')),
                                TextButton(
                                    onPressed: () {
                                      //<CartProvider> should be mentioned otherwise it won't come
                                      Provider.of<CartProvider>(context,
                                              listen: false)
                                          .removeProduct(
                                              cartItem); // Need to perform remove function cartprovider file using provider..
                                      Navigator.of(context)
                                          .pop(); // to come out of dialog box on pressing on Yes.
                                    },
                                    child: Text('Yes'))
                              ],
                            );
                          });
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),

                title: Text(
                  cartItem['title'].toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: Text('Size:${cartItem['sizes']}'),
              );
            }));
  }
}
