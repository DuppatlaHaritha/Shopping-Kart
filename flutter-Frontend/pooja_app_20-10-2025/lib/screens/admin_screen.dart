/*import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';

class AdminScreen extends StatefulWidget {
  @override State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _catName = TextEditingController();
  final _catDesc = TextEditingController();
  final _prodName = TextEditingController();
  final _prodDesc = TextEditingController();
  final _prodPrice = TextEditingController();
  final _prodImage = TextEditingController();
  final _prodCategoryId = TextEditingController();
  final _couponCode = TextEditingController();
  final _couponPct = TextEditingController();
  bool _loading = false;

  _createCategory() async {
    setState(()=>_loading=true);
    final res = await ApiService.post('/api/admin/categories', {'name': _catName.text, 'description': _catDesc.text}, withAuth: true);
    setState(()=>_loading=false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res.statusCode==201 ? 'Category created' : 'Error: ' + res.body)));
  }

  _createProduct() async {
    setState(()=>_loading=true);
    final body = {
      'name': _prodName.text,
      'description': _prodDesc.text,
      'price': double.tryParse(_prodPrice.text) ?? 0.0,
      'imageUrl': _prodImage.text,
      'categoryId': int.tryParse(_prodCategoryId.text)
    };
    final res = await ApiService.post('/api/admin/products', body, withAuth: true);
    setState(()=>_loading=false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res.statusCode==201 ? 'Product created' : 'Error: ' + res.body)));
  }

  _createCoupon() async {
    setState(()=>_loading=true);
    final body = {'code': _couponCode.text, 'discountPercent': int.tryParse(_couponPct.text) ?? 0};
    final res = await ApiService.post('/api/admin/coupons', body, withAuth: true);
    setState(()=>_loading=false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res.statusCode==201 ? 'Coupon created' : 'Error: ' + res.body)));
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Panel')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Text('Create Category', style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(controller: _catName, decoration: InputDecoration(labelText: 'Name')),
          TextField(controller: _catDesc, decoration: InputDecoration(labelText: 'Description')),
          ElevatedButton(onPressed: _createCategory, child: Text('Create Category')),

          Divider(),
          Text('Create Product', style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(controller: _prodName, decoration: InputDecoration(labelText: 'Name')),
          TextField(controller: _prodDesc, decoration: InputDecoration(labelText: 'Description')),
          TextField(controller: _prodPrice, decoration: InputDecoration(labelText: 'Price')),
          TextField(controller: _prodImage, decoration: InputDecoration(labelText: 'Image URL')),
          TextField(controller: _prodCategoryId, decoration: InputDecoration(labelText: 'Category ID')),
          ElevatedButton(onPressed: _createProduct, child: Text('Create Product')),

          Divider(),
          Text('Create Coupon', style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(controller: _couponCode, decoration: InputDecoration(labelText: 'Code')),
          TextField(controller: _couponPct, decoration: InputDecoration(labelText: 'Discount %')),
          ElevatedButton(onPressed: _createCoupon, child: Text('Create Coupon')),
        ]),
      ),
    );
  }
}*/




/*import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';

class AdminScreen extends StatefulWidget {
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _catName = TextEditingController();
  final _catDesc = TextEditingController();
  final _prodName = TextEditingController();
  final _prodDesc = TextEditingController();
  final _prodPrice = TextEditingController();
  final _prodImage = TextEditingController();
  final _prodCategoryId = TextEditingController();
  final _couponCode = TextEditingController();
  final _couponPct = TextEditingController();

  bool _loading = false;

  // ================= Create Category =================
  _createCategory() async {
    setState(() => _loading = true);

    try {
      final res = await ApiService.post(
        "/api/admin/categories",
        {
          "name": _catName.text,
          "description": _catDesc.text,
        },
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Category created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _catName.clear();
        _catDesc.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Product =================
  _createProduct() async {
    setState(() => _loading = true);

    final body = {
      "name": _prodName.text,
      "description": _prodDesc.text,
      "price": double.tryParse(_prodPrice.text) ?? 0.0,
      "imageUrl": _prodImage.text,
      "categoryId": int.tryParse(_prodCategoryId.text),
    };

    try {
      final res = await ApiService.post(
        "/api/admin/products",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Product created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _prodName.clear();
        _prodDesc.clear();
        _prodPrice.clear();
        _prodImage.clear();
        _prodCategoryId.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Coupon =================
  _createCoupon() async {
    setState(() => _loading = true);

    final body = {
      "code": _couponCode.text,
      "discountPercent": int.tryParse(_couponPct.text) ?? 0,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/coupons",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Coupon created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _couponCode.clear();
        _couponPct.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category
            const Text(
              "Create Category",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _catName,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _catDesc,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createCategory,
              child: const Text("Create Category"),
            ),

            const Divider(height: 32),

            // Product
            const Text(
              "Create Product",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _prodName,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _prodDesc,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: _prodPrice,
              decoration: const InputDecoration(labelText: "Price"),
            ),
            TextField(
              controller: _prodImage,
              decoration: const InputDecoration(labelText: "Image URL"),
            ),
            TextField(
              controller: _prodCategoryId,
              decoration: const InputDecoration(labelText: "Category ID"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createProduct,
              child: const Text("Create Product"),
            ),

            const Divider(height: 32),

            // Coupon
            const Text(
              "Create Coupon",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _couponCode,
              decoration: const InputDecoration(labelText: "Code"),
            ),
            TextField(
              controller: _couponPct,
              decoration:
              const InputDecoration(labelText: "Discount %"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createCoupon,
              child: const Text("Create Coupon"),
            ),
          ],
        ),
      ),
    );
  }
}*/



/*import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';

class AdminScreen extends StatefulWidget {
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _catName = TextEditingController();
  final _catDesc = TextEditingController();
  final _prodName = TextEditingController();
  final _prodDesc = TextEditingController();
  final _prodPrice = TextEditingController();
  final _prodImage = TextEditingController();
  final _couponCode = TextEditingController();
  final _couponPct = TextEditingController();

  bool _loading = false;
  List<dynamic> categories = [];
  int? selectedCategoryId;

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  // ================= Fetch Categories =================
  Future<void> _fetchCategories() async {
    try {
      final res = await ApiService.get("/api/categories", withAuth: true);
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        setState(() {
          categories = data;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load categories: ${res.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching categories: $e")),
      );
    }
  }

  // ================= Create Category =================
  _createCategory() async {
    setState(() => _loading = true);

    try {
      final res = await ApiService.post(
        "/api/admin/categories",
        {
          "name": _catName.text,
          "description": _catDesc.text,
        },
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Category created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _catName.clear();
        _catDesc.clear();
        _fetchCategories(); // Refresh category list
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Product =================
  _createProduct() async {
    if (selectedCategoryId == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please select a category")));
      return;
    }

    setState(() => _loading = true);

    final body = {
      "name": _prodName.text,
      "description": _prodDesc.text,
      "price": double.tryParse(_prodPrice.text) ?? 0.0,
      "imageUrl": _prodImage.text,
      "categoryId": selectedCategoryId,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/products",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Product created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _prodName.clear();
        _prodDesc.clear();
        _prodPrice.clear();
        _prodImage.clear();
        setState(() {
          selectedCategoryId = null;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Coupon =================
  _createCoupon() async {
    setState(() => _loading = true);

    final body = {
      "code": _couponCode.text,
      "discountPercent": int.tryParse(_couponPct.text) ?? 0,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/coupons",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Coupon created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _couponCode.clear();
        _couponPct.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category
            const Text(
              "Create Category",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _catName,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _catDesc,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createCategory,
              child: const Text("Create Category"),
            ),

            const Divider(height: 32),

            // Product
            const Text(
              "Create Product",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _prodName,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _prodDesc,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: _prodPrice,
              decoration: const InputDecoration(labelText: "Price"),
            ),
            TextField(
              controller: _prodImage,
              decoration: const InputDecoration(labelText: "Image URL"),
            ),

            // ✅ Dropdown for Category
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 0, vertical: 10),
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
                  value: c['id'],
                  child: Text(c['name']),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategoryId = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createProduct,
              child: const Text("Create Product"),
            ),

            const Divider(height: 32),

            // Coupon
            const Text(
              "Create Coupon",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _couponCode,
              decoration: const InputDecoration(labelText: "Code"),
            ),
            TextField(
              controller: _couponPct,
              decoration:
              const InputDecoration(labelText: "Discount %"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createCoupon,
              child: const Text("Create Coupon"),
            ),
          ],
        ),
      ),
    );
  }
}*/


