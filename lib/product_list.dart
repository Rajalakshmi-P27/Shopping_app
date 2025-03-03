import 'package:flutter/material.dart';
import 'package:shop_app/global_variable.dart';
import 'package:shop_app/product_card.dart';
import 'package:shop_app/productdetails_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Adidas',
    'Nike',
    'Puma',
    'Reebok',
    'Bata',
  ];

/* when user click on particular shoe then its product details should be shown
   so use navigation concept on home page 
   
   1. wrap productcard with gesturedetector and put on tap to it
   2. return product details page on tap () using navigator. so that it will return 
   the product details on clicking on it.
   
 */

  /* We need to crate a variable called selected filter to make a 
  user selected field to yellow color 
  1. create a varible 
  2. pass that to init state(which is build before build function) to 
  access its index 
  3. pass same to gesture detector to make it clickable */

  late String selectedFilter;

  final TextEditingController searchController = TextEditingController();
  bool isSearchExpanded = false;
  // to store a value entered my user in search bar.
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    // To make it responsive use media query.
    // screen size variable store the value of each device size.
    // .size is to get device size.
    // MediaQuery.sizeOf(context); or
    final screensize = MediaQuery.of(context).size;

    // border is used to set the border property for the textfield.
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
        //right: Radius.circular(50),
      ),
    );

    return Scaffold(
      // column is wrapped in safearea to avoid the text from being hidden by the status bar (top and bottom bar).
      // Textfield will take as much width as it can get. so only we have wrapped column with width.
      body: SafeArea(
        child: Column(
          children: [
            //Column 1 -> row1 -> Title & row 2 -> Search bar

            Row(
              children: [
                // text field will take max width of the screen so
                // column > row 1.Text
                // wrap only text with padding. simce search contains different property.

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                // column > row 2.Textfield
                // wrap the textfield with expanded to take avaiable width for it.
                // we need hint text as search so we have used InputDecoration.
                // Also we want all the textfield in the screen to have input decoration so we have used InputDecorationTheme in main page.

                Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ))),
              ],
            ),

            // column 2 List of shoes
            // Listview is used so that it will lazy load our list.

            SizedBox(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final filter = filters[index];

                    /* Chip widget to display a list of filters (likely 
                  strings) in a scrolling or non-scrolling list. */
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),

                      // GestureDetector is used to make the chip clickable. wrapped the chip with gesture detector.
                      // setstate is used to rebuild the code. so that the selected filter will be highlighted.

                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        child: Chip(
                            label: Text(filter),
                            labelStyle: TextStyle(
                              fontSize: 16,
                            ),

                            // backgroundColor is set to the color of the chip.
                            backgroundColor: selectedFilter == filter
                                ? const Color.fromRGBO(254, 206, 1, 1)
                                : Color.fromRGBO(245, 247, 249, 1),

                            // converting shape to rounded rectangle.
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),

                            // making border for the chip to same color as background.
                            side: BorderSide(
                                color: Color.fromRGBO(245, 247, 249, 1))),
                      ),
                    );
                  }),
            ),

            // column 3 -> Image data display.

            /// this is the list of shoes. we have used listview.builder to lazy load the list.
            /// Expamded to make use of available space.
            ///
            /// we are using grid view so that it will show in 2 column according
            /// to its decvice sizes.
            ///
            ///

            Expanded(
              // creating condition with screensize
              /* screensize.width > 650 then 
               it must be big screen then build product list with grid
               otherwise build product list with list view builder */

/* If your screen width is 600 pixels: [ VERY IMPORTANT ] 
Each item in the grid will take up 300 pixels in width (600 ÷ 2).
The height of each item will be calculated using the childAspectRatio,
making the height approximately 240 pixels (300 ÷ 1.25).
*/

              child: screensize.width > 650
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        //means each item's width will be 1.25 times its height.

                        childAspectRatio: 1.25, //width-to-height ratio
                      ), // spacing around each image within its grid.
                      itemCount: products
                          .length, //need itemcount same like listview builder

                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductdetailsPage(
                                      product:
                                          product); // product details page has parameters.
                                },
                              ),
                            );
                          },
                          child: ProductCard(
                            title: product['title'] as String,
                            price: product['prices'] as double,
                            image: product['imageurl'] as String,
                            backgroundColor: Colors
                                .white, // Add the required backgroundColor parameter
                          ),
                        );
                      })
                  : ListView.builder(
                      itemCount: products.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductdetailsPage(
                                      product:
                                          product); // product details page has parameters.
                                },
                              ),
                            );
                          },
                          child: ProductCard(
                            title: product['title'] as String,
                            price: product['prices'] as double,
                            image: product['imageurl'] as String,
                            backgroundColor: Colors
                                .white, // Add the required backgroundColor parameter
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
