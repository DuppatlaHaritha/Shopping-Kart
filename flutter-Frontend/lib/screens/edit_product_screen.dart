/*
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/api_service.dart';

class EditProductScreen extends StatefulWidget {
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  List<dynamic> products = [];
  List<dynamic> filteredProducts = [];
  bool loading = true;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    setState(() => loading = true);
    try {
      final res = await ApiService.get("/api/admin/products", withAuth: true);
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        setState(() {
          products = data;
          filteredProducts = data;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${res.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching products: $e")),
      );
    }
    setState(() => loading = false);
  }

  void _searchProducts(String query) {
    setState(() {
      filteredProducts = products
          .where((p) => p['description']
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase()))
          .toList();
    });
  }

  void _editProduct(dynamic product) {
    TextEditingController name = TextEditingController(text: product['name']);
    TextEditingController desc = TextEditingController(text: product['description']);
    TextEditingController price = TextEditingController(text: product['price'].toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Product"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: name, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: desc, decoration: InputDecoration(labelText: "Description")),
            TextField(controller: price, decoration: InputDecoration(labelText: "Price"), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () async {
              final body = {
                "name": name.text,
                "description": desc.text,
                "price": double.tryParse(price.text) ?? 0,
              };

              try {
                final res = await ApiService.put("/api/admin/products/${product['id']}", body, withAuth: true);
                if (res.statusCode == 200) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product updated successfully")));
                  Navigator.pop(context);
                  fetchProducts();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: ${res.body}")));
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Products")),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search by description...",
                border: OutlineInputBorder(),
              ),
              onChanged: _searchProducts,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(product['name']),
                    subtitle: Text(product['description']),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit, color: Colors.orange),
                      onPressed: () => _editProduct(product),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/product.dart';
import '../services/api_service.dart';

class EditProductScreen extends StatefulWidget {
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  List<Product> products = [];
  List<Product> filteredProducts = [];
  bool loading = true;
  final _searchController = TextEditingController();
  final String backendBaseUrl = ApiService.base;

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  // 🔹 Fetch products from same source as ProductsScreen
  Future<void> fetchAllProducts() async {
    setState(() => loading = true);
    try {
      final res = await ApiService.get('/api/products', withAuth: true);
      if (res.statusCode == 200) {
        final list = jsonDecode(res.body) as List;
        products = list.map((e) {
          Product p = Product.fromJson(e);
          if (p.imagePath != null && p.imagePath!.isNotEmpty) {
            p.imagePath = backendBaseUrl + p.imagePath!;
          }
          return p;
        }).toList();
        setState(() {
          filteredProducts = products;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error fetching products: ${res.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
    setState(() => loading = false);
  }

  void _searchProducts(String query) {
    query = query.toLowerCase();
    setState(() {
      filteredProducts = products
          .where((p) =>
      p.name.toLowerCase().contains(query) ||
          p.description.toLowerCase().contains(query))
          .toList();
    });
  }

  void _editProduct(Product product) {
    final nameController = TextEditingController(text: product.name);
    final descController = TextEditingController(text: product.description);
    final priceController = TextEditingController(text: product.price.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Product"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: descController,
                decoration: const InputDecoration(labelText: "Description"),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              final body = {
                "name": nameController.text,
                "description": descController.text,
                "price": double.tryParse(priceController.text) ?? 0,
              };

              try {
                final res = await ApiService.put(
                  "/api/admin/products/${product.id}",
                  body,
                  withAuth: true,
                );
                if (res.statusCode == 200) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Product updated successfully")),
                  );
                  Navigator.pop(context);
                  fetchAllProducts();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error: ${res.body}")),
                  );
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error: $e")),
                );
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Products")),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search by name or description...",
                border: OutlineInputBorder(),
              ),
              onChanged: _searchProducts,
            ),
          ),
          Expanded(
            child: filteredProducts.isEmpty
                ? const Center(child: Text("No products found."))
                : ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: product.imagePath != null &&
                        product.imagePath!.isNotEmpty
                        ? Image.network(
                      product.imagePath!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                        : const Icon(Icons.image, size: 40),
                    title: Text(
                      product.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${product.description}\nPrice: ₹${product.price}",
                      style: const TextStyle(fontSize: 13),
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.edit,
                          color: Colors.orange),
                      onPressed: () => _editProduct(product),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/



import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/product.dart';
import '../services/api_service.dart';

class EditProductScreen extends StatefulWidget {
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  List<Product> products = [];
  List<Product> filteredProducts = [];
  bool loading = true;
  final _searchController = TextEditingController();
  final String backendBaseUrl = ApiService.base;

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  // 🔹 Fetch products from backend
  Future<void> fetchAllProducts() async {
    setState(() => loading = true);
    try {
      final res = await ApiService.get('/api/products', withAuth: true);
      if (res.statusCode == 200) {
        final list = jsonDecode(res.body) as List;
        products = list.map((e) {
          Product p = Product.fromJson(e);
          if (p.imagePath != null && p.imagePath!.isNotEmpty) {
            p.imagePath = backendBaseUrl + p.imagePath!;
          }
          return p;
        }).toList();
        setState(() {
          filteredProducts = products;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error fetching products: ${res.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
    setState(() => loading = false);
  }

  void _searchProducts(String query) {
    query = query.toLowerCase();
    setState(() {
      filteredProducts = products
          .where((p) =>
      p.name.toLowerCase().contains(query) ||
          p.description.toLowerCase().contains(query))
          .toList();
    });
  }

  // 🔹 Edit Product Dialog
  void _editProduct(Product product) {
    final nameController = TextEditingController(text: product.name);
    final descController = TextEditingController(text: product.description);
    final priceController =
    TextEditingController(text: product.price.toString());
    final newPriceController =
    TextEditingController(text: product.newPrice?.toString() ?? "");

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Product"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: descController,
                decoration: const InputDecoration(labelText: "Description"),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: newPriceController,
                decoration:
                const InputDecoration(labelText: "New Price (optional)"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              final Map<String, dynamic> body = {
                "name": nameController.text,
                "description": descController.text,
                "price": double.tryParse(priceController.text) ?? 0,
              };

              // Only add newPrice if user entered it
              if (newPriceController.text.isNotEmpty) {
                body["newPrice"] = double.tryParse(newPriceController.text) ?? 0;
              }

              try {
                final res = await ApiService.put(
                  "/api/admin/products/${product.id}",
                  body,
                  withAuth: true,
                );
                if (res.statusCode == 200) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Product updated successfully")),
                  );
                  Navigator.pop(context);
                  fetchAllProducts();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error: ${res.body}")),
                  );
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error: $e")),
                );
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Products")),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search by name or description...",
                border: OutlineInputBorder(),
              ),
              onChanged: _searchProducts,
            ),
          ),
          Expanded(
            child: filteredProducts.isEmpty
                ? const Center(child: Text("No products found."))
                : ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: product.imagePath != null &&
                        product.imagePath!.isNotEmpty
                        ? Image.network(
                      product.imagePath!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                        : const Icon(Icons.image, size: 40),
                    title: Text(
                      product.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${product.description}\nPrice: ₹${product.price}"
                          "${product.newPrice != null ? "\nNew Price: ₹${product.newPrice}" : ""}",
                      style: const TextStyle(fontSize: 13),
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.edit,
                          color: Colors.orange),
                      onPressed: () => _editProduct(product),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