/*import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';

class AdminScreen extends StatefulWidget {
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _catName = TextEditingController();
  final _catDesc = TextEditingController();
  final _prodName = TextEditingController();
  final _prodDesc = TextEditingController();
  final _prodPrice = TextEditingController();
  final _prodImage = TextEditingController();
  final _couponCode = TextEditingController();
  final _couponPct = TextEditingController();

  bool _loading = false;
  List<dynamic> categories = [];
  int? selectedCategoryId;

  // Track validation errors
  Map<String, String?> errors = {};

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  // ================= Fetch Categories =================
  Future<void> _fetchCategories() async {
    try {
      final res = await ApiService.get("/api/categories", withAuth: true);
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        setState(() {
          categories = data;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load categories: ${res.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching categories: $e")),
      );
    }
  }

  // ================= Validation Helpers =================
  bool _validateCategoryFields() {
    Map<String, String?> newErrors = {};
    if (_catName.text.isEmpty) newErrors['catName'] = 'This field is required';
    if (_catDesc.text.isEmpty) newErrors['catDesc'] = 'This field is required';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateProductFields() {
    Map<String, String?> newErrors = {};
    if (_prodName.text.isEmpty) newErrors['prodName'] = 'This field is required';
    if (_prodDesc.text.isEmpty) newErrors['prodDesc'] = 'This field is required';
    if (_prodPrice.text.isEmpty) newErrors['prodPrice'] = 'This field is required';
    if (_prodImage.text.isEmpty) newErrors['prodImage'] = 'This field is required';
    if (selectedCategoryId == null) newErrors['category'] = 'Please select a category';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateCouponFields() {
    Map<String, String?> newErrors = {};
    if (_couponCode.text.isEmpty) newErrors['couponCode'] = 'This field is required';
    if (_couponPct.text.isEmpty) newErrors['couponPct'] = 'This field is required';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  // ================= Create Category =================
  _createCategory() async {
    if (!_validateCategoryFields()) return;

    setState(() => _loading = true);

    try {
      final res = await ApiService.post(
        "/api/admin/categories",
        {
          "name": _catName.text,
          "description": _catDesc.text,
        },
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Category created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _catName.clear();
        _catDesc.clear();
        _fetchCategories();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Product =================
  _createProduct() async {
    if (!_validateProductFields()) return;

    setState(() => _loading = true);

    final body = {
      "name": _prodName.text,
      "description": _prodDesc.text,
      "price": double.tryParse(_prodPrice.text) ?? 0.0,
      "imageUrl": _prodImage.text,
      "categoryId": selectedCategoryId,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/products",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Product created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _prodName.clear();
        _prodDesc.clear();
        _prodPrice.clear();
        _prodImage.clear();
        setState(() {
          selectedCategoryId = null;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Coupon =================
  _createCoupon() async {
    if (!_validateCouponFields()) return;

    setState(() => _loading = true);

    final body = {
      "code": _couponCode.text,
      "discountPercent": int.tryParse(_couponPct.text) ?? 0,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/coupons",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Coupon created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _couponCode.clear();
        _couponPct.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ====== Category ======
            const Text("Create Category",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _catName,
              decoration: InputDecoration(
                labelText: "Name",
                errorText: errors['catName'],
              ),
            ),
            TextField(
              controller: _catDesc,
              decoration: InputDecoration(
                labelText: "Description",
                errorText: errors['catDesc'],
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createCategory,
              child: const Text("Create Category"),
            ),

            const Divider(height: 32),

            // ====== Product ======
            const Text("Create Product",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _prodName,
              decoration: InputDecoration(
                labelText: "Name",
                errorText: errors['prodName'],
              ),
            ),
            TextField(
              controller: _prodDesc,
              decoration: InputDecoration(
                labelText: "Description",
                errorText: errors['prodDesc'],
              ),
            ),
            TextField(
              controller: _prodPrice,
              decoration: InputDecoration(
                labelText: "Price",
                errorText: errors['prodPrice'],
              ),
            ),
            TextField(
              controller: _prodImage,
              decoration: InputDecoration(
                labelText: "Image URL",
                errorText: errors['prodImage'],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: DropdownButtonFormField<int>(
                value: selectedCategoryId,
                decoration: InputDecoration(
                  labelText: 'Select Category',
                  errorText: errors['category'],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                ),
                items: categories
                    .map((c) => DropdownMenuItem<int>(
                  value: c['id'],
                  child: Text(c['name']),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategoryId = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createProduct,
              child: const Text("Create Product"),
            ),

            const Divider(height: 32),

            // ====== Coupon ======
            const Text("Create Coupon",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _couponCode,
              decoration: InputDecoration(
                labelText: "Code",
                errorText: errors['couponCode'],
              ),
            ),
            TextField(
              controller: _couponPct,
              decoration: InputDecoration(
                labelText: "Discount %",
                errorText: errors['couponPct'],
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createCoupon,
              child: const Text("Create Coupon"),
            ),
          ],
        ),
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';

class AdminScreen extends StatefulWidget {
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _catName = TextEditingController();
  final _catDesc = TextEditingController();
  final _prodName = TextEditingController();
  final _prodDesc = TextEditingController();
  final _prodPrice = TextEditingController();
  final _prodImage = TextEditingController();
  final _couponCode = TextEditingController();
  final _couponPct = TextEditingController();

  bool _loading = false;
  List<dynamic> categories = [];
  int? selectedCategoryId;

  Uint8List? _pickedImageBytes; // For uploaded image preview (web & mobile)

  // Track validation errors
  Map<String, String?> errors = {};

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  // ================= Fetch Categories =================
  Future<void> _fetchCategories() async {
    try {
      final res = await ApiService.get("/api/categories", withAuth: true);
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        setState(() {
          categories = data;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load categories: ${res.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching categories: $e")),
      );
    }
  }

  // ================= Validation Helpers =================
  bool _validateCategoryFields() {
    Map<String, String?> newErrors = {};
    if (_catName.text.isEmpty) newErrors['catName'] = 'This field is required';
    if (_catDesc.text.isEmpty) newErrors['catDesc'] = 'This field is required';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateProductFields() {
    Map<String, String?> newErrors = {};
    if (_prodName.text.isEmpty) newErrors['prodName'] = 'This field is required';
    if (_prodDesc.text.isEmpty) newErrors['prodDesc'] = 'This field is required';
    if (_prodPrice.text.isEmpty) newErrors['prodPrice'] = 'This field is required';
    if (_prodImage.text.isEmpty && _pickedImageBytes == null)
      newErrors['prodImage'] = 'Please provide a URL or upload an image';
    if (selectedCategoryId == null) newErrors['category'] = 'Please select a category';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateCouponFields() {
    Map<String, String?> newErrors = {};
    if (_couponCode.text.isEmpty) newErrors['couponCode'] = 'This field is required';
    if (_couponPct.text.isEmpty) newErrors['couponPct'] = 'This field is required';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  // ================= Create Category =================
  _createCategory() async {
    if (!_validateCategoryFields()) return;

    setState(() => _loading = true);


    try {
      final res = await ApiService.post(
        "/api/admin/categories",
        {
          "name": _catName.text,
          "description": _catDesc.text,
        },
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Category created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _catName.clear();
        _catDesc.clear();
        _fetchCategories();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }


  // ================= Create Product =================
  _createProduct() async {
    if (!_validateProductFields()) return;

    setState(() => _loading = true);

    String imageUrl = _prodImage.text;

    // ================= Upload picked image if available =================
    if (_pickedImageBytes != null) {
      try {
        // You can pass a token if needed for auth
        final res = await ApiService.uploadFile(
          "/api/admin/products/upload",
          _pickedImageBytes!,
          "product_${DateTime.now().millisecondsSinceEpoch}.jpg",
          withAuth: true,
          token: "MySuperSecretKey12345MySuperSecretKey!", // replace if needed
        );

        if (res.statusCode == 200) {
          final data = jsonDecode(res.body);
          imageUrl = data['url'] ?? imageUrl; // backend should return { "url": "saved_file_url" }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("❌ Image upload failed: ${res.body}")),
          );
          setState(() => _loading = false);
          return;
        }
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("❌ Image upload error: $e")));
        setState(() => _loading = false);
        return;
      }
    }

    final body = {
      "name": _prodName.text,
      "description": _prodDesc.text,
      "price": double.tryParse(_prodPrice.text) ?? 0.0,
      "imageUrl": imageUrl,
      "categoryId": selectedCategoryId,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/products",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Product created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _prodName.clear();
        _prodDesc.clear();
        _prodPrice.clear();
        _prodImage.clear();
        setState(() {
          selectedCategoryId = null;
          _pickedImageBytes = null;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Coupon =================
  _createCoupon() async {
    if (!_validateCouponFields()) return;

    setState(() => _loading = true);

    final body = {
      "code": _couponCode.text,
      "discountPercent": int.tryParse(_couponPct.text) ?? 0,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/coupons",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Coupon created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _couponCode.clear();
        _couponPct.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ====== Category ======
            const Text("Create Category",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _catName,
              decoration: InputDecoration(
                labelText: "Name",
                errorText: errors['catName'],
              ),
            ),
            TextField(
              controller: _catDesc,
              decoration: InputDecoration(
                labelText: "Description",
                errorText: errors['catDesc'],
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createCategory,
              child: const Text("Create Category"),
            ),

            const Divider(height: 32),

            // ====== Product ======
            const Text("Create Product",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _prodName,
              decoration: InputDecoration(
                labelText: "Name",
                errorText: errors['prodName'],
              ),
            ),
            TextField(
              controller: _prodDesc,
              decoration: InputDecoration(
                labelText: "Description",
                errorText: errors['prodDesc'],
              ),
            ),
            TextField(
              controller: _prodPrice,
              decoration: InputDecoration(
                labelText: "Price",
                errorText: errors['prodPrice'],
              ),
            ),
            TextField(
              controller: _prodImage,
              decoration: InputDecoration(
                labelText: "Image URL",
                errorText: errors['prodImage'],
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color
              ),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.image,
                  withData: true, // Needed for web
                );
                if (result != null && result.files.single.bytes != null) {
                  setState(() {
                    _pickedImageBytes = result.files.single.bytes;
                    _prodImage.clear(); // Clear URL field
                  });
                }
              },
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload Image"),
            ),
            if (_pickedImageBytes != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image.memory(_pickedImageBytes!, height: 150),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: DropdownButtonFormField<int>(
                value: selectedCategoryId,
                decoration: InputDecoration(
                  labelText: 'Select Category',
                  errorText: errors['category'],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                ),
                items: categories
                    .map((c) => DropdownMenuItem<int>(
                  value: c['id'],
                  child: Text(c['name']),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategoryId = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createProduct,
              child: const Text("Create Product"),
            ),

            const Divider(height: 32),

            // ====== Coupon ======
            const Text("Create Coupon",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _couponCode,
              decoration: InputDecoration(
                labelText: "Code",
                errorText: errors['couponCode'],
              ),
            ),
            TextField(
              controller: _couponPct,
              decoration: InputDecoration(
                labelText: "Discount %",
                errorText: errors['couponPct'],
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createCoupon,
              child: const Text("Create Coupon"),
            ),
          ],
        ),
      ),
    );
  }
}
*/

