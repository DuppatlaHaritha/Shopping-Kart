
//27-10-2025 working
/*import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  List<CartItem> get items => _items;

  void add(Product p) {
    final idx = _items.indexWhere((e) => e.product.id == p.id);
    if (idx >= 0) {
      _items[idx].quantity += 1;
    } else {
      _items.add(CartItem(product: p));
    }
    notifyListeners();
  }

  void remove(Product p) {
    _items.removeWhere((e) => e.product.id == p.id);
    notifyListeners();
  }

  double total() {
    double t = 0.0;
    for (var it in _items) {
      t += it.product.price * it.quantity;
    }
    return t;
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void decrement(Product p) {
    final idx = _items.indexWhere((e) => e.product.id == p.id);
    if (idx >= 0) {
      if (_items[idx].quantity > 1) {
        _items[idx].quantity -= 1;
      } else {
        _items.removeAt(idx);
      }
      notifyListeners();
    }
  }



  // ✅ Added method to fix your error
  int getQuantity(Product p) {
    final item = _items.firstWhere(
          (e) => e.product.id == p.id,
      orElse: () => CartItem(product: p, quantity: 0),
    );
    return item.quantity;
  }
}
*/
/*
import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  List<CartItem> get items => _items;

  void add(Product p) {
    final idx = _items.indexWhere((e) => e.product.id == p.id);
    if (idx >= 0) {
      _items[idx].quantity += 1;
    } else {
      _items.add(CartItem(product: p));
    }
    notifyListeners();
  }

  void remove(Product p) {
    _items.removeWhere((e) => e.product.id == p.id);
    notifyListeners();
  }

  double total() {
    double t = 0.0;
    for (var it in _items) {
      // ✅ Use newPrice if available, otherwise old price
      final price = (it.product.newPrice != null && it.product.newPrice! > 0)
          ? it.product.newPrice!
          : it.product.price;
      t += price * it.quantity;
    }
    return t;
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void decrement(Product p) {
    final idx = _items.indexWhere((e) => e.product.id == p.id);
    if (idx >= 0) {
      if (_items[idx].quantity > 1) {
        _items[idx].quantity -= 1;
      } else {
        _items.removeAt(idx);
      }
      notifyListeners();
    }
  }

  // ✅ Returns current quantity of given product
  int getQuantity(Product p) {
    final item = _items.firstWhere(
          (e) => e.product.id == p.id,
      orElse: () => CartItem(product: p, quantity: 0),
    );
    return item.quantity;
  }
}
*/


/*
import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  List<CartItem> get items => _items;

  void add(Product p) {
    final idx = _items.indexWhere((e) => e.product.id == p.id);
    if (idx >= 0) {
      _items[idx].quantity += 1;
    } else {
      _items.add(CartItem(product: p));
    }
    notifyListeners();
  }

  void remove(Product p) {
    _items.removeWhere((e) => e.product.id == p.id);
    notifyListeners();
  }

  double total() {
    double t = 0.0;
    for (var it in _items) {
      // ✅ Use newPrice if available, otherwise old price
      final price = (it.product.newPrice != null && it.product.newPrice! > 0)
          ? it.product.newPrice!
          : it.product.price;
      t += price * it.quantity;
    }
    return t;
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void decrement(Product p) {
    final idx = _items.indexWhere((e) => e.product.id == p.id);
    if (idx >= 0) {
      if (_items[idx].quantity > 1) {
        _items[idx].quantity -= 1;
      } else {
        _items.removeAt(idx);
      }
      notifyListeners();
    }
  }

  // ✅ Returns current quantity of given product
  int getQuantity(Product p) {
    final item = _items.firstWhere(
          (e) => e.product.id == p.id,
      orElse: () => CartItem(product: p, quantity: 0),
    );
    return item.quantity;
  }
}
*/

import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  List<CartItem> get items => _items;

  void add(Product p) {
    final idx = _items.indexWhere((e) => e.product.id == p.id);
    if (idx >= 0) {
      _items[idx].quantity += 1;
    } else {
      _items.add(CartItem(product: p));
    }
    notifyListeners();
  }

  void remove(Product p) {
    _items.removeWhere((e) => e.product.id == p.id);
    notifyListeners();
  }

  double total() {
    double t = 0.0;
    for (var it in _items) {
      // ✅ Use newPrice if available, otherwise old price
      final price = (it.product.newPrice != null && it.product.newPrice! > 0)
          ? it.product.newPrice!
          : it.product.price;
      t += price * it.quantity;
    }
    return t;
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void decrement(Product p) {
    final idx = _items.indexWhere((e) => e.product.id == p.id);
    if (idx >= 0) {
      if (_items[idx].quantity > 1) {
        _items[idx].quantity -= 1;
      } else {
        _items.removeAt(idx);
      }
      notifyListeners();
    }
  }

  // ✅ Returns current quantity of given product
  int getQuantity(Product p) {
    final item = _items.firstWhere(
          (e) => e.product.id == p.id,
      orElse: () => CartItem(product: p, quantity: 0),
    );
    return item.quantity;
  }

  // ✅ NEW — Total items count (for cart badge / bottom nav)
  int get totalItems {
    int count = 0;
    for (var item in _items) {
      count += item.quantity;
    }
    return count;
  }
}
