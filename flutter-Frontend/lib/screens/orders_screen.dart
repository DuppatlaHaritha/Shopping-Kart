/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';

class OrdersScreen extends StatefulWidget {
  @override State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List orders = [];
  bool loading = true;

  @override
  void initState() { super.initState(); fetch(); }

  fetch() async {
    setState(()=>loading=true);
    final res = await ApiService.get('/api/orders/my', withAuth: true);
    if (res.statusCode == 200) {
      setState(()=>orders = jsonDecode(res.body));
    } else {
      setState(()=>orders = []);
    }
    setState(()=>loading=false);
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Orders')),
      body: loading ? Center(child: CircularProgressIndicator()) :
      ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx,i){
          final o = orders[i];
          return ListTile(
            title: Text('Order #' + (o['id']?.toString() ?? '')),
            subtitle: Text('Amount: ₹' + (o['finalAmount']?.toString() ?? '0')),
            trailing: Text(o['status'] ?? ''),
          );
        },
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List orders = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    setState(() => loading = true);
    final res = await ApiService.get('/api/orders/my', withAuth: true);
    if (res.statusCode == 200) {
      setState(() => orders = jsonDecode(res.body));
    } else {
      setState(() => orders = []);
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders')),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          return Card(
            margin: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: ${o['status'] ?? ''}'),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(order: o),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatelessWidget {
  final Map order;

  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final List items = order['items'] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧭 Order Summary
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${order['id'] ?? ''}'),
                    Text('Amount: ₹${order['finalAmount'] ?? 0}'),
                    Text('Status: ${order['status'] ?? ''}'),
                    Text('Placed On: ${order['createdAt'] ?? 'N/A'}'),
                  ],
                ),
              ),
            ),

            // 🛍️ Ordered Items List
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            if (items.isEmpty)
              const Center(
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("No items found in this order.")))
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};
                  final imageUrl = product['imageUrl'] ??
                      product['image'] ??
                      ''; // fallback if key differs
                  return Card(
                    margin:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imageUrl.isNotEmpty
                          ? Image.network(
                        imageUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.broken_image,
                          size: 40,
                        ),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List orders = [];
  bool loading = true;
  final String backendBaseUrl = ApiService.base;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    setState(() => loading = true);
    final res = await ApiService.get('/api/orders/my', withAuth: true);
    if (res.statusCode == 200) {
      setState(() => orders = jsonDecode(res.body));
    } else {
      setState(() => orders = []);
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders')),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          return Card(
            margin:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: ${o['status'] ?? ''}'),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(order: o),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatelessWidget {
  final Map order;

  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final List items = order['items'] ?? [];
    final String backendBaseUrl = ApiService.base;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧭 Order Summary
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${order['id'] ?? ''}'),
                    Text('Amount: ₹${order['finalAmount'] ?? 0}'),
                    Text('Status: ${order['status'] ?? ''}'),
                    Text('Placed On: ${order['createdAt'] ?? 'N/A'}'),
                  ],
                ),
              ),
            ),

            // 🛍️ Ordered Items List
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            if (items.isEmpty)
              const Center(
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("No items found in this order.")))
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};

                  // 🖼️ Build full image URL like in ProductsScreen
                  String? imagePath = product['imagePath'] ?? '';
                  if (imagePath != null && imagePath.isNotEmpty) {
                    if (!imagePath.startsWith('http')) {
                      imagePath = backendBaseUrl + imagePath;
                    }
                  }

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imagePath != null && imagePath.isNotEmpty
                          ? Image.network(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List orders = [];
  bool loading = true;
  final String backendBaseUrl = ApiService.base;
  String? userRole;

  @override
  void initState() {
    super.initState();
    loadRoleAndFetch();
  }

  // ✅ Load user role from shared preferences and fetch accordingly
  loadRoleAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
    await fetch();
  }

  // ✅ Fetch orders based on user role
  fetch() async {
    setState(() => loading = true);

    String endpoint = '/api/orders/my';
    if (userRole == 'ROLE_SALES') {
      endpoint = '/api/orders/placed';
    }

    final res = await ApiService.get(endpoint, withAuth: true);

    if (res.statusCode == 200) {
      setState(() => orders = jsonDecode(res.body));
    } else {
      setState(() => orders = []);
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userRole == 'ROLE_SALES' ? 'All Placed Orders' : 'My Orders'),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: ${o['status'] ?? ''}'),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(order: o),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatelessWidget {
  final Map order;

  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final List items = order['items'] ?? [];
    final String backendBaseUrl = ApiService.base;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧭 Order Summary
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${order['id'] ?? ''}'),
                    Text('Amount: ₹${order['finalAmount'] ?? 0}'),
                    Text('Status: ${order['status'] ?? ''}'),
                    Text('Placed On: ${order['createdAt'] ?? 'N/A'}'),
                  ],
                ),
              ),
            ),

            // 🛍️ Ordered Items List
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("No items found in this order."),
                ),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};

                  // 🖼️ Build full image URL like in ProductsScreen
                  String? imagePath = product['imagePath'] ?? '';
                  if (imagePath != null && imagePath.isNotEmpty) {
                    if (!imagePath.startsWith('http')) {
                      imagePath = backendBaseUrl + imagePath;
                    }
                  }

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imagePath != null && imagePath.isNotEmpty
                          ? Image.network(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
*/



/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List orders = [];
  bool loading = true;
  final String backendBaseUrl = ApiService.base;
  String? userRole;

  @override
  void initState() {
    super.initState();
    loadRoleAndFetch();
  }

  // ✅ Load user role from shared preferences and fetch accordingly
  loadRoleAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
    await fetch();
  }

  // ✅ Fetch orders based on user role (updated as per your request)
  fetch() async {
    setState(() => loading = true);

    // ✅ Updated section
    String endpoint = '/api/orders/my';
    if (userRole == 'ROLE_SALES') {
      endpoint = '/api/orders/placed';
    }
    final res = await ApiService.get(endpoint, withAuth: true);

    if (res.statusCode == 200) {
      setState(() => orders = jsonDecode(res.body));
    } else {
      setState(() => orders = []);
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userRole == 'ROLE_SALES' ? 'All Placed Orders' : 'My Orders'),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: ${o['status'] ?? ''}'),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(order: o),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatelessWidget {
  final Map order;

  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final List items = order['items'] ?? [];
    final String backendBaseUrl = ApiService.base;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧭 Order Summary
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${order['id'] ?? ''}'),
                    Text('Amount: ₹${order['finalAmount'] ?? 0}'),
                    Text('Status: ${order['status'] ?? ''}'),
                    Text('Placed On: ${order['createdAt'] ?? 'N/A'}'),
                  ],
                ),
              ),
            ),

            // 🛍️ Ordered Items List
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("No items found in this order."),
                ),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};

                  // 🖼️ Build full image URL like in ProductsScreen
                  String? imagePath = product['imagePath'] ?? '';
                  if (imagePath != null && imagePath.isNotEmpty) {
                    if (!imagePath.startsWith('http')) {
                      imagePath = backendBaseUrl + imagePath;
                    }
                  }

                  return Card(
                    margin:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imagePath != null && imagePath.isNotEmpty
                          ? Image.network(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List orders = [];
  bool loading = true;
  final String backendBaseUrl = ApiService.base;
  String? userRole;

  @override
  void initState() {
    super.initState();
    loadRoleAndFetch();
  }

  loadRoleAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
    await fetch();
  }

  fetch() async {
    setState(() => loading = true);
    String endpoint = '/api/orders/my';
    if (userRole == 'ROLE_SALES') {
      endpoint = '/api/orders/placed';
    } else if (userRole == 'ROLE_ADMIN') {
      endpoint = '/api/orders/all';
    }

    final res = await ApiService.get(endpoint, withAuth: true);
    if (res.statusCode == 200) {
      setState(() => orders = jsonDecode(res.body));
    } else {
      setState(() => orders = []);
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          userRole == 'ROLE_SALES'
              ? 'All Placed Orders'
              : userRole == 'ROLE_ADMIN'
              ? 'Manage Orders'
              : 'My Orders',
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          return Card(
            margin:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: ${o['status'] ?? ''}'),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        OrderDetailsScreen(order: o, userRole: userRole),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatefulWidget {
  final Map order;
  final String? userRole;

  const OrderDetailsScreen({super.key, required this.order, this.userRole});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late TextEditingController trackingController;
  String? selectedStatus;
  bool saving = false;

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.order['status'];
    trackingController =
        TextEditingController(text: widget.order['trackingNumber'] ?? '');
  }

  @override
  void dispose() {
    trackingController.dispose();
    super.dispose();
  }

  Future<void> saveChanges() async {
    setState(() => saving = true);
    final body = {
      'status': selectedStatus,
      'trackingNumber': trackingController.text,
    };

    final res = await ApiService.put(
      '/api/orders/${widget.order['id']}',
      body,
      withAuth: true,
    );

    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Order updated successfully')),
      );
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update order')),
      );
    }
    setState(() => saving = false);
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final List items = order['items'] ?? [];
    final String backendBaseUrl = ApiService.base;
    final bool isAdmin = widget.userRole == 'ROLE_ADMIN';

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧭 Order Summary
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${order['id'] ?? ''}'),
                    Text('Amount: ₹${order['finalAmount'] ?? 0}'),
                    Text('Placed On: ${order['createdAt'] ?? 'N/A'}'),

                    // 🧩 Editable Status (Admin Only)
                    if (isAdmin) ...[
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text("Status: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          DropdownButton<String>(
                            value: selectedStatus,
                            items: const [
                              DropdownMenuItem(
                                  value: 'payment done',
                                  child: Text('Payment Done')),
                              DropdownMenuItem(
                                  value: 'package done',
                                  child: Text('Package Done')),
                              DropdownMenuItem(
                                  value: 'shipped', child: Text('Shipped')),
                            ],
                            onChanged: (v) {
                              setState(() {
                                selectedStatus = v;
                              });
                            },
                          ),
                        ],
                      ),

                      // 🧩 Tracking Number Field (Visible only when status is "shipped")
                      if (selectedStatus == 'shipped') ...[
                        const SizedBox(height: 10),
                        TextField(
                          controller: trackingController,
                          decoration: const InputDecoration(
                            labelText: 'Tracking Number',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],

                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: saving ? null : saveChanges,
                        icon: const Icon(Icons.save),
                        label: saving
                            ? const Text('Saving...')
                            : const Text('Save Changes'),
                      ),
                    ] else
                      Text('Status: ${order['status'] ?? ''}'),

                    // 🧾 Show Tracking Number for Non-Admin Users
                    if (order['trackingNumber'] != null &&
                        order['trackingNumber'].toString().isNotEmpty)
                      Text('Tracking Number: ${order['trackingNumber']}'),
                  ],
                ),
              ),
            ),

            // 🛍️ Ordered Items List
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("No items found in this order."),
                ),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};
                  String? imagePath = product['imagePath'] ?? '';
                  if (imagePath != null && imagePath.isNotEmpty) {
                    if (!imagePath.startsWith('http')) {
                      imagePath = backendBaseUrl + imagePath;
                    }
                  }
                  return Card(
                    margin:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imagePath != null && imagePath.isNotEmpty
                          ? Image.network(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List orders = [];
  bool loading = true;
  final String backendBaseUrl = ApiService.base;
  String? userRole;

  @override
  void initState() {
    super.initState();
    loadRoleAndFetch();
  }

  loadRoleAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
    await fetch();
  }

  fetch() async {
    setState(() => loading = true);
    String endpoint = '/api/orders/my';
    if (userRole == 'ROLE_SALES') {
      endpoint = '/api/orders/placed';
    } else if (userRole == 'ROLE_ADMIN') {
      endpoint = '/api/orders/all';
    }

    final res = await ApiService.get(endpoint, withAuth: true);
    if (res.statusCode == 200) {
      setState(() => orders = jsonDecode(res.body));
    } else {
      setState(() => orders = []);
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          userRole == 'ROLE_SALES'
              ? 'All Placed Orders'
              : userRole == 'ROLE_ADMIN'
              ? 'Manage Orders'
              : 'My Orders',
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          return Card(
            margin:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: ${o['status'] ?? ''}'),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        OrderDetailsScreen(order: o, userRole: userRole),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatefulWidget {
  final Map order;
  final String? userRole;

  const OrderDetailsScreen({super.key, required this.order, this.userRole});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late TextEditingController trackingController;
  String? selectedStatus;
  bool saving = false;

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.order['status']?.toString().toLowerCase();
    trackingController =
        TextEditingController(text: widget.order['trackingNumber'] ?? '');
  }

  @override
  void dispose() {
    trackingController.dispose();
    super.dispose();
  }

  Future<void> saveChanges() async {
    setState(() => saving = true);
    final body = {
      'status': selectedStatus,
      'trackingNumber': trackingController.text,
    };

    final res = await ApiService.put(
      '/api/orders/${widget.order['id']}',
      body,
      withAuth: true,
    );

    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Order updated successfully')),
      );
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update order')),
      );
    }
    setState(() => saving = false);
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final List items = order['items'] ?? [];
    final String backendBaseUrl = ApiService.base;
    final bool isAdmin = widget.userRole == 'ROLE_ADMIN';

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧭 Order Summary
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${order['id'] ?? ''}'),
                    Text('Amount: ₹${order['finalAmount'] ?? 0}'),
                    Text('Placed On: ${order['createdAt'] ?? 'N/A'}'),

                    // 🧩 Editable Status (Admin Only)
                    if (isAdmin) ...[
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text("Status: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          DropdownButton<String>(
                            // ✅ Safe handling for mismatched or unknown status
                            value: (selectedStatus != null &&
                                ['payment done', 'package done', 'shipped']
                                    .contains(selectedStatus))
                                ? selectedStatus
                                : null,
                            hint: const Text('Select Status'),
                            items: const [
                              DropdownMenuItem(
                                  value: 'payment done',
                                  child: Text('Payment Done')),
                              DropdownMenuItem(
                                  value: 'package done',
                                  child: Text('Package Done')),
                              DropdownMenuItem(
                                  value: 'shipped', child: Text('Shipped')),
                            ],
                            onChanged: (v) {
                              setState(() {
                                selectedStatus = v;
                              });
                            },
                          ),
                        ],
                      ),

                      // 🧩 Tracking Number Field (Visible only when status is "shipped")
                      if (selectedStatus == 'shipped') ...[
                        const SizedBox(height: 10),
                        TextField(
                          controller: trackingController,
                          decoration: const InputDecoration(
                            labelText: 'Tracking Number',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],

                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: saving ? null : saveChanges,
                        icon: const Icon(Icons.save),
                        label: saving
                            ? const Text('Saving...')
                            : const Text('Save Changes'),
                      ),
                    ] else
                      Text('Status: ${order['status'] ?? ''}'),

                    // 🧾 Show Tracking Number for Non-Admin Users
                    if (order['trackingNumber'] != null &&
                        order['trackingNumber'].toString().isNotEmpty)
                      Text('Tracking Number: ${order['trackingNumber']}'),
                  ],
                ),
              ),
            ),

            // 🛍️ Ordered Items List
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("No items found in this order."),
                ),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};
                  String? imagePath = product['imagePath'] ?? '';
                  if (imagePath != null && imagePath.isNotEmpty) {
                    if (!imagePath.startsWith('http')) {
                      imagePath = backendBaseUrl + imagePath;
                    }
                  }
                  return Card(
                    margin:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imagePath != null && imagePath.isNotEmpty
                          ? Image.network(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List orders = [];
  bool loading = true;
  final String backendBaseUrl = ApiService.base;
  String? userRole;

  @override
  void initState() {
    super.initState();
    loadRoleAndFetch();
  }

  loadRoleAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
    await fetch();
  }

  fetch() async {
    setState(() => loading = true);
    String endpoint = '/api/orders/my';
    if (userRole == 'ROLE_SALES') {
      endpoint = '/api/orders/placed';
    } else if (userRole == 'ROLE_ADMIN') {
      endpoint = '/api/orders/all';
    }

    final res = await ApiService.get(endpoint, withAuth: true);
    if (res.statusCode == 200) {
      setState(() => orders = jsonDecode(res.body));
    } else {
      setState(() => orders = []);
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          userRole == 'ROLE_SALES'
              ? 'All Placed Orders'
              : userRole == 'ROLE_ADMIN'
              ? 'Manage Orders'
              : 'My Orders',
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          return Card(
            margin:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: ${o['status'] ?? ''}'),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () async {
                // 👇 Wait for result from OrderDetailsScreen
                final updated = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        OrderDetailsScreen(order: o, userRole: userRole),
                  ),
                );

                // 👇 If status updated, refresh the list
                if (updated == true) {
                  fetch();
                }
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatefulWidget {
  final Map order;
  final String? userRole;

  const OrderDetailsScreen({super.key, required this.order, this.userRole});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late TextEditingController trackingController;
  String? selectedStatus;
  bool saving = false;

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.order['status']?.toString().toLowerCase();
    trackingController =
        TextEditingController(text: widget.order['trackingNumber'] ?? '');
  }

  @override
  void dispose() {
    trackingController.dispose();
    super.dispose();
  }

  Future<void> saveChanges() async {
    setState(() => saving = true);
    final body = {
      'status': selectedStatus,
      'trackingNumber': trackingController.text,
    };

    final res = await ApiService.put(
      '/api/orders/${widget.order['id']}',
      body,
      withAuth: true,
    );

    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Order updated successfully')),
      );

      // 👇 Return true to indicate status updated
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update order')),
      );
    }
    setState(() => saving = false);
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final List items = order['items'] ?? [];
    final String backendBaseUrl = ApiService.base;
    final bool isAdmin = widget.userRole == 'ROLE_ADMIN';

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧭 Order Summary
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${order['id'] ?? ''}'),
                    Text('Amount: ₹${order['finalAmount'] ?? 0}'),
                    Text('Placed On: ${order['createdAt'] ?? 'N/A'}'),

                    // 🧩 Editable Status (Admin Only)
                    if (isAdmin) ...[
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text("Status: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          DropdownButton<String>(
                            value: (selectedStatus != null &&
                                ['payment done', 'package done', 'shipped']
                                    .contains(selectedStatus))
                                ? selectedStatus
                                : null,
                            hint: const Text('Select Status'),
                            items: const [
                              DropdownMenuItem(
                                  value: 'payment done',
                                  child: Text('Payment Done')),
                              DropdownMenuItem(
                                  value: 'package done',
                                  child: Text('Package Done')),
                              DropdownMenuItem(
                                  value: 'shipped', child: Text('Shipped')),
                            ],
                            onChanged: (v) {
                              setState(() {
                                selectedStatus = v;
                              });
                            },
                          ),
                        ],
                      ),

                      // 🧩 Tracking Number Field (Visible only when status is "shipped")
                      if (selectedStatus == 'shipped') ...[
                        const SizedBox(height: 10),
                        TextField(
                          controller: trackingController,
                          decoration: const InputDecoration(
                            labelText: 'Tracking Number',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],

                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: saving ? null : saveChanges,
                        icon: const Icon(Icons.save),
                        label: saving
                            ? const Text('Saving...')
                            : const Text('Save Changes'),
                      ),
                    ] else
                      Text('Status: ${order['status'] ?? ''}'),

                    // 🧾 Show Tracking Number for Non-Admin Users
                    if (order['trackingNumber'] != null &&
                        order['trackingNumber'].toString().isNotEmpty)
                      Text('Tracking Number: ${order['trackingNumber']}'),
                  ],
                ),
              ),
            ),

            // 🛍️ Ordered Items List
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("No items found in this order."),
                ),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};
                  String? imagePath = product['imagePath'] ?? '';
                  if (imagePath != null && imagePath.isNotEmpty) {
                    if (!imagePath.startsWith('http')) {
                      imagePath = backendBaseUrl + imagePath;
                    }
                  }
                  return Card(
                    margin:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imagePath != null && imagePath.isNotEmpty
                          ? Image.network(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List orders = [];
  bool loading = true;
  final String backendBaseUrl = ApiService.base;
  String? userRole;

  @override
  void initState() {
    super.initState();
    loadRoleAndFetch();
  }

  // ✅ Load user role from shared preferences and fetch accordingly
  loadRoleAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
    await fetch();
  }

  // ✅ Fetch orders based on user role (updated as per your request)
  fetch() async {
    setState(() => loading = true);

    // ✅ Updated section
    String endpoint = '/api/orders/my';
    if (userRole == 'ROLE_SALES') {
      endpoint = '/api/orders/placed';
    }
    final res = await ApiService.get(endpoint, withAuth: true);

    if (res.statusCode == 200) {
      setState(() => orders = jsonDecode(res.body));
    } else {
      setState(() => orders = []);
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userRole == 'ROLE_SALES' ? 'All Placed Orders' : 'My Orders'),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: ${o['status'] ?? ''}'),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(order: o),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatelessWidget {
  final Map order;

  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final List items = order['items'] ?? [];
    final String backendBaseUrl = ApiService.base;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧭 Order Summary
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${order['id'] ?? ''}'),
                    Text('Amount: ₹${order['finalAmount'] ?? 0}'),
                    Text('Status: ${order['status'] ?? ''}'),
                    Text('Placed On: ${order['createdAt'] ?? 'N/A'}'),
                  ],
                ),
              ),
            ),

            // 🛍️ Ordered Items List
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("No items found in this order."),
                ),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};

                  // 🖼️ Build full image URL like in ProductsScreen
                  String? imagePath = product['imagePath'] ?? '';
                  if (imagePath != null && imagePath.isNotEmpty) {
                    if (!imagePath.startsWith('http')) {
                      imagePath = backendBaseUrl + imagePath;
                    }
                  }

                  return Card(
                    margin:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imagePath != null && imagePath.isNotEmpty
                          ? Image.network(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List orders = [];
  bool loading = true;
  final String backendBaseUrl = ApiService.base;
  String? userRole;

  @override
  void initState() {
    super.initState();
    loadRoleAndFetch();
  }

  // ✅ Load user role from shared preferences and fetch accordingly
  loadRoleAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
    await fetch();
  }

  // ✅ Fetch orders based on user role
  fetch() async {
    setState(() => loading = true);

    // ✅ Choose endpoint according to role
    String endpoint = '/api/orders/my'; // default for ROLE_USER
    if (userRole == 'ROLE_ADMIN') {
      endpoint = '/api/orders/admin'; // Admin-specific endpoint
    } else if (userRole == 'ROLE_SALES') {
      endpoint = '/api/orders/all'; // Sales can view all orders
    }

    final res = await ApiService.get(endpoint, withAuth: true);

    if (res.statusCode == 200) {
      setState(() => orders = jsonDecode(res.body));
    } else {
      setState(() => orders = []);
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          userRole == 'ROLE_SALES'
              ? 'All Orders'
              : userRole == 'ROLE_ADMIN'
              ? 'Admin Orders'
              : 'My Orders',
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          return Card(
            margin: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: ${o['status'] ?? ''}'),
                ],
              ),
              trailing:
              const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(order: o),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatelessWidget {
  final Map order;

  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final List items = order['items'] ?? [];
    final String backendBaseUrl = ApiService.base;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧭 Order Summary
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${order['id'] ?? ''}'),
                    Text('Amount: ₹${order['finalAmount'] ?? 0}'),
                    Text('Status: ${order['status'] ?? ''}'),
                    Text('Placed On: ${order['createdAt'] ?? 'N/A'}'),
                  ],
                ),
              ),
            ),

            // 🛍️ Ordered Items List
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("No items found in this order."),
                ),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};

                  // 🖼️ Build full image URL like in ProductsScreen
                  String? imagePath = product['imagePath'] ?? '';
                  if (imagePath != null && imagePath.isNotEmpty) {
                    if (!imagePath.startsWith('http')) {
                      imagePath = backendBaseUrl + imagePath;
                    }
                  }

                  return Card(
                    margin:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imagePath != null && imagePath.isNotEmpty
                          ? Image.network(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
*/


/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List orders = [];
  bool loading = true;
  final String backendBaseUrl = ApiService.base;
  String? userRole;

  @override
  void initState() {
    super.initState();
    loadRoleAndFetch();
  }

  // ✅ Load user role from shared preferences and fetch accordingly
  loadRoleAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
    await fetch();
  }

  // ✅ Fetch orders based on user role (updated as per your request)
  fetch() async {
    setState(() => loading = true);

    // ✅ Updated section
    String endpoint = '/api/orders/my';
    if (userRole == 'ROLE_SALES') {
      endpoint = '/api/orders/placed';
    }
    final res = await ApiService.get(endpoint, withAuth: true);

    if (res.statusCode == 200) {
      setState(() => orders = jsonDecode(res.body));
    } else {
      setState(() => orders = []);
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userRole == 'ROLE_SALES' ? 'All Placed Orders' : 'My Orders'),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: ${o['status'] ?? ''}'),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(order: o),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatelessWidget {
  final Map order;

  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final List items = order['items'] ?? [];
    final String backendBaseUrl = ApiService.base;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧭 Order Summary
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${order['id'] ?? ''}'),
                    Text('Amount: ₹${order['finalAmount'] ?? 0}'),
                    Text('Status: ${order['status'] ?? ''}'),
                    Text('Placed On: ${order['createdAt'] ?? 'N/A'}'),
                  ],
                ),
              ),
            ),

            // 🛍️ Ordered Items List
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("No items found in this order."),
                ),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};

                  // 🖼️ Build full image URL like in ProductsScreen
                  String? imagePath = product['imagePath'] ?? '';
                  if (imagePath != null && imagePath.isNotEmpty) {
                    if (!imagePath.startsWith('http')) {
                      imagePath = backendBaseUrl + imagePath;
                    }
                  }

                  return Card(
                    margin:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imagePath != null && imagePath.isNotEmpty
                          ? Image.network(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
*/


/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List orders = [];
  bool loading = true;
  final String backendBaseUrl = ApiService.base;
  String? userRole;

  @override
  void initState() {
    super.initState();
    loadRoleAndFetch();
  }

  // ✅ Load user role from shared preferences and fetch orders accordingly
  loadRoleAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
    await fetch();
  }

  // ✅ Fetch orders based on user role
  fetch() async {
    setState(() => loading = true);

    String endpoint = '/api/orders/my'; // Default for ROLE_USER
    if (userRole == 'ROLE_ADMIN' || userRole == 'ROLE_SALES') {
      // Admin and Sales can see all orders
      endpoint = '/api/admin/orders';
    }

    try {
      final res = await ApiService.get(endpoint, withAuth: true);

      if (res.statusCode == 200) {
        try {
          final body = jsonDecode(res.body);
          if (body is List) {
            setState(() => orders = body);
          } else {
            setState(() => orders = []);
          }
        } catch (e) {
          setState(() => orders = []);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error parsing orders: $e")),
          );
        }
      } else {
        setState(() => orders = []);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load orders (${res.statusCode})")),
        );
      }
    } catch (e) {
      setState(() => orders = []);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching orders: $e")),
      );
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          userRole == 'ROLE_SALES'
              ? 'All Orders (Sales)'
              : userRole == 'ROLE_ADMIN'
              ? 'All Orders (Admin)'
              : 'My Orders',
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          return Card(
            margin: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: ${o['status'] ?? ''}'),
                ],
              ),
              trailing:
              const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(order: o),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatelessWidget {
  final Map order;

  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final List items = order['items'] ?? [];
    final String backendBaseUrl = ApiService.base;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧭 Order Summary
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${order['id'] ?? ''}'),
                    Text('Amount: ₹${order['finalAmount'] ?? 0}'),
                    Text('Status: ${order['status'] ?? ''}'),
                    Text('Placed On: ${order['createdAt'] ?? 'N/A'}'),
                  ],
                ),
              ),
            ),

            // 🛍️ Ordered Items List
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("No items found in this order."),
                ),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};

                  String? imagePath = product['imagePath'] ?? '';
                  if (imagePath != null && imagePath.isNotEmpty) {
                    if (!imagePath.startsWith('http')) {
                      imagePath = backendBaseUrl + imagePath;
                    }
                  }

                  return Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imagePath != null && imagePath.isNotEmpty
                          ? Image.network(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
*/


// working
/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with AutomaticKeepAliveClientMixin {
  List orders = [];
  bool loading = true;
  final String backendBaseUrl = ApiService.base;
  String? userRole;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    loadRoleAndFetch();

    // ✅ Refresh when this screen becomes visible again
    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetch();
    });
  }

  // ✅ Load user role and fetch orders
  loadRoleAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
    await fetch();
  }

  // ✅ Fetch orders from API
  fetch() async {
    setState(() => loading = true);

    String endpoint = '/api/orders/my';
    if (userRole == 'ROLE_ADMIN' || userRole == 'ROLE_SALES') {
      endpoint = '/api/admin/orders';
    }

    debugPrint("🔍 Fetching orders for role: $userRole → Endpoint: $endpoint");

    try {
      final res = await ApiService.get(endpoint, withAuth: true);

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        if (body is List) {
          setState(() => orders = body);
        } else {
          setState(() => orders = []);
        }
      } else {
        setState(() => orders = []);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load orders (${res.statusCode})")),
        );
      }
    } catch (e) {
      setState(() => orders = []);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching orders: $e")),
      );
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          userRole == 'ROLE_SALES'
              ? 'All Orders (Sales)'
              : userRole == 'ROLE_ADMIN'
              ? 'All Orders (Admin)'
              : 'My Orders',
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          return Card(
            margin:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: ${o['status'] ?? ''}'),
                ],
              ),
              trailing:
              const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(order: o),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatelessWidget {
  final Map order;

  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final List items = order['items'] ?? [];
    final String backendBaseUrl = ApiService.base;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${order['id'] ?? ''}'),
                    Text('Amount: ₹${order['finalAmount'] ?? 0}'),
                    Text('Status: ${order['status'] ?? ''}'),
                    Text('Placed On: ${order['createdAt'] ?? 'N/A'}'),
                  ],
                ),
              ),
            ),
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("No items found in this order."),
                ),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};
                  String? imagePath = product['imagePath'] ?? '';
                  if (imagePath != null && imagePath.isNotEmpty) {
                    if (!imagePath.startsWith('http')) {
                      imagePath = backendBaseUrl + imagePath;
                    }
                  }

                  return Card(
                    margin:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imagePath != null && imagePath.isNotEmpty
                          ? Image.network(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
*/

//working
/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with AutomaticKeepAliveClientMixin {
  List orders = [];
  bool loading = true;
  final String backendBaseUrl = ApiService.base;
  String? userRole;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    loadRoleAndFetch();

    // ✅ Refresh when this screen becomes visible again
    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetch();
    });
  }

  // ✅ Load user role and fetch orders
  loadRoleAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
    await fetch();
  }

  // ✅ Fetch orders from API
  fetch() async {
    setState(() => loading = true);

    String endpoint = '/api/orders/my';
    if (userRole == 'ROLE_ADMIN' || userRole == 'ROLE_SALES') {
      endpoint = '/api/admin/orders';
    }

    debugPrint("🔍 Fetching orders for role: $userRole → Endpoint: $endpoint");

    try {
      final res = await ApiService.get(endpoint, withAuth: true);

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        if (body is List) {
          setState(() => orders = body);
        } else {
          setState(() => orders = []);
        }
      } else {
        setState(() => orders = []);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load orders (${res.statusCode})")),
        );
      }
    } catch (e) {
      setState(() => orders = []);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching orders: $e")),
      );
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          userRole == 'ROLE_SALES'
              ? 'All Orders (Sales)'
              : userRole == 'ROLE_ADMIN'
              ? 'All Orders (Admin)'
              : 'My Orders',
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          return Card(
            margin:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: ${o['status'] ?? ''}'),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        OrderDetailsScreen(order: o, userRole: userRole),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatefulWidget {
  final Map order;
  final String? userRole;

  const OrderDetailsScreen({super.key, required this.order, this.userRole});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  String? _selectedStatus;
  bool _updating = false;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.order['status'];
  }

  Future<void> _updateStatus(String newStatus) async {
    setState(() => _updating = true);

    final res = await ApiService.put(
      '/api/orders/${widget.order['id']}/status',
      {'status': newStatus},
      withAuth: true,
    );

    if (res.statusCode == 200) {
      setState(() => _selectedStatus = newStatus);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ Status updated to $newStatus')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ Failed to update status')),
      );
    }

    setState(() => _updating = false);
  }

  @override
  Widget build(BuildContext context) {
    final List items = widget.order['items'] ?? [];
    final String backendBaseUrl = ApiService.base;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${widget.order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${widget.order['id'] ?? ''}'),
                    Text('Amount: ₹${widget.order['finalAmount'] ?? 0}'),

                    // 🟡 Editable status (only for ROLE_SALES)
                    widget.userRole == 'ROLE_SALES'
                        ? Row(
                      children: [
                        const Text(
                          'Status: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 6),
                        if (_updating)
                          const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2))
                        else
                          DropdownButton<String>(
                            value: _selectedStatus,
                            items: const [
                              DropdownMenuItem(
                                  value: 'PAYMENT DONE',
                                  child: Text('PAYMENT DONE')),
                              DropdownMenuItem(
                                  value: 'PACKAGE DONE',
                                  child: Text('PACKAGE DONE')),
                              DropdownMenuItem(
                                  value: 'SHIPPED', child: Text('SHIPPED')),
                            ],
                            onChanged: (val) {
                              if (val != null) _updateStatus(val);
                            },
                          ),
                      ],
                    )
                        : Text('Status: ${widget.order['status'] ?? ''}'),

                    Text('Placed On: ${widget.order['createdAt'] ?? 'N/A'}'),
                  ],
                ),
              ),
            ),
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("No items found in this order."),
                ),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};
                  String? imagePath = product['imagePath'] ?? '';
                  if (imagePath != null && imagePath.isNotEmpty) {
                    if (!imagePath.startsWith('http')) {
                      imagePath = backendBaseUrl + imagePath;
                    }
                  }

                  return Card(
                    margin:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imagePath != null && imagePath.isNotEmpty
                          ? Image.network(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
*/


//working
/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with AutomaticKeepAliveClientMixin {
  List orders = [];
  bool loading = true;
  final String backendBaseUrl = ApiService.base;
  String? userRole;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    loadRoleAndFetch();

    // ✅ Refresh when this screen becomes visible again
    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetch();
    });
  }

  // ✅ Load user role and fetch orders
  loadRoleAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
    await fetch();
  }

  // ✅ Fetch orders from API
  fetch() async {
    setState(() => loading = true);

    String endpoint = '/api/orders/my';
    if (userRole == 'ROLE_ADMIN' || userRole == 'ROLE_SALES') {
      endpoint = '/api/admin/orders';
    }

    debugPrint("🔍 Fetching orders for role: $userRole → Endpoint: $endpoint");

    try {
      final res = await ApiService.get(endpoint, withAuth: true);

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        if (body is List) {
          setState(() => orders = body);
        } else {
          setState(() => orders = []);
        }
      } else {
        setState(() => orders = []);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load orders (${res.statusCode})")),
        );
      }
    } catch (e) {
      setState(() => orders = []);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching orders: $e")),
      );
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          userRole == 'ROLE_SALES'
              ? 'All Orders (Sales)'
              : userRole == 'ROLE_ADMIN'
              ? 'All Orders (Admin)'
              : 'My Orders',
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          return Card(
            margin:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: ${o['status'] ?? ''}'),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () async {
                // ✅ Wait for result from details page
                final updated = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(
                        order: o, userRole: userRole),
                  ),
                );

                // ✅ If something was updated, refresh
                if (updated == true) {
                  fetch();
                }
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatefulWidget {
  final Map order;
  final String? userRole;

  const OrderDetailsScreen({super.key, required this.order, this.userRole});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  String? _selectedStatus;
  bool _updating = false;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.order['status'];
  }

  Future<void> _updateStatus(String newStatus) async {
    setState(() => _updating = true);

    try {
      final res = await ApiService.put(
        '/api/orders/${widget.order['id']}/status',
        {'status': newStatus},
        withAuth: true,
      );

      if (res.statusCode == 200) {
        setState(() => _selectedStatus = newStatus);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('✅ Status updated to $newStatus')),
        );

        // ✅ Tell parent to refresh when going back
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('❌ Failed to update status')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('⚠️ Error updating status: $e')),
      );
    }

    setState(() => _updating = false);
  }

  @override
  Widget build(BuildContext context) {
    final List items = widget.order['items'] ?? [];
    final String backendBaseUrl = ApiService.base;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${widget.order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${widget.order['id'] ?? ''}'),
                    Text('Amount: ₹${widget.order['finalAmount'] ?? 0}'),

                    // 🟡 Editable status (only for ROLE_SALES)
                    widget.userRole == 'ROLE_SALES'
                        ? Row(
                      children: [
                        const Text(
                          'Status: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 6),
                        if (_updating)
                          const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2))
                        else
                          DropdownButton<String>(
                            value: _selectedStatus,
                            items: const [
                              DropdownMenuItem(
                                  value: 'PAYMENT DONE',
                                  child: Text('PAYMENT DONE')),
                              DropdownMenuItem(
                                  value: 'PACKAGE DONE',
                                  child: Text('PACKAGE DONE')),
                              DropdownMenuItem(
                                  value: 'SHIPPED',
                                  child: Text('SHIPPED')),
                            ],
                            onChanged: (val) {
                              if (val != null &&
                                  val != _selectedStatus) {
                                _updateStatus(val);
                              }
                            },
                          ),
                      ],
                    )
                        : Text('Status: ${widget.order['status'] ?? ''}'),

                    Text('Placed On: ${widget.order['createdAt'] ?? 'N/A'}'),
                  ],
                ),
              ),
            ),
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("No items found in this order."),
                ),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};
                  String? imagePath = product['imagePath'] ?? '';
                  if (imagePath != null && imagePath.isNotEmpty) {
                    if (!imagePath.startsWith('http')) {
                      imagePath = backendBaseUrl + imagePath;
                    }
                  }

                  return Card(
                    margin:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imagePath != null && imagePath.isNotEmpty
                          ? Image.network(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
*/



// 07-11-2025
/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with AutomaticKeepAliveClientMixin {
  List orders = [];
  bool loading = true;
  final String backendBaseUrl = ApiService.base;
  String? userRole;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    loadRoleAndFetch();

    // ✅ Refresh when this screen becomes visible again
    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetch();
    });
  }

  // ✅ Load user role and fetch orders
  loadRoleAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
    await fetch();
  }

  // ✅ Fetch orders from API
  fetch() async {
    setState(() => loading = true);

    String endpoint = '/api/orders/my';
    if (userRole == 'ROLE_ADMIN' || userRole == 'ROLE_SALES') {
      endpoint = '/api/admin/orders';
    }

    debugPrint("🔍 Fetching orders for role: $userRole → Endpoint: $endpoint");

    try {
      final res = await ApiService.get(endpoint, withAuth: true);

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        if (body is List) {
          setState(() => orders = body);
        } else {
          setState(() => orders = []);
        }
      } else {
        setState(() => orders = []);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load orders (${res.statusCode})")),
        );
      }
    } catch (e) {
      setState(() => orders = []);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching orders: $e")),
      );
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          userRole == 'ROLE_SALES'
              ? 'All Orders (Sales)'
              : userRole == 'ROLE_ADMIN'
              ? 'All Orders (Admin)'
              : 'My Orders',
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          return Card(
            margin:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: ${o['status'] ?? ''}'),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () async {
                final updated = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(
                        order: o, userRole: userRole),
                  ),
                );

                if (updated == true) {
                  fetch();
                }
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatefulWidget {
  final Map order;
  final String? userRole;

  const OrderDetailsScreen({super.key, required this.order, this.userRole});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  String? _selectedStatus;
  bool _updating = false;
  final TextEditingController _trackingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.order['status'];
    _trackingController.text = widget.order['trackingNumber'] ?? '';
  }

  Future<void> _updateStatus() async {
    final newStatus = _selectedStatus;

    // 🟡 Require tracking number if status = SHIPPED
    if (newStatus == 'SHIPPED' && _trackingController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('⚠️ Please enter tracking number')),
      );
      return;
    }

    setState(() => _updating = true);

    try {
      final res = await ApiService.put(
        '/api/orders/${widget.order['id']}/status',
        {
          'status': newStatus,
          'trackingNumber': _trackingController.text.trim(),
        },
        withAuth: true,
      );

      if (res.statusCode == 200) {
        setState(() => _selectedStatus = newStatus);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('✅ Status updated to $newStatus')),
        );
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('❌ Failed to update status')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('⚠️ Error updating status: $e')),
      );
    }

    setState(() => _updating = false);
  }

  @override
  Widget build(BuildContext context) {
    final List items = widget.order['items'] ?? [];
    final String backendBaseUrl = ApiService.base;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${widget.order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${widget.order['id'] ?? ''}'),
                    Text('Amount: ₹${widget.order['finalAmount'] ?? 0}'),

                    // 🟡 Editable status (only for ROLE_SALES)
                    widget.userRole == 'ROLE_SALES'
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Status: ',
                              style:
                              TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 6),
                            if (_updating)
                              const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2))
                            else
                              DropdownButton<String>(
                                value: _selectedStatus,
                                items: const [
                                  DropdownMenuItem(
                                      value: 'PAYMENT DONE',
                                      child: Text('PAYMENT DONE')),
                                  DropdownMenuItem(
                                      value: 'PACKAGE DONE',
                                      child: Text('PACKAGE DONE')),
                                  DropdownMenuItem(
                                      value: 'SHIPPED',
                                      child: Text('SHIPPED')),
                                ],
                                onChanged: (val) {
                                  if (val != null) {
                                    setState(() {
                                      _selectedStatus = val;
                                    });
                                  }
                                },
                              ),
                          ],
                        ),

                        // 🟢 Show tracking number input if SHIPPED
                        if (_selectedStatus == 'SHIPPED') ...[
                          const SizedBox(height: 8),
                          TextField(
                            controller: _trackingController,
                            decoration: const InputDecoration(
                              labelText: 'Tracking Number *',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],

                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          onPressed: _updating ? null : _updateStatus,
                          icon: const Icon(Icons.save),
                          label: const Text("Update Status"),
                        ),
                      ],
                    )
                        : Text('Status: ${widget.order['status'] ?? ''}'),

                    Text('Placed On: ${widget.order['createdAt'] ?? 'N/A'}'),
                  ],
                ),
              ),
            ),
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("No items found in this order."),
                ),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};
                  String? imagePath = product['imagePath'] ?? '';
                  if (imagePath != null && imagePath.isNotEmpty) {
                    if (!imagePath.startsWith('http')) {
                      imagePath = backendBaseUrl + imagePath;
                    }
                  }

                  return Card(
                    margin:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imagePath != null && imagePath.isNotEmpty
                          ? Image.network(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
*/


// working 06-11-2025
/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with AutomaticKeepAliveClientMixin {
  List orders = [];
  bool loading = true;
  final String backendBaseUrl = ApiService.base;
  String? userRole;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    loadRoleAndFetch();

    // ✅ Refresh when this screen becomes visible again
    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetch();
    });
  }

  // ✅ Load user role and fetch orders
  loadRoleAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
    await fetch();
  }

  // ✅ Fetch orders from API
  fetch() async {
    setState(() => loading = true);

    String endpoint = '/api/orders/my';
    if (userRole == 'ROLE_ADMIN' || userRole == 'ROLE_SALES') {
      endpoint = '/api/admin/orders';
    }

    debugPrint("🔍 Fetching orders for role: $userRole → Endpoint: $endpoint");

    try {
      final res = await ApiService.get(endpoint, withAuth: true);

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        if (body is List) {
          setState(() => orders = body);
        } else {
          setState(() => orders = []);
        }
      } else {
        setState(() => orders = []);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load orders (${res.statusCode})")),
        );
      }
    } catch (e) {
      setState(() => orders = []);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching orders: $e")),
      );
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          userRole == 'ROLE_SALES'
              ? 'All Orders (Sales)'
              : userRole == 'ROLE_ADMIN'
              ? 'All Orders (Admin)'
              : 'My Orders',
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          final status = o['status'] ?? '';
          final trackingNumber = o['trackingNumber'] ?? '';

          return Card(
            margin: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: $status'),
                  // ✅ Show tracking number only when status is SHIPPED
                  if (status == 'SHIPPED' &&
                      trackingNumber.isNotEmpty)
                    Text('Tracking No: $trackingNumber'),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () async {
                final updated = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(
                        order: o, userRole: userRole),
                  ),
                );

                if (updated == true) {
                  fetch();
                }
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatefulWidget {
  final Map order;
  final String? userRole;

  const OrderDetailsScreen({super.key, required this.order, this.userRole});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  String? _selectedStatus;
  bool _updating = false;
  final TextEditingController _trackingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.order['status'];
    _trackingController.text = widget.order['trackingNumber'] ?? '';
  }

  Future<void> _updateStatus() async {
    final newStatus = _selectedStatus;

    // 🟡 Require tracking number if status = SHIPPED
    if (newStatus == 'SHIPPED' && _trackingController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('⚠️ Please enter tracking number')),
      );
      return;
    }

    setState(() => _updating = true);

    try {
      final res = await ApiService.put(
        '/api/orders/${widget.order['id']}/status',
        {
          'status': newStatus,
          'trackingNumber': _trackingController.text.trim(),
        },
        withAuth: true,
      );

      if (res.statusCode == 200) {
        setState(() => _selectedStatus = newStatus);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('✅ Status updated to $newStatus')),
        );
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('❌ Failed to update status')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('⚠️ Error updating status: $e')),
      );
    }

    setState(() => _updating = false);
  }

  @override
  Widget build(BuildContext context) {
    final List items = widget.order['items'] ?? [];
    final String backendBaseUrl = ApiService.base;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${widget.order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${widget.order['id'] ?? ''}'),
                    Text('Amount: ₹${widget.order['finalAmount'] ?? 0}'),

                    // 🟡 Editable status (only for ROLE_SALES)
                    widget.userRole == 'ROLE_SALES'
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Status: ',
                              style:
                              TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 6),
                            if (_updating)
                              const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2))
                            else
                              DropdownButton<String>(
                                value: _selectedStatus,
                                items: const [
                                  DropdownMenuItem(
                                      value: 'PAYMENT DONE',
                                      child: Text('PAYMENT DONE')),
                                  DropdownMenuItem(
                                      value: 'PACKAGE DONE',
                                      child: Text('PACKAGE DONE')),
                                  DropdownMenuItem(
                                      value: 'SHIPPED',
                                      child: Text('SHIPPED')),
                                ],
                                onChanged: (val) {
                                  if (val != null) {
                                    setState(() {
                                      _selectedStatus = val;
                                    });
                                  }
                                },
                              ),
                          ],
                        ),

                        // 🟢 Show tracking number input if SHIPPED
                        if (_selectedStatus == 'SHIPPED') ...[
                          const SizedBox(height: 8),
                          TextField(
                            controller: _trackingController,
                            decoration: const InputDecoration(
                              labelText: 'Tracking Number *',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],

                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          onPressed: _updating ? null : _updateStatus,
                          icon: const Icon(Icons.save),
                          label: const Text("Update Status"),
                        ),
                      ],
                    )
                        : Text('Status: ${widget.order['status'] ?? ''}'),

                    Text('Placed On: ${widget.order['createdAt'] ?? 'N/A'}'),
                  ],
                ),
              ),
            ),
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("No items found in this order."),
                ),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};
                  String? imagePath = product['imagePath'] ?? '';
                  if (imagePath != null && imagePath.isNotEmpty) {
                    if (!imagePath.startsWith('http')) {
                      imagePath = backendBaseUrl + imagePath;
                    }
                  }

                  return Card(
                    margin:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imagePath != null && imagePath.isNotEmpty
                          ? Image.network(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
*/



import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with AutomaticKeepAliveClientMixin {
  List orders = [];
  bool loading = true;
  final String backendBaseUrl = ApiService.base;
  String? userRole;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    loadRoleAndFetch();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetch();
    });
  }

  loadRoleAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
    await fetch();
  }

  fetch() async {
    setState(() => loading = true);

    String endpoint = '/api/orders/my';
    if (userRole == 'ROLE_ADMIN' || userRole == 'ROLE_SALES') {
      endpoint = '/api/admin/orders';
    }

    debugPrint("🔍 Fetching orders for role: $userRole → Endpoint: $endpoint");

    try {
      final res = await ApiService.get(endpoint, withAuth: true);

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        if (body is List) {
          setState(() => orders = body);
        } else {
          setState(() => orders = []);
        }
      } else {
        setState(() => orders = []);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load orders (${res.statusCode})")),
        );
      }
    } catch (e) {
      setState(() => orders = []);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching orders: $e")),
      );
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          userRole == 'ROLE_SALES'
              ? 'All Orders (Sales)'
              : userRole == 'ROLE_ADMIN'
              ? 'All Orders (Admin)'
              : 'My Orders',
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : orders.isEmpty
          ? const Center(child: Text("No orders found"))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, i) {
          final o = orders[i];
          final status = o['status'] ?? '';
          final trackingNumber = o['trackingNumber'] ?? '';

          return Card(
            margin: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text('Order #${o['id'] ?? ''}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ₹${o['finalAmount'] ?? 0}'),
                  Text('Status: $status'),

                  // ✅ Show tracking number only if shipped
                  if (status.toUpperCase() == 'SHIPPED' &&
                      trackingNumber.isNotEmpty)
                    Text(
                      'Tracking No: $trackingNumber',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // ⚫ changed to black
                      ),
                    ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () async {
                final updated = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(
                        order: o, userRole: userRole),
                  ),
                );

                if (updated == true) {
                  fetch();
                }
              },
            ),
          );
        },
      ),
    );
  }
}