//23-10-2025

/*import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';



class AdminScreen extends StatefulWidget {
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _catName = TextEditingController();
  final _catDesc = TextEditingController();
  final _prodName = TextEditingController();
  final _prodDesc = TextEditingController();
  final _prodPrice = TextEditingController();
  final _prodImage = TextEditingController();
  final _couponCode = TextEditingController();
  final _couponPct = TextEditingController();

  bool _loading = false;
  List<dynamic> categories = [];
  int? selectedCategoryId;

  Uint8List? _pickedImageBytes; // For uploaded image preview (web & mobile)

  // Track validation errors
  Map<String, String?> errors = {};

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  // ================= Fetch Categories =================
  Future<void> _fetchCategories() async {
    try {
      final res = await ApiService.get("/api/categories", withAuth: true);
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        setState(() {
          categories = data;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load categories: ${res.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching categories: $e")),
      );
    }
  }

  // ================= Validation Helpers =================
  bool _validateCategoryFields() {
    Map<String, String?> newErrors = {};
    if (_catName.text.isEmpty) newErrors['catName'] = 'This field is required';
    if (_catDesc.text.isEmpty) newErrors['catDesc'] = 'This field is required';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateProductFields() {
    Map<String, String?> newErrors = {};
    if (_prodName.text.isEmpty) newErrors['prodName'] = 'This field is required';
    if (_prodDesc.text.isEmpty) newErrors['prodDesc'] = 'This field is required';
    if (_prodPrice.text.isEmpty) newErrors['prodPrice'] = 'This field is required';
    if (_prodImage.text.isEmpty && _pickedImageBytes == null)
      newErrors['prodImage'] = 'Please provide a URL or upload an image';
    if (selectedCategoryId == null) newErrors['category'] = 'Please select a category';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateCouponFields() {
    Map<String, String?> newErrors = {};
    if (_couponCode.text.isEmpty) newErrors['couponCode'] = 'This field is required';
    if (_couponPct.text.isEmpty) newErrors['couponPct'] = 'This field is required';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  // ================= Create Category =================
  _createCategory() async {
    if (!_validateCategoryFields()) return;

    setState(() => _loading = true);

    try {
      final res = await ApiService.post(
        "/api/admin/categories",
        {
          "name": _catName.text,
          "description": _catDesc.text,
        },
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Category created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _catName.clear();
        _catDesc.clear();
        _fetchCategories();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Product =================
  _createProduct() async {
    if (!_validateProductFields()) return;

    setState(() => _loading = true);

    String imageUrl = _prodImage.text;

    // ================= Upload picked image if available =================
    if (_pickedImageBytes != null) {
      try {
        final res = await ApiService.uploadFile(
          "/api/admin/products/upload",
          _pickedImageBytes!,
          "product_${DateTime.now().millisecondsSinceEpoch}.jpg",
          withAuth: true, // automatically fetches token
        );

        if (res.statusCode == 200) {
          final data = jsonDecode(res.body);
          imageUrl = data['url'] ?? imageUrl; // backend should return { "url": "saved_file_url" }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("❌ Image upload failed: ${res.body}")),
          );
          setState(() => _loading = false);
          return;
        }
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("❌ Image upload error: $e")));
        setState(() => _loading = false);
        return;
      }
    }

    final body = {
      "name": _prodName.text,
      "description": _prodDesc.text,
      "price": double.tryParse(_prodPrice.text) ?? 0.0,
      "imageUrl": imageUrl,
      "categoryId": selectedCategoryId,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/products",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Product created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _prodName.clear();
        _prodDesc.clear();
        _prodPrice.clear();
        _prodImage.clear();
        setState(() {
          selectedCategoryId = null;
          _pickedImageBytes = null;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Coupon =================
  _createCoupon() async {
    if (!_validateCouponFields()) return;

    setState(() => _loading = true);

    final body = {
      "code": _couponCode.text,
      "discountPercent": int.tryParse(_couponPct.text) ?? 0,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/coupons",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Coupon created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _couponCode.clear();
        _couponPct.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ====== Category ======
            const Text("Create Category",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _catName,
              decoration: InputDecoration(
                labelText: "Name",
                errorText: errors['catName'],
              ),
            ),
            TextField(
              controller: _catDesc,
              decoration: InputDecoration(
                labelText: "Description",
                errorText: errors['catDesc'],
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createCategory,
              child: const Text("Create Category"),
            ),

            const Divider(height: 32),

            // ====== Product ======
            const Text("Create Product",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _prodName,
              decoration: InputDecoration(
                labelText: "Name",
                errorText: errors['prodName'],
              ),
            ),
            TextField(
              controller: _prodDesc,
              decoration: InputDecoration(
                labelText: "Description",
                errorText: errors['prodDesc'],
              ),
            ),
            TextField(
              controller: _prodPrice,
              decoration: InputDecoration(
                labelText: "Price",
                errorText: errors['prodPrice'],
              ),
            ),
            TextField(
              controller: _prodImage,
              decoration: InputDecoration(
                labelText: "Image URL",
                errorText: errors['prodImage'],
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.image,
                  withData: true,
                );
                if (result != null && result.files.single.bytes != null) {
                  setState(() {
                    _pickedImageBytes = result.files.single.bytes;
                    _prodImage.clear(); // Clear URL field
                  });
                }
              },
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload Image"),
            ),
            if (_pickedImageBytes != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image.memory(_pickedImageBytes!, height: 150),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: DropdownButtonFormField<int>(
                value: selectedCategoryId,
                decoration: InputDecoration(
                  labelText: 'Select Category',
                  errorText: errors['category'],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                ),
                items: categories
                    .map((c) => DropdownMenuItem<int>(
                  value: c['id'],
                  child: Text(c['name']),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategoryId = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createProduct,
              child: const Text("Create Product"),
            ),

            const Divider(height: 32),

            // ====== Coupon ======
            const Text("Create Coupon",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _couponCode,
              decoration: InputDecoration(
                labelText: "Code",
                errorText: errors['couponCode'],
              ),
            ),
            TextField(
              controller: _couponPct,
              decoration: InputDecoration(
                labelText: "Discount %",
                errorText: errors['couponPct'],
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createCoupon,
              child: const Text("Create Coupon"),
            ),
          ],
        ),
      ),
    );
  }
}
*/

