import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';
import 'package:shop_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

/* 
What is providers? -> its of inherited widget concept. you can create 
more provider at a time(while calling it will use only nearest provider)
   1. Get the package from flutter and it under dependencies in pubspec.yaml
   2. Concept : it will create a common storage for all its decending widgets.
                so that all the descending widgets can use that common storage.
                provider must have create to store its value
   
   For eg., here provider store 'hello' in its storage. so that all descending
   widget can use it. 
           -> Provider storage declared in home page. Provider(create:(context)=> "Hello")
           -> call the providers like below on the page where you want,
              Provider.of(context); [enclose with print so that it will print hello on terminal]

Types of providers(read only value),
1. ChangeNotifierProvider -> you can change the value in store and notify it. (helpful 
   in shopping app to update the cart value)
   syntax:

   return ChangeNotifierProvider(
          create:(context) => Classname ) // class should extends ChangeNotifier in separate file.

2. FutureProviders
3. StreamProviders
 */

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          CartProvider(), // you can have a common storage at class CartProvider
      child: MaterialApp(
        title: "Shopping App",

        // Theme is used to set the property for the entire app.
        theme: ThemeData(
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1)),

          // InputDecorationTheme is used in themedata so that all the textfield in the app will have the same property.
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            // color is set for prefix icon in theme so that all the prefix icon in the app will have the same color.
            prefixIconColor: const Color.fromRGBO(119, 119, 119, 1),
          ),

          // Making every text to have same theme.
          textTheme: const TextTheme(

              // For title large
              titleLarge: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),

              // For title
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),

              // For price
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),

          // In productdetails_page. there is an appbar.
          // so we are setting the appbar theme here.

          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black,
          )),

          useMaterial3: true,
        ),

        home: HomePage(),
      ),
    );
  }
}