// 🧾 Order Details Screen
class OrderDetailsScreen extends StatefulWidget {
  final Map order;
  final String? userRole;

  const OrderDetailsScreen({super.key, required this.order, this.userRole});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  String? _selectedStatus;
  bool _updating = false;
  final TextEditingController _trackingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.order['status'];
    _trackingController.text = widget.order['trackingNumber'] ?? '';
  }

  Future<void> _updateStatus() async {
    final newStatus = _selectedStatus;

    if (newStatus == 'SHIPPED' && _trackingController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('⚠️ Please enter tracking number')),
      );
      return;
    }

    setState(() => _updating = true);

    try {
      final res = await ApiService.put(
        '/api/orders/${widget.order['id']}/status',
        {
          'status': newStatus,
          'trackingNumber': _trackingController.text.trim(),
        },
        withAuth: true,
      );

      if (res.statusCode == 200) {
        setState(() => _selectedStatus = newStatus);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('✅ Status updated to $newStatus')),
        );
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('❌ Failed to update status')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('⚠️ Error updating status: $e')),
      );
    }

    setState(() => _updating = false);
  }

  @override
  Widget build(BuildContext context) {
    final List items = widget.order['items'] ?? [];
    final String backendBaseUrl = ApiService.base;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${widget.order['id'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Order ID: ${widget.order['id'] ?? ''}'),
                    Text('Amount: ₹${widget.order['finalAmount'] ?? 0}'),

                    // 🟢 Status handling
                    widget.userRole == 'ROLE_SALES'
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('Status: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 6),
                            if (_updating)
                              const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2))
                            else
                              DropdownButton<String>(
                                value: _selectedStatus,
                                items: const [
                                  DropdownMenuItem(
                                      value: 'PAYMENT DONE',
                                      child: Text('PAYMENT DONE')),
                                  DropdownMenuItem(
                                      value: 'PACKAGE DONE',
                                      child: Text('PACKAGE DONE')),
                                  DropdownMenuItem(
                                      value: 'SHIPPED',
                                      child: Text('SHIPPED')),
                                ],
                                onChanged: (val) {
                                  if (val != null) {
                                    setState(() => _selectedStatus = val);
                                  }
                                },
                              ),
                          ],
                        ),

                        if (_selectedStatus == 'SHIPPED') ...[
                          const SizedBox(height: 8),
                          TextField(
                            controller: _trackingController,
                            decoration: const InputDecoration(
                              labelText: 'Tracking Number *',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],

                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          onPressed: _updating ? null : _updateStatus,
                          icon: const Icon(Icons.save),
                          label: const Text("Update Status"),
                        ),
                      ],
                    )
                        : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Status: ${widget.order['status'] ?? ''}'),

                        // ✅ Show tracking number when shipped
                        if ((widget.order['status'] ?? '') == 'SHIPPED' &&
                            (widget.order['trackingNumber'] ?? '')
                                .isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              'Tracking No: ${widget.order['trackingNumber']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black, // ⚫ changed to black
                              ),
                            ),
                          ),
                      ],
                    ),

                    Text('Placed On: ${widget.order['createdAt'] ?? 'N/A'}'),
                  ],
                ),
              ),
            ),
            Text('Items Ordered',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("No items found in this order."),
                ),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  final item = items[i];
                  final product = item['product'] ?? {};
                  String imagePath = (product['imagePath'] ?? '') as String;

                  if (imagePath.isNotEmpty &&
                      !imagePath.startsWith('http')) {
                    imagePath = backendBaseUrl + imagePath;
                  }

                  return Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 4),
                    child: ListTile(
                      leading: imagePath.isNotEmpty
                          ? Image.network(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                      )
                          : const Icon(Icons.image_not_supported, size: 40),
                      title: Text(product['name'] ?? 'Unknown Product'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item['quantity'] ?? 1}'),
                          Text('Price: ₹${item['price'] ?? 0}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