/*import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';

class AdminScreen extends StatefulWidget {
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _catName = TextEditingController();
  final _catDesc = TextEditingController();
  final _prodName = TextEditingController();
  final _prodDesc = TextEditingController();
  final _prodPrice = TextEditingController();
  final _prodImage = TextEditingController();
  final _couponCode = TextEditingController();
  final _couponPct = TextEditingController();

  bool _loading = false;
  List<dynamic> categories = [];
  int? selectedCategoryId;

  Uint8List? _pickedImageBytes; // For uploaded image preview (web & mobile)

  // Track validation errors
  Map<String, String?> errors = {};

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  // ================= Fetch Categories =================
  Future<void> _fetchCategories() async {
    try {
      final res = await ApiService.get("/api/categories", withAuth: true);
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        setState(() {
          categories = data;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load categories: ${res.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching categories: $e")),
      );
    }
  }

  // ================= Validation Helpers =================
  bool _validateCategoryFields() {
    Map<String, String?> newErrors = {};
    if (_catName.text.isEmpty) newErrors['catName'] = 'This field is required';
    if (_catDesc.text.isEmpty) newErrors['catDesc'] = 'This field is required';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateProductFields() {
    Map<String, String?> newErrors = {};
    if (_prodName.text.isEmpty) newErrors['prodName'] = 'This field is required';
    if (_prodDesc.text.isEmpty) newErrors['prodDesc'] = 'This field is required';
    if (_prodPrice.text.isEmpty) newErrors['prodPrice'] = 'This field is required';
    if (_pickedImageBytes == null && (_prodImage.text.trim().isEmpty))
      newErrors['prodImage'] = 'Please provide a URL or upload an image';
    if (selectedCategoryId == null) newErrors['category'] = 'Please select a category';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateCouponFields() {
    Map<String, String?> newErrors = {};
    if (_couponCode.text.isEmpty) newErrors['couponCode'] = 'This field is required';
    if (_couponPct.text.isEmpty) newErrors['couponPct'] = 'This field is required';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  // ================= Create Category =================
  _createCategory() async {
    if (!_validateCategoryFields()) return;

    setState(() => _loading = true);

    try {
      final res = await ApiService.post(
        "/api/admin/categories",
        {
          "name": _catName.text,
          "description": _catDesc.text,
        },
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Category created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _catName.clear();
        _catDesc.clear();
        _fetchCategories();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Product =================
  _createProduct() async {
    if (!_validateProductFields()) return;

    setState(() => _loading = true);

    String? imageUrl;

    // ================= Upload picked image if available =================
    if (_pickedImageBytes != null) {
      try {
        final res = await ApiService.uploadFile(
          "/api/admin/products/upload",
          _pickedImageBytes!,
          "product_${DateTime.now().millisecondsSinceEpoch}.jpg",
          withAuth: true, // automatically fetches token
        );

        if (res.statusCode == 200) {
          final data = jsonDecode(res.body);
          imageUrl = data['url']; // backend should return { "url": "/uploads/filename.jpg" }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("❌ Image upload failed: ${res.body}")),
          );
          setState(() => _loading = false);
          return;
        }
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("❌ Image upload error: $e")));
        setState(() => _loading = false);
        return;
      }
    } else if (_prodImage.text.trim().isNotEmpty) {
      imageUrl = _prodImage.text.trim();
    }

    final body = {
      "name": _prodName.text.trim(),
      "description": _prodDesc.text.trim(),
      "price": double.tryParse(_prodPrice.text) ?? 0.0,
      "imageUrl": imageUrl,
      "categoryId": selectedCategoryId,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/products",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Product created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _prodName.clear();
        _prodDesc.clear();
        _prodPrice.clear();
        _prodImage.clear();
        setState(() {
          selectedCategoryId = null;
          _pickedImageBytes = null;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Coupon =================
  _createCoupon() async {
    if (!_validateCouponFields()) return;

    setState(() => _loading = true);

    final body = {
      "code": _couponCode.text,
      "discountPercent": int.tryParse(_couponPct.text) ?? 0,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/coupons",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Coupon created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _couponCode.clear();
        _couponPct.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ====== Category ======
            const Text("Create Category",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _catName,
              decoration: InputDecoration(
                labelText: "Name",
                errorText: errors['catName'],
              ),
            ),
            TextField(
              controller: _catDesc,
              decoration: InputDecoration(
                labelText: "Description",
                errorText: errors['catDesc'],
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createCategory,
              child: const Text("Create Category"),
            ),

            const Divider(height: 32),

            // ====== Product ======
            const Text("Create Product",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _prodName,
              decoration: InputDecoration(
                labelText: "Name",
                errorText: errors['prodName'],
              ),
            ),
            TextField(
              controller: _prodDesc,
              decoration: InputDecoration(
                labelText: "Description",
                errorText: errors['prodDesc'],
              ),
            ),
            TextField(
              controller: _prodPrice,
              decoration: InputDecoration(
                labelText: "Price",
                errorText: errors['prodPrice'],
              ),
            ),
            TextField(
              controller: _prodImage,
              decoration: InputDecoration(
                labelText: "Image URL",
                errorText: errors['prodImage'],
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.image,
                  withData: true,
                );
                if (result != null && result.files.single.bytes != null) {
                  setState(() {
                    _pickedImageBytes = result.files.single.bytes;
                    _prodImage.clear(); // Clear URL field
                  });
                }
              },
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload Image"),
            ),

            // ====== Uploaded Image Preview with Delete ======
            if (_pickedImageBytes != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Stack(
                  children: [
                    Image.memory(_pickedImageBytes!, height: 150),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _pickedImageBytes = null;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: DropdownButtonFormField<int>(
                value: selectedCategoryId,
                decoration: InputDecoration(
                  labelText: 'Select Category',
                  errorText: errors['category'],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                ),
                items: categories
                    .map((c) => DropdownMenuItem<int>(
                  value: c['id'],
                  child: Text(c['name']),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategoryId = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createProduct,
              child: const Text("Create Product"),
            ),

            const Divider(height: 32),

            // ====== Coupon ======
            const Text("Create Coupon",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _couponCode,
              decoration: InputDecoration(
                labelText: "Code",
                errorText: errors['couponCode'],
              ),
            ),
            TextField(
              controller: _couponPct,
              decoration: InputDecoration(
                labelText: "Discount %",
                errorText: errors['couponPct'],
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createCoupon,
              child: const Text("Create Coupon"),
            ),
          ],
        ),
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';

class AdminScreen extends StatefulWidget {
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _catName = TextEditingController();
  final _catDesc = TextEditingController();
  final _prodName = TextEditingController();
  final _prodDesc = TextEditingController();
  final _prodPrice = TextEditingController();
  final _couponCode = TextEditingController();
  final _couponPct = TextEditingController();

  bool _loading = false;
  List<dynamic> categories = [];
  int? selectedCategoryId;

  Uint8List? _pickedImageBytes; // for uploaded image

  Map<String, String?> errors = {};

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  // ================= Fetch Categories =================
  Future<void> _fetchCategories() async {
    try {
      final res = await ApiService.get("/api/categories", withAuth: true);
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        setState(() {
          categories = data;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load categories: ${res.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching categories: $e")),
      );
    }
  }

  // ================= Validation =================
  bool _validateCategoryFields() {
    Map<String, String?> newErrors = {};
    if (_catName.text.isEmpty) newErrors['catName'] = 'This field is required';
    if (_catDesc.text.isEmpty) newErrors['catDesc'] = 'This field is required';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateProductFields() {
    Map<String, String?> newErrors = {};
    if (_prodName.text.isEmpty) newErrors['prodName'] = 'This field is required';
    if (_prodDesc.text.isEmpty) newErrors['prodDesc'] = 'This field is required';
    if (_prodPrice.text.isEmpty) newErrors['prodPrice'] = 'This field is required';
    if (_pickedImageBytes == null)
      newErrors['prodImage'] = 'Please upload an image';
    if (selectedCategoryId == null) newErrors['category'] = 'Please select a category';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateCouponFields() {
    Map<String, String?> newErrors = {};
    if (_couponCode.text.isEmpty) newErrors['couponCode'] = 'This field is required';
    if (_couponPct.text.isEmpty) newErrors['couponPct'] = 'This field is required';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  // ================= Create Category =================
  _createCategory() async {
    if (!_validateCategoryFields()) return;

    setState(() => _loading = true);

    try {
      final res = await ApiService.post(
        "/api/admin/categories",
        {
          "name": _catName.text,
          "description": _catDesc.text,
        },
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Category created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _catName.clear();
        _catDesc.clear();
        _fetchCategories();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Product =================
  _createProduct() async {
    if (!_validateProductFields()) return;

    setState(() => _loading = true);

    String? imageUrl;

    // Upload image
    if (_pickedImageBytes != null) {
      try {
        final res = await ApiService.uploadFile(
          "/api/admin/products/upload",
          _pickedImageBytes!,
          "product_${DateTime.now().millisecondsSinceEpoch}.jpg",
          withAuth: true,
        );

        if (res.statusCode == 200) {
          final data = jsonDecode(res.body);
          imageUrl = data['url'];
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("❌ Image upload failed: ${res.body}")),
          );
          setState(() => _loading = false);
          return;
        }
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("❌ Image upload error: $e")));
        setState(() => _loading = false);
        return;
      }
    }

    final body = {
      "name": _prodName.text.trim(),
      "description": _prodDesc.text.trim(),
      "price": double.tryParse(_prodPrice.text) ?? 0.0,
      "imageUrl": imageUrl,
      "categoryId": selectedCategoryId,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/products",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Product created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _prodName.clear();
        _prodDesc.clear();
        _prodPrice.clear();
        setState(() {
          selectedCategoryId = null;
          _pickedImageBytes = null;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Coupon =================
  _createCoupon() async {
    if (!_validateCouponFields()) return;

    setState(() => _loading = true);

    final body = {
      "code": _couponCode.text,
      "discountPercent": int.tryParse(_couponPct.text) ?? 0,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/coupons",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Coupon created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _couponCode.clear();
        _couponPct.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ====== Category ======
            const Text("Create Category",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _catName,
              decoration: InputDecoration(
                labelText: "Name",
                errorText: errors['catName'],
              ),
            ),
            TextField(
              controller: _catDesc,
              decoration: InputDecoration(
                labelText: "Description",
                errorText: errors['catDesc'],
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createCategory,
              child: const Text("Create Category"),
            ),

            const Divider(height: 32),

            // ====== Product ======
            const Text("Create Product",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _prodName,
              decoration: InputDecoration(
                labelText: "Name",
                errorText: errors['prodName'],
              ),
            ),
            TextField(
              controller: _prodDesc,
              decoration: InputDecoration(
                labelText: "Description",
                errorText: errors['prodDesc'],
              ),
            ),
            TextField(
              controller: _prodPrice,
              decoration: InputDecoration(
                labelText: "Price",
                errorText: errors['prodPrice'],
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.image,
                  withData: true,
                );
                if (result != null && result.files.single.bytes != null) {
                  setState(() {
                    _pickedImageBytes = result.files.single.bytes;
                  });
                }
              },
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload Image"),
            ),
            if (errors['prodImage'] != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  errors['prodImage']!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),

            // ====== Uploaded Image Preview ======
            if (_pickedImageBytes != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Stack(
                  children: [
                    Image.memory(_pickedImageBytes!, height: 150),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _pickedImageBytes = null;
                          });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child:
                          const Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: DropdownButtonFormField<int>(
                value: selectedCategoryId,
                decoration: InputDecoration(
                  labelText: 'Select Category',
                  errorText: errors['category'],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                ),
                items: categories
                    .map((c) => DropdownMenuItem<int>(
                  value: c['id'],
                  child: Text(c['name']),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategoryId = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createProduct,
              child: const Text("Create Product"),
            ),

            const Divider(height: 32),

            // ====== Coupon ======
            const Text("Create Coupon",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _couponCode,
              decoration: InputDecoration(
                labelText: "Code",
                errorText: errors['couponCode'],
              ),
            ),
            TextField(
              controller: _couponPct,
              decoration: InputDecoration(
                labelText: "Discount %",
                errorText: errors['couponPct'],
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _createCoupon,
              child: const Text("Create Coupon"),
            ),
          ],
        ),
      ),
    );
  }
}*/


