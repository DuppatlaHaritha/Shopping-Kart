//product_screen:


import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/product.dart';
import '../services/api_service.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/auth_provider.dart';

class Category {
  final int id;
  final String name;
  final String? description;

  Category({required this.id, required this.name, this.description});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}

class ProductsScreen extends StatefulWidget {
  final int? categoryId;

  const ProductsScreen({Key? key, this.categoryId}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> products = [];
  List<Product> allProducts = [];
  List<Category> categories = [];
  bool loading = true;
  bool loadingCategories = true;
  int? selectedCategoryId;
  TextEditingController searchController = TextEditingController();
  List<Product> filteredProducts = [];
  bool searching = false;

  final String backendBaseUrl = ApiService.base;

  @override
  void initState() {
    super.initState();
    fetchCategories();
    fetchAllProducts();
  }

  Future<void> fetchAllProducts() async {
    final res = await ApiService.get('/api/products');
    if (res.statusCode == 200) {
      final list = jsonDecode(res.body) as List;
      allProducts = list.map((e) {
        Product p = Product.fromJson(e);
        if (p.imagePath != null && p.imagePath!.isNotEmpty) {
          p.imagePath = backendBaseUrl + p.imagePath!;
        }
        return p;
      }).toList();
      setState(() {
        filteredProducts = allProducts;
      });
    }
  }

  Future<void> fetchCategories() async {
    final res = await ApiService.get('/api/categories');
    if (res.statusCode == 200) {
      try {
        final list = jsonDecode(res.body) as List;
        categories = list.map((e) => Category.fromJson(e)).toList();
        categories.insert(0, Category(id: -1, name: 'View All'));
        selectedCategoryId =
            widget.categoryId ?? (categories.isNotEmpty ? categories.first.id : null);
        if (selectedCategoryId != null) {
          await fetchProducts(selectedCategoryId!);
        }
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Failed to parse categories')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Failed to load categories')));
    }

    setState(() => loadingCategories = false);
  }

  Future<void> fetchProducts([int? categoryId]) async {
    setState(() => loading = true);

    if (categoryId == -1) {
      products = allProducts;
      setState(() {
        filteredProducts = products;
        loading = false;
      });
      return;
    }

    String endpoint = '/api/products';
    if (categoryId != null && categoryId != -1) {
      endpoint = '/api/products/category/$categoryId';
    }

    final res = await ApiService.get(endpoint);
    if (res.statusCode == 200) {
      try {
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
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Failed to parse products')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Failed to load products')));
    }

    setState(() => loading = false);
  }

  void searchProducts(String query) {
    query = query.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredProducts = selectedCategoryId == -1 || selectedCategoryId == null
            ? allProducts
            : products;
      } else {
        filteredProducts = allProducts
            .where((p) =>
        p.name.toLowerCase().contains(query) ||
            p.description.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  void showProductDetails(Product p) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (p.imagePath != null && p.imagePath!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(p.imagePath!),
                  ),
                const SizedBox(height: 12),
                Text(
                  p.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '₹${p.price}',
                      style: TextStyle(
                        decoration: p.newPrice != null
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (p.newPrice != null) ...[
                      const SizedBox(width: 6),
                      Text(
                        '₹${p.newPrice}',
                        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  p.description,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final auth = Provider.of<AuthProvider>(context);

    // ✅ Only ADMIN users should see reports and admin icons
    final bool isAdmin = auth.userRole?.contains('ADMIN') ?? false;

    return Scaffold(
      appBar: AppBar(
        title: !searching
            ? const Text('Pooja Essentials')
            : TextField(
          controller: searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search products...',
            hintStyle: const TextStyle(color: Colors.black87),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            fillColor: Colors.white,
            filled: true,
          ),
          style: const TextStyle(color: Colors.black87, fontSize: 16),
          onChanged: searchProducts,
        ),
        actions: [
          // 🔍 Search icon
          IconButton(
            icon: Icon(searching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                if (searching) {
                  searchController.clear();
                  searchProducts('');
                }
                searching = !searching;
              });
            },
          ),

          // 📊 Reports icon — only for ADMIN users
          if (isAdmin)
            IconButton(
              icon: const Icon(Icons.bar_chart),
              tooltip: 'View Reports',
              onPressed: () {
                Navigator.pushNamed(context, '/reports');
              },
            ),

          // 🧑‍💼 Admin Panel icon — only for ADMIN users
          if (isAdmin)
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/admin');
              },
              icon: const Icon(Icons.admin_panel_settings),
            ),
        ],
      ),

      body: loadingCategories
          ? const Center(child: CircularProgressIndicator())
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: DropdownButtonFormField<int>(
              value: selectedCategoryId,
              decoration: InputDecoration(
                labelText: 'Select Category',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
              ),
              items: categories
                  .map((c) => DropdownMenuItem<int>(
                value: c.id,
                child: Text(c.name),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategoryId = value;
                  searchController.clear();
                  searching = false;
                });
                fetchProducts(value);
              },
            ),
          ),
          Expanded(
            child: loading
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
              onRefresh: () => fetchProducts(selectedCategoryId),
              child: filteredProducts.isEmpty
                  ? const Center(
                  child: Text(
                    'No products found',
                    style: TextStyle(fontSize: 16),
                  ))
                  : GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (ctx, i) {
                  final p = filteredProducts[i];
                  final quantity = cart.getQuantity(p);

                  return GestureDetector(
                    onTap: () => showProductDetails(p),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.stretch,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius:
                              const BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: p.imagePath != null &&
                                  p.imagePath!.isNotEmpty
                                  ? Image.network(
                                p.imagePath!,
                                fit: BoxFit.cover,
                              )
                                  : Container(
                                color: Colors.grey[300],
                                child: const Icon(
                                  Icons.image,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    p.name,
                                    style: const TextStyle(
                                        fontWeight:
                                        FontWeight.bold),
                                    maxLines: 1,
                                    overflow:
                                    TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '₹${p.price}',
                                        style: TextStyle(
                                          decoration: p.newPrice !=
                                              null
                                              ? TextDecoration
                                              .lineThrough
                                              : TextDecoration.none,
                                          color: Colors.black,
                                          fontWeight:
                                          FontWeight.w600,
                                        ),
                                      ),
                                      if (p.newPrice != null)
                                        ...[
                                          const SizedBox(
                                              width: 6),
                                          Text(
                                            '₹${p.newPrice}',
                                            style:
                                            const TextStyle(
                                                color: Colors
                                                    .red,
                                                fontWeight:
                                                FontWeight
                                                    .bold),
                                          )
                                        ],
                                    ],
                                  ),
                                  quantity == 0
                                      ? SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        cart.add(p);
                                      },
                                      style:
                                      ElevatedButton.styleFrom(
                                        backgroundColor:
                                        const Color(0xFF800000),
                                        shape:
                                        RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              8),
                                        ),
                                      ),
                                      child: const Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                            color:
                                            Colors.white),
                                      ),
                                    ),
                                  )
                                      : Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                            Icons
                                                .remove_circle,
                                            color: Color(
                                                0xFF800000)),
                                        onPressed: () {
                                          cart.decrement(p);
                                        },
                                      ),
                                      Text(
                                        '$quantity',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight:
                                            FontWeight.bold),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                            Icons.add_circle,
                                            color: Color(
                                                0xFF800000)),
                                        onPressed: () {
                                          cart.add(p);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}