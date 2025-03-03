import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

/* In this page we need 
  1 app bar with title and > icon
  2. title of product, Which we can take from product variable of type
     list using constructor.
  3. Need to display the image. which should take from from product variable of type
     list. 2 & 3 & 4 can be done in column manner.

     
  4. bootom bar  with price , size and add to cart button with container*/

/* To make the selected size to yellow 

1. State Variable: Added selectedSize to keep track of the currently selected size.  under _ProductdetailsPageState class 
2. Wrapped the Chip in a GestureDetector to update the selected size when tapped.
3. Changed the backgroundColor of the Chip based on whether the size is selected. 

*/

/* when user click on particular shoe then its product details should be shown
   so use navigation concept on home page 
   
   1. wrap productcard with gesturedetector and put on tap to it
   2. return product details page on tap () using navigator. so that it will return 
   the product details on clicking on it.

 */

class ProductdetailsPage extends StatefulWidget {
  final Map<String, Object> product;

  const ProductdetailsPage({super.key, required this.product});

  @override
  State<ProductdetailsPage> createState() => _ProductdetailsPageState();
}

class _ProductdetailsPageState extends State<ProductdetailsPage> {
  int? selectedSize;

  void onTap() {
    //Provider.of(context).addProduct(product);
    // Listen to false since we are declaring it outside build function.
    // <CartProvider> => classname , widget.product is given since its of stateful widget
    // we need its title,id price as so on to display in cart so pass as key value pair.

    if (selectedSize == null) {
      // Show a popup message if no size is selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a size!"),
        ),
      );
    } else {
      // Add the product to the cart
      Provider.of<CartProvider>(context, listen: false).addProduct({
        'id': widget.product['id'],
        'company': widget.product['company'],
        'title': widget.product['title'],
        'prices': widget.product['prices'],
        'sizes': selectedSize,
        'imageurl': widget.product['imageurl'],
      });

      // To show successful message.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Added to cart"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // 1. app bar with title and > icon

        appBar: AppBar(
          title: Text('Product details',
              style: Theme.of(context).appBarTheme.titleTextStyle),
          /*leading: IconButton(
            // To display back icon according to your device.

            icon: Icon(
              Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            ),
            //icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context); // Navigates back to the previous page
            },
          ),*/
        ),

        // 2. title of product, Which we can take from product variable of type list
        body: Column(
          children: [
            // 2. title of product
            Text(widget.product['title'] as String,
                style: Theme.of(context).textTheme.titleLarge),

            // 3. Need to display the image. which should take from from product variable of type list
            /* Spacer is similar to size box. but it will create flex(space) for
            it. since here we given before image so it cretae one flex
            
            if two spacer is used then it will create two flex and each flex
            takes 1/2 space. if you want to increase it space u can specify them on
            flex:value. 
            
            const Spacer(),
            Image.asset(product['imageurl'] as String),
            const Spacer(),
            
            above one take 1/2 space above and below image.
            
            */

            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(widget.product['imageurl'] as String),
            ),
            const Spacer(flex: 2),

            // 4. bootom bar  with price , size and add to cart button with container
            /* container has decoration property to set the border and color of the container.
            Container will take max width so setting height for it  */

            /* i saw overflow error in ios but it was working fine in android
            soo i used SafeArea */

            SafeArea(
              child: Container(
                  //height: 250,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 247, 249),
                      borderRadius: BorderRadius.circular(40)),

                  // price , size and add to cart button -> in column manner inside container.
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //child 1 -> Display price
                        Text('\$${widget.product['prices']}',
                            style: Theme.of(context).textTheme.titleLarge),

                        SizedBox(height: 10),

                        // child 2 -> display size using listview.builder
                        /* Since chip take a space as much as it can get. so we 
                    hav eused horizontal scroll view. */

                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  (widget.product['sizes'] as List<int>).length,
                              itemBuilder: (context, index) {
                                final size = (widget.product['sizes']
                                    as List<int>)[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedSize = size;
                                      });
                                    },
                                    child: Chip(
                                      label: Text(size.toString()),
                                      backgroundColor: size == selectedSize
                                          ? Colors.yellow
                                          : null,
                                    ),
                                  ),
                                );
                              }),
                        ),

                        //  Child 3 -> Add to cart button
                        /* Elevated button is used to make the button look like a button.
                    onPressed is used to make the button clickable. */

                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton(
                            onPressed: onTap,
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(247, 216, 41, 1),
                                fixedSize: const Size(350,
                                    50)), // to make fixed size for all devices.
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_cart),
                                SizedBox(width: 8),
                                Text(
                                  'Add to cart',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ])),
            )
          ],
        ));
  }
}
