/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (ctx, i){
              final it = cart.items[i];
              return ListTile(
                leading: it.product.imageUrl != null
                    ? Image.network(
                  it.product.imageUrl!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
                    : Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey[300],
                  child: Icon(Icons.image, color: Colors.grey),
                ),
                title: Text(it.product.name),
                subtitle: Text('₹' + it.product.price.toString() + ' x ' + it.quantity.toString()),
                trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => cart.remove(it.product)),
              );
            },
          )),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Total: ₹' + cart.total().toStringAsFixed(2), style: TextStyle(fontSize:18)),
                SizedBox(height:8),
                ElevatedButton(onPressed: (){ Navigator.pushNamed(context, '/checkout'); }, child: Text('Proceed to Checkout'))
              ],
            ),
          )
        ],
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                final it = cart.items[i];
                return ListTile(
                  leading: it.product.imageUrl != null
                      ? Image.network(
                    it.product.imageUrl!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[300],
                    child: Icon(Icons.image, color: Colors.grey),
                  ),
                  title: Text(it.product.name),
                  // ===== Updated subtitle with quantity controls =====
                  subtitle: Row(
                    children: [
                      // Decrement Button
                      IconButton(
                        icon: Icon(Icons.remove_circle, color: Color(0xFF800000)),
                        onPressed: () {
                          cart.decrement(it.product);
                        },
                      ),
                      // Quantity Text
                      Text(
                        '${it.quantity}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      // Increment Button
                      IconButton(
                        icon: Icon(Icons.add_circle, color: Color(0xFF800000)),
                        onPressed: () {
                          cart.add(it.product);
                        },
                      ),
                      SizedBox(width: 10),
                      // Total price for this product
                      Text('₹${(it.product.price * it.quantity).toStringAsFixed(2)}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => cart.remove(it.product),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Total: ₹' + cart.total().toStringAsFixed(2),
                    style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: Text('Proceed to Checkout'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}*/


//27-10-2025 working
/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: cart.items.isEmpty
          ? const Center(
        child: Text(
          'Your cart is empty',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )


      :Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                final it = cart.items[i];
                return ListTile(
                  leading: it.product.imagePath != null
                      ? Image.network(
                    it.product.imagePath!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[300],
                    child: Icon(Icons.image, color: Colors.grey),
                  ),
                  title: Text(it.product.name),
                  subtitle: Text(
                      '₹${it.product.price.toStringAsFixed(2)} x ${it.quantity}'),
                  // ===== Updated trailing with quantity controls before delete =====
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Decrement Button
                      IconButton(
                        icon: Icon(Icons.remove_circle, color: Color(0xFF800000)),
                        onPressed: () {
                          cart.decrement(it.product);
                        },
                      ),
                      // Quantity Text
                      Text(
                        '${it.quantity}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      // Increment Button
                      IconButton(
                        icon: Icon(Icons.add_circle, color: Color(0xFF800000)),
                        onPressed: () {
                          cart.add(it.product);
                        },
                      ),
                      // Delete Icon
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => cart.remove(it.product),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Total: ₹' + cart.total().toStringAsFixed(2),
                    style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: Text('Proceed to Checkout'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: cart.items.isEmpty
          ? const Center(
        child: Text(
          'Your cart is empty',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                final it = cart.items[i];
                // ✅ Select price (newPrice if available)
                final price = (it.product.newPrice != null && it.product.newPrice! > 0)
                    ? it.product.newPrice!
                    : it.product.price;

                return ListTile(
                  leading: it.product.imagePath != null
                      ? Image.network(
                    it.product.imagePath!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[300],
                    child: Icon(Icons.image, color: Colors.grey),
                  ),
                  title: Text(it.product.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ✅ Show price and quantity
                      Text(
                        '₹${price.toStringAsFixed(2)} x ${it.quantity}',
                        style: TextStyle(fontSize: 14),
                      ),
                      // ✅ If new price exists, show old price struck out
                      if (it.product.newPrice != null && it.product.newPrice! > 0)
                        Text(
                          'Old Price: ₹${it.product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                    ],
                  ),
                  // ===== Updated trailing with quantity controls before delete =====
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Decrement Button
                      IconButton(
                        icon: Icon(Icons.remove_circle, color: Color(0xFF800000)),
                        onPressed: () {
                          cart.decrement(it.product);
                        },
                      ),
                      // Quantity Text
                      Text(
                        '${it.quantity}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      // Increment Button
                      IconButton(
                        icon: Icon(Icons.add_circle, color: Color(0xFF800000)),
                        onPressed: () {
                          cart.add(it.product);
                        },
                      ),
                      // Delete Icon
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => cart.remove(it.product),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Total: ₹' + cart.total().toStringAsFixed(2),
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: Text('Proceed to Checkout'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: cart.items.isEmpty
          ? const Center(
        child: Text(
          'Your cart is empty',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                final it = cart.items[i];
                // ✅ Select price (newPrice if available)
                final price = (it.product.newPrice != null && it.product.newPrice! > 0)
                    ? it.product.newPrice!
                    : it.product.price;

                return ListTile(
                  leading: it.product.imagePath != null
                      ? Image.network(
                    it.product.imagePath!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[300],
                    child: Icon(Icons.image, color: Colors.grey),
                  ),
                  title: Text(it.product.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ✅ Show price and quantity
                      Text(
                        '₹${price.toStringAsFixed(2)} x ${it.quantity}',
                        style: TextStyle(fontSize: 14),
                      ),
                      // ✅ If new price exists, show old price struck out
                      if (it.product.newPrice != null && it.product.newPrice! > 0)
                        Text(
                          'Old Price: ₹${it.product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                    ],
                  ),
                  // ===== Updated trailing with quantity controls before delete =====
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Decrement Button
                      IconButton(
                        icon: Icon(Icons.remove_circle, color: Color(0xFF800000)),
                        onPressed: () {
                          cart.decrement(it.product);
                        },
                      ),
                      // Quantity Text
                      Text(
                        '${it.quantity}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      // Increment Button
                      IconButton(
                        icon: Icon(Icons.add_circle, color: Color(0xFF800000)),
                        onPressed: () {
                          cart.add(it.product);
                        },
                      ),
                      // Delete Icon
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => cart.remove(it.product),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Total: ₹' + cart.total().toStringAsFixed(2),
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: Text('Proceed to Checkout'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: cart.items.isEmpty
          ? const Center(
        child: Text(
          'Your cart is empty',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                final it = cart.items[i];

                // ✅ Select price (newPrice if available)
                final price = (it.product.newPrice != null &&
                    it.product.newPrice! > 0)
                    ? it.product.newPrice!
                    : it.product.price;

                return ListTile(
                  leading: it.product.imagePath != null
                      ? Image.network(
                    it.product.imagePath!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[300],
                    child:
                    const Icon(Icons.image, color: Colors.grey),
                  ),
                  title: Text(it.product.name),

                  // ✅ Price moved beside quantity controls
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Old price (if any)
                      if (it.product.newPrice != null &&
                          it.product.newPrice! > 0)
                        Text(
                          '₹${price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        )
                      else
                        Text(
                          '₹${it.product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                    ],
                  ),

                  // ===== Quantity controls and price aligned in trailing =====
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Decrement Button
                      IconButton(
                        icon: const Icon(Icons.remove_circle,
                            color: Color(0xFF800000)),
                        onPressed: () {
                          cart.decrement(it.product);
                        },
                      ),

                      // Quantity Text
                      Text(
                        '${it.quantity}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),

                      // Increment Button
                      IconButton(
                        icon: const Icon(Icons.add_circle,
                            color: Color(0xFF800000)),
                        onPressed: () {
                          cart.add(it.product);
                        },
                      ),

                      // ✅ Price beside increment buttons
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '₹${(price * it.quantity).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      // Delete Icon
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => cart.remove(it.product),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Total: ₹${cart.total().toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: const Text('Proceed to Checkout'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: cart.items.isEmpty
          ? const Center(
        child: Text(
          'Your cart is empty',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                final it = cart.items[i];

                // ✅ Select price (newPrice if available)
                final price = (it.product.newPrice != null &&
                    it.product.newPrice! > 0)
                    ? it.product.newPrice!
                    : it.product.price;

                return ListTile(
                  leading: it.product.imagePath != null
                      ? Image.network(
                    it.product.imagePath!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image,
                        color: Colors.grey),
                  ),
                  title: Text(it.product.name),

                  // ✅ Removed price text from subtitle (to move it before buttons)
                  subtitle: (it.product.newPrice != null &&
                      it.product.newPrice! > 0)
                      ? Text(
                    'Old Price: ₹${it.product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  )
                      : null,

                  // ===== Updated trailing with price shown before quantity controls =====
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ✅ Show price before decrement button
                      Text(
                        '₹${price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Decrement Button
                      IconButton(
                        icon: const Icon(Icons.remove_circle,
                            color: Color(0xFF800000)),
                        onPressed: () {
                          cart.decrement(it.product);
                        },
                      ),

                      // Quantity Text
                      Text(
                        '${it.quantity}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),

                      // Increment Button
                      IconButton(
                        icon: const Icon(Icons.add_circle,
                            color: Color(0xFF800000)),
                        onPressed: () {
                          cart.add(it.product);
                        },
                      ),

                      // Delete Icon
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => cart.remove(it.product),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Total: ₹' + cart.total().toStringAsFixed(2),
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: const Text('Proceed to Checkout'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _selectedIndex = 2; // Cart tab selected by default

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0: // Home (Products Screen)
        Navigator.pushReplacementNamed(context, '/products');
        break;
      case 1: // Media
        Navigator.pushReplacementNamed(context, '/media');
        break;
      case 2: // Cart
        break; // Already here
      case 3: // My Orders
        Navigator.pushReplacementNamed(context, '/orders');
        break;
      case 4: // Contact Us
        Navigator.pushReplacementNamed(context, '/contact');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: cart.items.isEmpty
          ? const Center(
        child: Text(
          'Your cart is empty',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                final it = cart.items[i];

                // ✅ Select price (newPrice if available)
                final price = (it.product.newPrice != null &&
                    it.product.newPrice! > 0)
                    ? it.product.newPrice!
                    : it.product.price;

                return ListTile(
                  leading: it.product.imagePath != null
                      ? Image.network(
                    it.product.imagePath!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image,
                        color: Colors.grey),
                  ),
                  title: Text(it.product.name),
                  subtitle: (it.product.newPrice != null &&
                      it.product.newPrice! > 0)
                      ? Text(
                    'Old Price: ₹${it.product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  )
                      : null,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ✅ Price before decrement button
                      Text(
                        '₹${price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Decrement button
                      IconButton(
                        icon: const Icon(Icons.remove_circle,
                            color: Color(0xFF800000)),
                        onPressed: () {
                          cart.decrement(it.product);
                        },
                      ),

                      // Quantity
                      Text(
                        '${it.quantity}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),

                      // Increment button
                      IconButton(
                        icon: const Icon(Icons.add_circle,
                            color: Color(0xFF800000)),
                        onPressed: () {
                          cart.add(it.product);
                        },
                      ),

                      // Delete button
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => cart.remove(it.product),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Total: ₹${cart.total().toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF800000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Proceed to Checkout',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),

      // ✅ Common Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        selectedItemColor: const Color(0xFF800000), // maroon color
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: 'Media'),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                if (cart.totalItems > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints:
                      const BoxConstraints(minWidth: 16, minHeight: 16),
                      child: Text(
                        '${cart.totalItems}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.list_alt), label: 'My Orders'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail), label: 'Contact Us'),
        ],
      ),
    );
  }
}
*/