//24-10-2025 working code for products saving and displaying
/*import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // for MediaType

class AdminScreen extends StatefulWidget {
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _catName = TextEditingController();
  final _catDesc = TextEditingController();
  final _prodName = TextEditingController();
  final _prodDesc = TextEditingController();
  final _prodPrice = TextEditingController();
  final _couponCode = TextEditingController();
  final _couponPct = TextEditingController();

  bool _loading = false;
  List<dynamic> categories = [];
  int? selectedCategoryId;

  Uint8List? _pickedImageBytes;
  String? _pickedImageFileName;

  Map<String, String?> errors = {};

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  // ================= Fetch Categories =================
  Future<void> _fetchCategories() async {
    try {
      final res = await ApiService.get("/api/categories", withAuth: true);
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        setState(() {
          categories = data;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load categories: ${res.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching categories: $e")),
      );
    }
  }

  // ================= Validation =================
  bool _validateCategoryFields() {
    Map<String, String?> newErrors = {};
    if (_catName.text.isEmpty) newErrors['catName'] = 'This field is required';
    if (_catDesc.text.isEmpty) newErrors['catDesc'] = 'This field is required';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateProductFields() {
    Map<String, String?> newErrors = {};
    if (_prodName.text.isEmpty) newErrors['prodName'] = 'This field is required';
    if (_prodDesc.text.isEmpty) newErrors['prodDesc'] = 'This field is required';
    if (_prodPrice.text.isEmpty) newErrors['prodPrice'] = 'This field is required';
    if (_pickedImageBytes == null) newErrors['prodImage'] = 'Please upload an image';
    if (selectedCategoryId == null) newErrors['category'] = 'Please select a category';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateCouponFields() {
    Map<String, String?> newErrors = {};
    if (_couponCode.text.isEmpty) newErrors['couponCode'] = 'This field is required';
    if (_couponPct.text.isEmpty) newErrors['couponPct'] = 'This field is required';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  // ================= Create Category =================
  _createCategory() async {
    if (!_validateCategoryFields()) return;

    setState(() => _loading = true);

    try {
      final res = await ApiService.post(
        "/api/admin/categories",
        {
          "name": _catName.text,
          "description": _catDesc.text,
        },
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Category created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _catName.clear();
        _catDesc.clear();
        _fetchCategories();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Product with Image Upload =================
  _createProduct() async {
    if (!_validateProductFields()) return;
    setState(() => _loading = true);

    try {
      final uri = Uri.parse(ApiService.base + "/api/admin/products");
      final token = await ApiService.getToken();

      var request = http.MultipartRequest('POST', uri);

      // Add text fields
      request.fields['name'] = _prodName.text.trim();
      request.fields['description'] = _prodDesc.text.trim();
      request.fields['price'] = _prodPrice.text.trim();
      request.fields['categoryId'] = selectedCategoryId.toString();

      // Add image
      if (_pickedImageBytes != null && _pickedImageFileName != null) {
        request.files.add(
          http.MultipartFile.fromBytes(
            'image', // must match backend @RequestParam("image")
            _pickedImageBytes!,
            filename: _pickedImageFileName!,
            contentType: MediaType('image', _getImageExtension(_pickedImageFileName!)),
          ),
        );
      }

      // Add auth header if needed
      if (token != null) request.headers['Authorization'] = 'Bearer $token';

      // Send request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ Product created successfully!")),
        );

        // Clear fields
        _prodName.clear();
        _prodDesc.clear();
        _prodPrice.clear();
        setState(() {
          selectedCategoryId = null;
          _pickedImageBytes = null;
          _pickedImageFileName = null;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("❌ Error: ${response.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  String _getImageExtension(String filename) {
    var extension = filename.split('.').last.toLowerCase();
    if (extension == 'jpg' || extension == 'jpeg') return 'jpeg';
    if (extension == 'png') return 'png';
    return 'jpeg';
  }

  // ================= Create Coupon =================
  _createCoupon() async {
    if (!_validateCouponFields()) return;

    setState(() => _loading = true);

    final body = {
      "code": _couponCode.text,
      "discountPercent": int.tryParse(_couponPct.text) ?? 0,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/coupons",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Coupon created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _couponCode.clear();
        _couponPct.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Create Category", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _catName,
              decoration: InputDecoration(labelText: "Name", errorText: errors['catName']),
            ),
            TextField(
              controller: _catDesc,
              decoration: InputDecoration(labelText: "Description", errorText: errors['catDesc']),
            ),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: _createCategory, child: const Text("Create Category")),
            const Divider(height: 32),

            const Text("Create Product", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _prodName,
              decoration: InputDecoration(labelText: "Name", errorText: errors['prodName']),
            ),
            TextField(
              controller: _prodDesc,
              decoration: InputDecoration(labelText: "Description", errorText: errors['prodDesc']),
            ),
            TextField(
              controller: _prodPrice,
              decoration: InputDecoration(labelText: "Price", errorText: errors['prodPrice']),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.image,
                  withData: true,
                );
                if (result != null && result.files.single.bytes != null) {
                  setState(() {
                    _pickedImageBytes = result.files.single.bytes;
                    _pickedImageFileName = result.files.single.name;
                  });
                }
              },
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload Image"),
            ),
            if (errors['prodImage'] != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(errors['prodImage']!, style: const TextStyle(color: Colors.red, fontSize: 12)),
              ),
            if (_pickedImageBytes != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Stack(
                  children: [
                    Image.memory(_pickedImageBytes!, height: 150),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _pickedImageBytes = null;
                            _pickedImageFileName = null;
                          });
                        },
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                          child: const Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: DropdownButtonFormField<int>(
                value: selectedCategoryId,
                decoration: InputDecoration(
                  labelText: 'Select Category',
                  errorText: errors['category'],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                items: categories.map((c) => DropdownMenuItem<int>(
                  value: c['id'],
                  child: Text(c['name']),
                )).toList(),
                onChanged: (value) => setState(() => selectedCategoryId = value),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: _createProduct, child: const Text("Create Product")),
            const Divider(height: 32),

            const Text("Create Coupon", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(controller: _couponCode, decoration: InputDecoration(labelText: "Code", errorText: errors['couponCode'])),
            TextField(controller: _couponPct, decoration: InputDecoration(labelText: "Discount %", errorText: errors['couponPct'])),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: _createCoupon, child: const Text("Create Coupon")),
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
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // for MediaType

class AdminScreen extends StatefulWidget {
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _catName = TextEditingController();
  final _catDesc = TextEditingController();
  final _prodName = TextEditingController();
  final _prodDesc = TextEditingController();
  final _prodPrice = TextEditingController();
  final _prodNewPrice = TextEditingController(); // <-- New Price
  final _couponCode = TextEditingController();
  final _couponPct = TextEditingController();

  bool _loading = false;
  List<dynamic> categories = [];
  int? selectedCategoryId;

  Uint8List? _pickedImageBytes;
  String? _pickedImageFileName;

  Map<String, String?> errors = {};

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  // ================= Fetch Categories =================
  Future<void> _fetchCategories() async {
    try {
      final res = await ApiService.get("/api/categories", withAuth: true);
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        setState(() {
          categories = data;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load categories: ${res.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching categories: $e")),
      );
    }
  }

  // ================= Validation =================
  bool _validateCategoryFields() {
    Map<String, String?> newErrors = {};
    if (_catName.text.isEmpty) newErrors['catName'] = 'This field is required';
    if (_catDesc.text.isEmpty) newErrors['catDesc'] = 'This field is required';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateProductFields() {
    Map<String, String?> newErrors = {};
    if (_prodName.text.isEmpty) newErrors['prodName'] = 'This field is required';
    if (_prodDesc.text.isEmpty) newErrors['prodDesc'] = 'This field is required';
    if (_prodPrice.text.isEmpty) newErrors['prodPrice'] = 'This field is required';
    if (_pickedImageBytes == null) newErrors['prodImage'] = 'Please upload an image';
    if (selectedCategoryId == null) newErrors['category'] = 'Please select a category';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateCouponFields() {
    Map<String, String?> newErrors = {};
    if (_couponCode.text.isEmpty) newErrors['couponCode'] = 'This field is required';
    if (_couponPct.text.isEmpty) newErrors['couponPct'] = 'This field is required';
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  // ================= Create Category =================
  _createCategory() async {
    if (!_validateCategoryFields()) return;

    setState(() => _loading = true);

    try {
      final res = await ApiService.post(
        "/api/admin/categories",
        {
          "name": _catName.text,
          "description": _catDesc.text,
        },
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Category created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _catName.clear();
        _catDesc.clear();
        _fetchCategories();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Product with Image Upload =================
  _createProduct() async {
    if (!_validateProductFields()) return;
    setState(() => _loading = true);

    try {
      final uri = Uri.parse(ApiService.base + "/api/admin/products");
      final token = await ApiService.getToken();

      var request = http.MultipartRequest('POST', uri);

      // Add text fields
      request.fields['name'] = _prodName.text.trim();
      request.fields['description'] = _prodDesc.text.trim();
      request.fields['price'] = _prodPrice.text.trim();
      request.fields['categoryId'] = selectedCategoryId.toString();

      if (_prodNewPrice.text.isNotEmpty) {
        request.fields['newPrice'] = _prodNewPrice.text.trim(); // <-- New Price
      }

      // Add image
      if (_pickedImageBytes != null && _pickedImageFileName != null) {
        request.files.add(
          http.MultipartFile.fromBytes(
            'image',
            _pickedImageBytes!,
            filename: _pickedImageFileName!,
            contentType: MediaType('image', _getImageExtension(_pickedImageFileName!)),
          ),
        );
      }

      // Add auth header if needed
      if (token != null) request.headers['Authorization'] = 'Bearer $token';

      // Send request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ Product created successfully!")),
        );

        // Clear fields
        _prodName.clear();
        _prodDesc.clear();
        _prodPrice.clear();
        _prodNewPrice.clear(); // <-- clear new price
        setState(() {
          selectedCategoryId = null;
          _pickedImageBytes = null;
          _pickedImageFileName = null;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("❌ Error: ${response.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  String _getImageExtension(String filename) {
    var extension = filename.split('.').last.toLowerCase();
    if (extension == 'jpg' || extension == 'jpeg') return 'jpeg';
    if (extension == 'png') return 'png';
    return 'jpeg';
  }

  // ================= Create Coupon =================
  _createCoupon() async {
    if (!_validateCouponFields()) return;

    setState(() => _loading = true);

    final body = {
      "code": _couponCode.text,
      "discountPercent": int.tryParse(_couponPct.text) ?? 0,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/coupons",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? "✅ Coupon created successfully!"
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _couponCode.clear();
        _couponPct.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Create Category", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _catName,
              decoration: InputDecoration(labelText: "Name", errorText: errors['catName']),
            ),
            TextField(
              controller: _catDesc,
              decoration: InputDecoration(labelText: "Description", errorText: errors['catDesc']),
            ),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: _createCategory, child: const Text("Create Category")),
            const Divider(height: 32),

            const Text("Create Product", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _prodName,
              decoration: InputDecoration(labelText: "Name", errorText: errors['prodName']),
            ),
            TextField(
              controller: _prodDesc,
              decoration: InputDecoration(labelText: "Description", errorText: errors['prodDesc']),
            ),
            TextField(
              controller: _prodPrice,
              decoration: InputDecoration(labelText: "Original Price", errorText: errors['prodPrice']),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _prodNewPrice,
              decoration: const InputDecoration(labelText: "New Price (Optional)"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.image,
                  withData: true,
                );
                if (result != null && result.files.single.bytes != null) {
                  setState(() {
                    _pickedImageBytes = result.files.single.bytes;
                    _pickedImageFileName = result.files.single.name;
                  });
                }
              },
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload Image"),
            ),
            if (errors['prodImage'] != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(errors['prodImage']!, style: const TextStyle(color: Colors.red, fontSize: 12)),
              ),
            if (_pickedImageBytes != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.memory(_pickedImageBytes!, height: 150),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _pickedImageBytes = null;
                                _pickedImageFileName = null;
                              });
                            },
                            child: Container(
                              decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                              child: const Icon(Icons.close, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "₹${_prodPrice.text}",
                          style: TextStyle(
                            decoration: _prodNewPrice.text.isNotEmpty
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (_prodNewPrice.text.isNotEmpty) ...[
                          const SizedBox(width: 8),
                          Text(
                            "₹${_prodNewPrice.text}",
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]
                      ],
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: DropdownButtonFormField<int>(
                initialValue: selectedCategoryId,
                decoration: InputDecoration(
                  labelText: 'Select Category',
                  errorText: errors['category'],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                items: categories.map((c) => DropdownMenuItem<int>(
                  value: c['id'],
                  child: Text(c['name']),
                )).toList(),
                onChanged: (value) => setState(() => selectedCategoryId = value),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: _createProduct, child: const Text("Create Product")),
            const Divider(height: 32),

            const Text("Create Coupon", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(controller: _couponCode, decoration: InputDecoration(labelText: "Code", errorText: errors['couponCode'])),
            TextField(controller: _couponPct, decoration: InputDecoration(labelText: "Discount %", errorText: errors['couponPct'])),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: _createCoupon, child: const Text("Create Coupon")),
          ],
        ),
      ),
    );
  }
}
*/

