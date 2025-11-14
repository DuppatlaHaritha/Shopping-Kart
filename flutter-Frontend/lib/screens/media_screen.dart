/*
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MediaScreen extends StatefulWidget {
  const MediaScreen({Key? key}) : super(key: key);

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen>
    with SingleTickerProviderStateMixin {
  List<Map<String, String>> _audioLinks = [];
  List<Map<String, String>> _videoLinks = [];
  List<Map<String, String>> _filteredAudio = [];
  List<Map<String, String>> _filteredVideo = [];
  bool _isLoading = true;
  final String baseUrl = "http://localhost:8081/api/media"; // ✅ Backend base URL
  late TabController _tabController;
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fetchMediaData();
  }

  Future<void> _fetchMediaData() async {
    try {
      final audioResponse = await http.get(Uri.parse("$baseUrl/audio"));
      final videoResponse = await http.get(Uri.parse("$baseUrl/video"));

      if (audioResponse.statusCode == 200 && videoResponse.statusCode == 200) {
        final List<dynamic> audioData = json.decode(audioResponse.body);
        final List<dynamic> videoData = json.decode(videoResponse.body);

        setState(() {
          _audioLinks = audioData
              .map((item) => {
            "name": item['name'] as String,
            "link": item['link'] as String,
          })
              .toList();
          _videoLinks = videoData
              .map((item) => {
            "name": item['name'] as String,
            "link": item['link'] as String,
          })
              .toList();

          _filteredAudio = _audioLinks;
          _filteredVideo = _videoLinks;
          _isLoading = false;
        });
      } else {
        throw Exception("Failed to load media links");
      }
    } catch (e) {
      print("Error fetching media links: $e");
      setState(() => _isLoading = false);
    }
  }

  void _filterSearch(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _filteredAudio = _audioLinks
          .where((item) => item['name']!.toLowerCase().contains(_searchQuery))
          .toList();
      _filteredVideo = _videoLinks
          .where((item) => item['name']!.toLowerCase().contains(_searchQuery))
          .toList();
    });
  }

  Future<void> _openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not open $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFF176), // 🌟 Lemon yellow
          titleTextStyle: TextStyle(
            color: Color(0xFF6D1B1B), // 🌹 Maroon text
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Color(0xFF6D1B1B)),
        ),
      ),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Devotional Media'),
            centerTitle: false,
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: MediaSearchDelegate(
                      audioList: _audioLinks,
                      videoList: _videoLinks,
                      onOpenLink: _openLink,
                    ),
                  );
                },
              ),
            ],
            bottom: const TabBar(
              indicatorColor: Color(0xFF6D1B1B),
              labelColor: Color(0xFF6D1B1B),
              tabs: [
                Tab(text: 'Audio'),
                Tab(text: 'Video'),
              ],
            ),
          ),
          body: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : TabBarView(
            controller: _tabController,
            children: [
              _buildMediaList(_filteredAudio, "Listen to devotional songs"),
              _buildMediaList(_filteredVideo, "Watch devotional videos"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMediaList(List<Map<String, String>> items, String subtitleText) {
    if (items.isEmpty) {
      return const Center(child: Text("No media links available"));
    }
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          leading: const Icon(Icons.music_note, color: Color(0xFF6D1B1B)),
          title: Text(
            item['name']!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          subtitle: Text(subtitleText, style: const TextStyle(color: Colors.grey)),
          trailing: const Icon(Icons.open_in_new, color: Colors.grey),
          onTap: () => _openLink(item['link']!),
        );
      },
    );
  }
}

class MediaSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> audioList;
  final List<Map<String, String>> videoList;
  final Function(String) onOpenLink;

  MediaSearchDelegate({
    required this.audioList,
    required this.videoList,
    required this.onOpenLink,
  });

  @override
  String get searchFieldLabel => 'Search media...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = [
      ...audioList.where((item) =>
          item['name']!.toLowerCase().contains(query.toLowerCase())),
      ...videoList.where((item) =>
          item['name']!.toLowerCase().contains(query.toLowerCase())),
    ];

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return ListTile(
          title: Text(item['name']!),
          subtitle: Text(item['link']!),
          onTap: () => onOpenLink(item['link']!),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
*/

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MediaScreen extends StatefulWidget {
  const MediaScreen({Key? key}) : super(key: key);

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen>
    with SingleTickerProviderStateMixin {
  List<Map<String, String>> _audioLinks = [];
  List<Map<String, String>> _videoLinks = [];
  List<Map<String, String>> _filteredAudio = [];
  List<Map<String, String>> _filteredVideo = [];
  bool _isLoading = true;
  final String baseUrl = "http://localhost:8081/api/media"; // ✅ Backend base URL
  late TabController _tabController;
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fetchMediaData();
  }

  Future<void> _fetchMediaData() async {
    try {
      final audioResponse = await http.get(Uri.parse("$baseUrl/audio"));
      final videoResponse = await http.get(Uri.parse("$baseUrl/video"));

      if (audioResponse.statusCode == 200 && videoResponse.statusCode == 200) {
        final List<dynamic> audioData = json.decode(audioResponse.body);
        final List<dynamic> videoData = json.decode(videoResponse.body);

        setState(() {
          _audioLinks = audioData
              .map((item) => {
            "name": item['name'] as String,
            "link": item['link'] as String,
          })
              .toList();
          _videoLinks = videoData
              .map((item) => {
            "name": item['name'] as String,
            "link": item['link'] as String,
          })
              .toList();

          _filteredAudio = _audioLinks;
          _filteredVideo = _videoLinks;
          _isLoading = false;
        });
      } else {
        throw Exception("Failed to load media links");
      }
    } catch (e) {
      print("Error fetching media links: $e");
      setState(() => _isLoading = false);
    }
  }

  void _filterSearch(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _filteredAudio = _audioLinks
          .where((item) => item['name']!.toLowerCase().contains(_searchQuery))
          .toList();
      _filteredVideo = _videoLinks
          .where((item) => item['name']!.toLowerCase().contains(_searchQuery))
          .toList();
    });
  }

  Future<void> _openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not open $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFF176), // 🌟 Lemon yellow
          titleTextStyle: TextStyle(
            color: Color(0xFF6D1B1B), // 🌹 Maroon text
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Color(0xFF6D1B1B)),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Devotional Media'),
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MediaSearchDelegate(
                    audioList: _audioLinks,
                    videoList: _videoLinks,
                    onOpenLink: _openLink,
                  ),
                );
              },
            ),
          ],
          bottom: TabBar(
            controller: _tabController, // ✅ use the same controller
            indicatorColor: const Color(0xFF6D1B1B),
            labelColor: const Color(0xFF6D1B1B),
            tabs: const [
              Tab(text: 'Audio'),
              Tab(text: 'Video'),
            ],
          ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : TabBarView(
          controller: _tabController, // ✅ same controller
          children: [
            _buildMediaList(_filteredAudio, "Listen to devotional songs"),
            _buildMediaList(_filteredVideo, "Watch devotional videos"),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaList(List<Map<String, String>> items, String subtitleText) {
    if (items.isEmpty) {
      return const Center(child: Text("No media links available"));
    }
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          leading: const Icon(Icons.music_note, color: Color(0xFF6D1B1B)),
          title: Text(
            item['name']!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          subtitle:
          Text(subtitleText, style: const TextStyle(color: Colors.grey)),
          trailing: const Icon(Icons.open_in_new, color: Colors.grey),
          onTap: () => _openLink(item['link']!),
        );
      },
    );
  }
}

class MediaSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> audioList;
  final List<Map<String, String>> videoList;
  final Function(String) onOpenLink;

  MediaSearchDelegate({
    required this.audioList,
    required this.videoList,
    required this.onOpenLink,
  });

  @override
  String get searchFieldLabel => 'Search media...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = [
      ...audioList.where((item) =>
          item['name']!.toLowerCase().contains(query.toLowerCase())),
      ...videoList.where((item) =>
          item['name']!.toLowerCase().contains(query.toLowerCase())),
    ];

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return ListTile(
          title: Text(item['name']!),
          subtitle: Text(item['link']!),
          onTap: () => onOpenLink(item['link']!),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
