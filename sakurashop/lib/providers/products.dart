import 'dart:math';

import 'package:flutter/foundation.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'http://cdn.shopify.com/s/files/1/1270/1127/products/1975_red_shirt_grande.png?v=1543869413',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl: 'https://www.bytimo.no/wp-content/uploads/2019/09/001.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://target.scene7.com/is/image/Target/GUEST_6550fc8b-aff0-4bbf-9471-5ffec074c636?wid=488&hei=488&fmt=pjpeg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favorites {
    return _items.where((product) => product.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  void addProduct(Product product) {
    final newProduct = Product(
      id: Random.secure().toString(),
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl
    );

    _items.add(newProduct);
    notifyListeners();
  }
}