// 05-11-2025 working
/*
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // for MediaType

class AdminScreen extends StatefulWidget {
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _catName = TextEditingController();
  final _catDesc = TextEditingController();
  final _prodName = TextEditingController();
  final _prodDesc = TextEditingController();
  final _prodPrice = TextEditingController();
  final _prodNewPrice = TextEditingController(); // <-- New Price
  final _couponCode = TextEditingController();
  final _couponPct = TextEditingController();

  bool _loading = false;
  List<dynamic> categories = [];
  int? selectedCategoryId;

  Uint8List? _pickedImageBytes;
  String? _pickedImageFileName;

  Map<String, String?> errors = {};

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  // ================= Fetch Categories =================
  Future<void> _fetchCategories() async {
    try {
      final res = await ApiService.get("/api/categories", withAuth: true);
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        setState(() {
          categories = data;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load categories: ${res.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching categories: $e")),
      );
    }
  }

  // ================= Validation =================
  bool _validateCategoryFields() {
    Map<String, String?> newErrors = {};
    if (_catName.text.isEmpty) newErrors['catName'] = tr('field_required');
    if (_catDesc.text.isEmpty) newErrors['catDesc'] = tr('field_required');
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateProductFields() {
    Map<String, String?> newErrors = {};
    if (_prodName.text.isEmpty) newErrors['prodName'] = tr('field_required');
    if (_prodDesc.text.isEmpty) newErrors['prodDesc'] = tr('field_required');
    if (_prodPrice.text.isEmpty) newErrors['prodPrice'] = tr('field_required');
    if (_pickedImageBytes == null) newErrors['prodImage'] = tr('upload_image_error');
    if (selectedCategoryId == null) newErrors['category'] = tr('select_category_error');
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateCouponFields() {
    Map<String, String?> newErrors = {};
    if (_couponCode.text.isEmpty) newErrors['couponCode'] = tr('field_required');
    if (_couponPct.text.isEmpty) newErrors['couponPct'] = tr('field_required');
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  // ================= Create Category =================
  _createCategory() async {
    if (!_validateCategoryFields()) return;

    setState(() => _loading = true);

    try {
      final res = await ApiService.post(
        "/api/admin/categories",
        {
          "name": _catName.text,
          "description": _catDesc.text,
        },
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? tr('category_success')
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _catName.clear();
        _catDesc.clear();
        _fetchCategories();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Product =================
  _createProduct() async {
    if (!_validateProductFields()) return;
    setState(() => _loading = true);

    try {
      final uri = Uri.parse(ApiService.base + "/api/admin/products");
      final token = await ApiService.getToken();

      var request = http.MultipartRequest('POST', uri);
      request.fields['name'] = _prodName.text.trim();
      request.fields['description'] = _prodDesc.text.trim();
      request.fields['price'] = _prodPrice.text.trim();
      request.fields['categoryId'] = selectedCategoryId.toString();

      if (_prodNewPrice.text.isNotEmpty) {
        request.fields['newPrice'] = _prodNewPrice.text.trim();
      }

      if (_pickedImageBytes != null && _pickedImageFileName != null) {
        request.files.add(
          http.MultipartFile.fromBytes(
            'image',
            _pickedImageBytes!,
            filename: _pickedImageFileName!,
            contentType: MediaType('image', _getImageExtension(_pickedImageFileName!)),
          ),
        );
      }

      if (token != null) request.headers['Authorization'] = 'Bearer $token';

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(tr('product_success'))),
        );

        _prodName.clear();
        _prodDesc.clear();
        _prodPrice.clear();
        _prodNewPrice.clear();
        setState(() {
          selectedCategoryId = null;
          _pickedImageBytes = null;
          _pickedImageFileName = null;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("❌ Error: ${response.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  String _getImageExtension(String filename) {
    var extension = filename.split('.').last.toLowerCase();
    if (extension == 'jpg' || extension == 'jpeg') return 'jpeg';
    if (extension == 'png') return 'png';
    return 'jpeg';
  }

  // ================= Create Coupon =================
  _createCoupon() async {
    if (!_validateCouponFields()) return;
    setState(() => _loading = true);

    final body = {
      "code": _couponCode.text,
      "discountPercent": int.tryParse(_couponPct.text) ?? 0,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/coupons",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? tr('coupon_success')
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _couponCode.clear();
        _couponPct.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('admin_panel'))),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tr('create_category'), style: const TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _catName,
              decoration: InputDecoration(labelText: tr('name'), errorText: errors['catName']),
            ),
            TextField(
              controller: _catDesc,
              decoration: InputDecoration(labelText: tr('description'), errorText: errors['catDesc']),
            ),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: _createCategory, child: Text(tr('create_category_btn'))),
            const Divider(height: 32),

            Text(tr('create_product'), style: const TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _prodName,
              decoration: InputDecoration(labelText: tr('name'), errorText: errors['prodName']),
            ),
            TextField(
              controller: _prodDesc,
              decoration: InputDecoration(labelText: tr('description'), errorText: errors['prodDesc']),
            ),
            TextField(
              controller: _prodPrice,
              decoration: InputDecoration(labelText: tr('original_price'), errorText: errors['prodPrice']),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _prodNewPrice,
              decoration: InputDecoration(labelText: tr('new_price')),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(type: FileType.image, withData: true);
                if (result != null && result.files.single.bytes != null) {
                  setState(() {
                    _pickedImageBytes = result.files.single.bytes;
                    _pickedImageFileName = result.files.single.name;
                  });
                }
              },
              icon: const Icon(Icons.upload_file),
              label: Text(tr('upload_image')),
            ),
            if (errors['prodImage'] != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(errors['prodImage']!, style: const TextStyle(color: Colors.red, fontSize: 12)),
              ),
            if (_pickedImageBytes != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.memory(_pickedImageBytes!, height: 150),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _pickedImageBytes = null;
                                _pickedImageFileName = null;
                              });
                            },
                            child: Container(
                              decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                              child: const Icon(Icons.close, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: DropdownButtonFormField<int>(
                initialValue: selectedCategoryId,
                decoration: InputDecoration(
                  labelText: tr('select_category'),
                  errorText: errors['category'],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                items: categories
                    .map((c) => DropdownMenuItem<int>(
                  value: c['id'],
                  child: Text(c['name']),
                ))
                    .toList(),
                onChanged: (value) => setState(() => selectedCategoryId = value),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: _createProduct, child: Text(tr('create_product_btn'))),
            const Divider(height: 32),

            Text(tr('create_coupon'), style: const TextStyle(fontWeight: FontWeight.bold)),
            TextField(controller: _couponCode, decoration: InputDecoration(labelText: tr('code'), errorText: errors['couponCode'])),
            TextField(controller: _couponPct, decoration: InputDecoration(labelText: tr('discount'), errorText: errors['couponPct'])),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: _createCoupon, child: Text(tr('create_coupon_btn'))),
          ],
        ),
      ),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // for MediaType

import 'edit_product_screen.dart'; // <-- Added import

class AdminScreen extends StatefulWidget {
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _catName = TextEditingController();
  final _catDesc = TextEditingController();
  final _prodName = TextEditingController();
  final _prodDesc = TextEditingController();
  final _prodPrice = TextEditingController();
  final _prodNewPrice = TextEditingController(); // <-- New Price
  final _couponCode = TextEditingController();
  final _couponPct = TextEditingController();

  bool _loading = false;
  List<dynamic> categories = [];
  int? selectedCategoryId;

  Uint8List? _pickedImageBytes;
  String? _pickedImageFileName;

  Map<String, String?> errors = {};

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  // ================= Fetch Categories =================
  Future<void> _fetchCategories() async {
    try {
      final res = await ApiService.get("/api/categories", withAuth: true);
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        setState(() {
          categories = data;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load categories: ${res.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching categories: $e")),
      );
    }
  }

  // ================= Validation =================
  bool _validateCategoryFields() {
    Map<String, String?> newErrors = {};
    if (_catName.text.isEmpty) newErrors['catName'] = tr('field_required');
    if (_catDesc.text.isEmpty) newErrors['catDesc'] = tr('field_required');
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateProductFields() {
    Map<String, String?> newErrors = {};
    if (_prodName.text.isEmpty) newErrors['prodName'] = tr('field_required');
    if (_prodDesc.text.isEmpty) newErrors['prodDesc'] = tr('field_required');
    if (_prodPrice.text.isEmpty) newErrors['prodPrice'] = tr('field_required');
    if (_pickedImageBytes == null) newErrors['prodImage'] = tr('upload_image_error');
    if (selectedCategoryId == null) newErrors['category'] = tr('select_category_error');
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  bool _validateCouponFields() {
    Map<String, String?> newErrors = {};
    if (_couponCode.text.isEmpty) newErrors['couponCode'] = tr('field_required');
    if (_couponPct.text.isEmpty) newErrors['couponPct'] = tr('field_required');
    setState(() => errors = newErrors);
    return newErrors.isEmpty;
  }

  // ================= Create Category =================
  _createCategory() async {
    if (!_validateCategoryFields()) return;

    setState(() => _loading = true);

    try {
      final res = await ApiService.post(
        "/api/admin/categories",
        {
          "name": _catName.text,
          "description": _catDesc.text,
        },
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? tr('category_success')
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _catName.clear();
        _catDesc.clear();
        _fetchCategories();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= Create Product =================
  _createProduct() async {
    if (!_validateProductFields()) return;
    setState(() => _loading = true);

    try {
      final uri = Uri.parse(ApiService.base + "/api/admin/products");
      final token = await ApiService.getToken();

      var request = http.MultipartRequest('POST', uri);
      request.fields['name'] = _prodName.text.trim();
      request.fields['description'] = _prodDesc.text.trim();
      request.fields['price'] = _prodPrice.text.trim();
      request.fields['categoryId'] = selectedCategoryId.toString();

      if (_prodNewPrice.text.isNotEmpty) {
        request.fields['newPrice'] = _prodNewPrice.text.trim();
      }

      if (_pickedImageBytes != null && _pickedImageFileName != null) {
        request.files.add(
          http.MultipartFile.fromBytes(
            'image',
            _pickedImageBytes!,
            filename: _pickedImageFileName!,
            contentType: MediaType('image', _getImageExtension(_pickedImageFileName!)),
          ),
        );
      }

      if (token != null) request.headers['Authorization'] = 'Bearer $token';

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(tr('product_success'))),
        );

        _prodName.clear();
        _prodDesc.clear();
        _prodPrice.clear();
        _prodNewPrice.clear();
        setState(() {
          selectedCategoryId = null;
          _pickedImageBytes = null;
          _pickedImageFileName = null;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("❌ Error: ${response.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  String _getImageExtension(String filename) {
    var extension = filename.split('.').last.toLowerCase();
    if (extension == 'jpg' || extension == 'jpeg') return 'jpeg';
    if (extension == 'png') return 'png';
    return 'jpeg';
  }

  // ================= Create Coupon =================
  _createCoupon() async {
    if (!_validateCouponFields()) return;
    setState(() => _loading = true);

    final body = {
      "code": _couponCode.text,
      "discountPercent": int.tryParse(_couponPct.text) ?? 0,
    };

    try {
      final res = await ApiService.post(
        "/api/admin/coupons",
        body,
        withAuth: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.statusCode == 201
                ? tr('coupon_success')
                : "❌ Error: ${res.body}",
          ),
        ),
      );

      if (res.statusCode == 201) {
        _couponCode.clear();
        _couponPct.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _loading = false);
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('admin_panel'))),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tr('create_category'), style: const TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _catName,
              decoration: InputDecoration(labelText: tr('name'), errorText: errors['catName']),
            ),
            TextField(
              controller: _catDesc,
              decoration: InputDecoration(labelText: tr('description'), errorText: errors['catDesc']),
            ),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: _createCategory, child: Text(tr('create_category_btn'))),
            const Divider(height: 32),

            Text(tr('create_product'), style: const TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _prodName,
              decoration: InputDecoration(labelText: tr('name'), errorText: errors['prodName']),
            ),
            TextField(
              controller: _prodDesc,
              decoration: InputDecoration(labelText: tr('description'), errorText: errors['prodDesc']),
            ),
            TextField(
              controller: _prodPrice,
              decoration: InputDecoration(labelText: tr('original_price'), errorText: errors['prodPrice']),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _prodNewPrice,
              decoration: InputDecoration(labelText: tr('new_price')),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(type: FileType.image, withData: true);
                if (result != null && result.files.single.bytes != null) {
                  setState(() {
                    _pickedImageBytes = result.files.single.bytes;
                    _pickedImageFileName = result.files.single.name;
                  });
                }
              },
              icon: const Icon(Icons.upload_file),
              label: Text(tr('upload_image')),
            ),
            if (errors['prodImage'] != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(errors['prodImage']!, style: const TextStyle(color: Colors.red, fontSize: 12)),
              ),
            if (_pickedImageBytes != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.memory(_pickedImageBytes!, height: 150),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _pickedImageBytes = null;
                                _pickedImageFileName = null;
                              });
                            },
                            child: Container(
                              decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                              child: const Icon(Icons.close, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: DropdownButtonFormField<int>(
                initialValue: selectedCategoryId,
                decoration: InputDecoration(
                  labelText: tr('select_category'),
                  errorText: errors['category'],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                items: categories
                    .map((c) => DropdownMenuItem<int>(
                  value: c['id'],
                  child: Text(c['name']),
                ))
                    .toList(),
                onChanged: (value) => setState(() => selectedCategoryId = value),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: _createProduct,
                      child: Text(tr('create_product_btn'))),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => EditProductScreen()),
                      );
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text("Edit Products"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  ),
                ),
              ],
            ),
            const Divider(height: 32),

            Text(tr('create_coupon'), style: const TextStyle(fontWeight: FontWeight.bold)),
            TextField(controller: _couponCode, decoration: InputDecoration(labelText: tr('code'), errorText: errors['couponCode'])),
            TextField(controller: _couponPct, decoration: InputDecoration(labelText: tr('discount'), errorText: errors['couponPct'])),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: _createCoupon, child: Text(tr('create_coupon_btn'))),
          ],
        ),
      ),
    );
  }
}
