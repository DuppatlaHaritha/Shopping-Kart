
/*import 'package:flutter/material.dart';
import 'dart:convert';
import '../services/api_service.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  String selectedFilter = 'daily';
  List reports = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchReports();
  }

  Future<void> fetchReports() async {
    setState(() => loading = true);

    try {
      //final res = await ApiService.get('/api/reports/$selectedFilter', withAuth: true);
      final res = await ApiService.get('/api/reports/$selectedFilter', withAuth: true);

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body) as List;

        setState(() {
          reports = data;
          loading = false;
        });
      } else {
        setState(() => loading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load $selectedFilter report (${res.statusCode})'),
          ),
        );
      }
    } catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching $selectedFilter report: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Best Selling Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // 🔽 Filter Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedFilter,
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(value: 'daily', child: Text('Daily Report')),
                    DropdownMenuItem(value: 'weekly', child: Text('Weekly Report')),
                    DropdownMenuItem(value: 'monthly', child: Text('Monthly Report')),
                    DropdownMenuItem(value: 'yearly', child: Text('Yearly Report')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => selectedFilter = value);
                      fetchReports();
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),

            // 📊 Report Data
            Expanded(
              child: loading
                  ? const Center(child: CircularProgressIndicator())
                  : reports.isEmpty
                  ? const Center(
                child: Text(
                  'No sales data found',
                  style: TextStyle(fontSize: 16),
                ),
              )
                  : RefreshIndicator(
                onRefresh: fetchReports,
                child: ListView.builder(
                  itemCount: reports.length,
                  itemBuilder: (context, index) {
                    final item = reports[index];
                    final productName = item['productName'] ?? 'Unknown';
                    final quantity = item['totalQuantity'] ?? 0;

                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.deepOrange.shade100,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(color: Colors.brown),
                          ),
                        ),
                        title: Text(
                          productName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          'Total Sold: $quantity units',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'dart:convert';
import '../services/api_service.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  String selectedFilter = 'daily';
  List reports = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchReports();
  }

  Future<void> fetchReports() async {
    setState(() => loading = true);

    try {
      final res = await ApiService.get('/api/reports/$selectedFilter', withAuth: true);

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body) as List;

        setState(() {
          // Map backend field 'name' to 'productName' for easier usage in UI
          reports = data.map((e) => {
            'id': e['id'],
            'productName': e['name'] ?? 'Unknown Product',
            'totalQuantity': e['totalQuantity'] ?? 0,
          }).toList();

          loading = false;
        });
      } else {
        setState(() => loading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load $selectedFilter report (${res.statusCode})'),
          ),
        );
      }
    } catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching $selectedFilter report: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Best Selling Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // 🔽 Filter Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedFilter,
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(value: 'daily', child: Text('Daily Report')),
                    DropdownMenuItem(value: 'weekly', child: Text('Weekly Report')),
                    DropdownMenuItem(value: 'monthly', child: Text('Monthly Report')),
                    DropdownMenuItem(value: 'yearly', child: Text('Yearly Report')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => selectedFilter = value);
                      fetchReports();
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),

            // 📊 Report Data
            Expanded(
              child: loading
                  ? const Center(child: CircularProgressIndicator())
                  : reports.isEmpty
                  ? const Center(
                child: Text(
                  'No sales data found',
                  style: TextStyle(fontSize: 16),
                ),
              )
                  : RefreshIndicator(
                onRefresh: fetchReports,
                child: ListView.builder(
                  itemCount: reports.length,
                  itemBuilder: (context, index) {
                    final item = reports[index];
                    final productName = item['productName'];
                    final quantity = item['totalQuantity'];

                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.deepOrange.shade100,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(color: Colors.brown),
                          ),
                        ),
                        title: Text(
                          productName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          'Total Sold: $quantity units',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

