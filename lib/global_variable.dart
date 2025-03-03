/* We are going to 
      Create a list of products <string> & 
      products are going to be in map format <dynamic>. */

/* 'All',
    'Adidas',
    'Nike',
    'Puma',
    'Reebok',
    'Bata', */

// List (products) -> map

// Uncommand some line in pubspec.yaml as you did in font

final List products = [
  // Map 1 = Adidas
  {
    'id': '1',
    'company': 'Adidas',
    'title': 'Adidas men \'s shoes',
    'prices': 23.14,
    'sizes': [8, 9, 10, 11, 12],
    'imageurl': 'assets/images/Adidas.png'
  },

  // Map 2 = Nike
  {
    'id': '2',
    'company': 'Nike',
    'title': 'Nike shoes',
    'prices': 40.57,
    'sizes': [8, 9, 10, 11, 12],
    'imageurl': 'assets/images/nike.png'
  },

  // Map 3 = Puma
  {
    'id': '3',
    'company': 'Puma',
    'title': 'Puma men \'s shoes',
    'prices': 45.69,
    'sizes': [8, 9, 10, 11],
    'imageurl': 'assets/images/Puma.png'
  },

  // Map 4 = Reebok
  {
    'id': '4',
    'company': 'Reebok',
    'title': 'Reebok women \'s shoes',
    'prices': 45.80,
    'sizes': [9, 10, 11, 12],
    'imageurl': 'assets/images/Reebok.png'
  },

  // Map 5 = Bata
  {
    'id': '5',
    'company': 'Bata',
    'title': 'Bata men \'s shoes',
    'prices': 52.06,
    'sizes': [8, 9, 10, 11, 12],
    'imageurl': 'assets/images/Bata.png'
  },
];

// dummy data to store in cart.

/* final cart = [
  {
    'id': '1',
    'company': 'Adidas',
    'title': 'Adidas men \'s shoes',
    'prices': 23.14,
    'sizes': 8,
    'imageurl': 'assets/images/Adidas.png'
  }
];
*/
