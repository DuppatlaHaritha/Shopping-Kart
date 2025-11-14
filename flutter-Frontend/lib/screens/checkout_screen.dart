
//27-10-2025 working
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../services/api_service.dart';
import 'dart:convert';

class CheckoutScreen extends StatefulWidget {
  @override State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController _coupon = TextEditingController();
  bool _loading = false;

  _placeOrder() async {
    final cart = Provider.of<CartProvider>(context, listen:false);
    if (cart.items.isEmpty) return;
    setState(()=>_loading=true);
    final items = cart.items.map((it) => {'productId': it.product.id, 'quantity': it.quantity}).toList();
    final body = {'items': items, 'couponCode': _coupon.text.trim()};
    final res = await ApiService.post('/api/orders', body, withAuth: true);
    setState(()=>_loading=false);
    if (res.statusCode == 201 || res.statusCode==200) {
      cart.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order placed')));
      Navigator.pushReplacementNamed(context, '/');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order failed: ' + res.body)));
    }
  }

  @override Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Text('Total: ₹' + cart.total().toStringAsFixed(2), style: TextStyle(fontSize:20)),
          TextField(controller: _coupon, decoration: InputDecoration(labelText: 'Coupon code (optional)')),
          SizedBox(height: 16),
          _loading ? CircularProgressIndicator() : ElevatedButton(onPressed: _placeOrder, child: Text('Place Order'))
        ]),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../services/api_service.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController _coupon = TextEditingController();
  bool _loading = false;

  _placeOrder() async {
    final cart = Provider.of<CartProvider>(context, listen: false);
    if (cart.items.isEmpty) return;

    setState(() => _loading = true);

    // ✅ Use newPrice if available while placing order
    final items = cart.items.map((it) {
      final price = (it.product.newPrice != null && it.product.newPrice! > 0)
          ? it.product.newPrice!
          : it.product.price;
      return {
        'productId': it.product.id,
        'quantity': it.quantity,
        'price': price,
      };
    }).toList();

    final body = {
      'items': items,
      'couponCode': _coupon.text.trim(),
    };

    final res = await ApiService.post('/api/orders', body, withAuth: true);
    setState(() => _loading = false);

    if (res.statusCode == 201 || res.statusCode == 200) {
      cart.clear();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Order placed')));
      Navigator.pushReplacementNamed(context, '/');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Order failed: ' + res.body.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    // ✅ Calculate total using newPrice if available
    double total = 0.0;
    for (var it in cart.items) {
      final price = (it.product.newPrice != null && it.product.newPrice! > 0)
          ? it.product.newPrice!
          : it.product.price;
      total += price * it.quantity;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Total: ₹' + total.toStringAsFixed(2),
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _coupon,
              decoration: InputDecoration(labelText: 'Coupon code (optional)'),
            ),
            SizedBox(height: 16),
            _loading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _placeOrder,
              child: Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
*/


/* 03/11/2025 3:58
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../services/api_service.dart';
import 'dart:convert';

class CheckoutScreen extends StatefulWidget {
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController _coupon = TextEditingController();
  bool _loading = false;

  _placeOrder() async {
    final cart = Provider.of<CartProvider>(context, listen: false);
    if (cart.items.isEmpty) return;

    setState(() => _loading = true);

    // ✅ Use newPrice if available while placing order
    final items = cart.items.map((it) {
      final price = (it.product.newPrice != null && it.product.newPrice! > 0)
          ? it.product.newPrice!
          : it.product.price;
      return {
        'productId': it.product.id,
        'quantity': it.quantity,
        'price': price,
      };
    }).toList();

    final body = {
      'items': items,
      'couponCode': _coupon.text.trim(),
    };

    final res = await ApiService.post('/api/orders', body, withAuth: true);
    setState(() => _loading = false);

    if (res.statusCode == 201 || res.statusCode == 200) {
      cart.clear();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Order placed')));
      Navigator.pushReplacementNamed(context, '/');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Order failed: ' + res.body.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    // ✅ Calculate total using newPrice if available
    double total = 0.0;
    for (var it in cart.items) {
      final price = (it.product.newPrice != null && it.product.newPrice! > 0)
          ? it.product.newPrice!
          : it.product.price;
      total += price * it.quantity;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Total: ₹' + total.toStringAsFixed(2),
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _coupon,
              decoration: InputDecoration(labelText: 'Coupon code (optional)'),
            ),
            SizedBox(height: 16),
            _loading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _placeOrder,
              child: Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../services/api_service.dart';
import 'dart:convert';

class CheckoutScreen extends StatefulWidget {
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController _coupon = TextEditingController();
  bool _loading = false;

  // Shipping controllers
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  @override
  void dispose() {
    _coupon.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    _address1Controller.dispose();
    _address2Controller.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _pincodeController.dispose();
    _landmarkController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  _placeOrder() async {
    final cart = Provider.of<CartProvider>(context, listen: false);
    if (cart.items.isEmpty) return;

    // Validate shipping form before placing order
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill required shipping details")),
      );
      return;
    }

    setState(() => _loading = true);

    // Build items as before (preserve existing price logic)
    final items = cart.items.map((it) {
      final price = (it.product.newPrice != null && it.product.newPrice! > 0)
          ? it.product.newPrice!
          : it.product.price;
      return {
        'productId': it.product.id,
        'quantity': it.quantity,
        'price': price,
      };
    }).toList();

    // Build shipping object matching backend ShippingDto
    final shipping = {
      'fullName': _fullNameController.text.trim(),
      'phone': _phoneController.text.trim(),
      'addressLine1': _address1Controller.text.trim(),
      'addressLine2': _address2Controller.text.trim(),
      'city': _cityController.text.trim(),
      'state': _stateController.text.trim(),
      'pincode': _pincodeController.text.trim(),
      'landmark': _landmarkController.text.trim(),
      'country': _countryController.text.trim(),
    };

    final body = {
      'items': items,
      'couponCode': _coupon.text.trim(),
      'shipping': shipping, // <- included shipping here
    };

    // Call existing ApiService.post (keeps the same endpoint)
    final res = await ApiService.post('/api/orders', body, withAuth: true);
    setState(() => _loading = false);

    if (res.statusCode == 201 || res.statusCode == 200) {
      cart.clear();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Order placed')));
      Navigator.pushReplacementNamed(context, '/');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Order failed: ' + res.body.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    // Total calculation unchanged
    double total = 0.0;
    for (var it in cart.items) {
      final price = (it.product.newPrice != null && it.product.newPrice! > 0)
          ? it.product.newPrice!
          : it.product.price;
      total += price * it.quantity;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Total: ₹' + total.toStringAsFixed(2),
                style: const TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 12),

              // Coupon textfield (unchanged)
              TextField(
                controller: _coupon,
                decoration: const InputDecoration(labelText: 'Coupon code (optional)'),
              ),

              const SizedBox(height: 18),

              // Shipping form
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Shipping Address', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _fullNameController,
                      decoration: const InputDecoration(labelText: 'Full name *'),
                      validator: (v) => (v == null || v.trim().isEmpty) ? 'Full name required' : null,
                    ),
                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(labelText: 'Phone *'),
                      keyboardType: TextInputType.phone,
                      validator: (v) => (v == null || v.trim().isEmpty) ? 'Phone required' : null,
                    ),
                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _address1Controller,
                      decoration: const InputDecoration(labelText: 'Address Line 1 *'),
                      validator: (v) => (v == null || v.trim().isEmpty) ? 'Address required' : null,
                    ),
                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _address2Controller,
                      decoration: const InputDecoration(labelText: 'Address Line 2 (optional)'),
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _cityController,
                            decoration: const InputDecoration(labelText: 'City *'),
                            validator: (v) => (v == null || v.trim().isEmpty) ? 'City required' : null,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: _stateController,
                            decoration: const InputDecoration(labelText: 'State *'),
                            validator: (v) => (v == null || v.trim().isEmpty) ? 'State required' : null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _pincodeController,
                            decoration: const InputDecoration(labelText: 'Pincode *'),
                            keyboardType: TextInputType.number,
                            validator: (v) => (v == null || v.trim().isEmpty) ? 'Pincode required' : null,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: _countryController,
                            decoration: const InputDecoration(labelText: 'Country *'),
                            validator: (v) => (v == null || v.trim().isEmpty) ? 'Country required' : null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _landmarkController,
                      decoration: const InputDecoration(labelText: 'Landmark (optional)'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Place order button — disabled while loading
              _loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: _placeOrder,
                child: const Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
