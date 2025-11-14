import 'package:flutter/material.dart';
import 'dart:convert';
import '../services/api_service.dart';
import 'products_screen.dart';

// ==================== Category Model ====================
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

// ==================== Category Screen ====================
class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category> categories = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    setState(() => loading = true);

    final res = await ApiService.get('/api/categories'); // backend endpoint
    if (res.statusCode == 200) {
      try {
        final list = jsonDecode(res.body) as List;
        categories = list.map((e) => Category.fromJson(e)).toList();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to parse categories')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load categories')));
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: categories.length,
        itemBuilder: (ctx, i) {
          final c = categories[i];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(c.name),
              subtitle: Text(c.description ?? ''),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to ProductsScreen for this category
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductsScreen(categoryId: c.id),
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
