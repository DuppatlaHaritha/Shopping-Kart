/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  @override State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: _user, decoration: InputDecoration(labelText: 'Username')),
          TextField(controller: _pass, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
          SizedBox(height: 16),
          _loading ? CircularProgressIndicator() : ElevatedButton(
            onPressed: () async {
              setState((){_loading=true;});
              final ok = await auth.login(_user.text.trim(), _pass.text);
              setState((){_loading=false;});
              if (ok) {
                Navigator.pushReplacementNamed(context, '/');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed')));
              }
            },
            child: Text('Login')
          ),
          TextButton(onPressed: (){ Navigator.pushNamed(context, '/register'); }, child: Text('Register'))
        ]),
      ),
    );
  }
}*/


/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool _loading = false;

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _user,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _pass,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            _loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () async {
                final username = _user.text.trim();
                final password = _pass.text;

                if (username.isEmpty || password.isEmpty) {
                  _showMessage('Please enter username and password');
                  return;
                }

                setState(() {
                  _loading = true;
                });

                try {
                  final ok = await auth.login(username, password);
                  setState(() {
                    _loading = false;
                  });

                  if (ok) {
                    _showMessage('✅ Login successful');
                    Navigator.pushReplacementNamed(context, '/products');
                  } else {
                    _showMessage('❌ Invalid username or password');
                  }
                } catch (e) {
                  setState(() {
                    _loading = false;
                  });
                  _showMessage('Error: $e');
                }
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Register'),
            )
          ],
        ),
      ),
    );
  }
}



 */

/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool _loading = false;

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _user,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _pass,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            _loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () async {
                final username = _user.text.trim();
                final password = _pass.text;

                if (username.isEmpty || password.isEmpty) {
                  _showMessage('Please enter username and password');
                  return;
                }

                setState(() {
                  _loading = true;
                });

                try {
                  final ok = await auth.login(username, password);
                  setState(() {
                    _loading = false;
                  });

                  if (ok) {
                    _showMessage('✅ Login successful');
                    // Navigate to CategoryScreen after login
                    Navigator.pushReplacementNamed(context, '/products');
                  } else {
                    _showMessage('❌ Invalid username or password');
                  }
                } catch (e) {
                  setState(() {
                    _loading = false;
                  });
                  _showMessage('Error: $e');
                }
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Register'),
            )
          ],
        ),
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool _loading = false;

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  final List<String> adImages = [
    'assets/ads/karthika masam ad.jpeg',
    'assets/ads/marriage kit ad.jpeg',
    'assets/ads/navami ad.png',
    'assets/ads/new year ad.jpeg',
    'assets/ads/tulasi pooja ad.png',
    'assets/ads/ugadi ad.png',
  ];

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      // ✅ AppBar with logo before Login text
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/pooja_kart_logo.jpeg', // <-- Your logo path
              height: 35,
            ),
            const SizedBox(width: 10),
            const Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // ✅ Carousel Section
              CarouselSlider(
                items: adImages.map((img) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      height: 180, // Fixed height for all images
                      color: Colors.white,
                      child: FittedBox(
                        fit: BoxFit.contain, // Show full image without cutting
                        child: Image.asset(img),
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 180, // Same height as container
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.9,
                ),
              ),
              const SizedBox(height: 20),

              // ✅ Welcome Message
              const Text(
                'Welcome to Pooja Kart',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // ✅ Login Form
              TextField(
                controller: _user,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: _pass,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              _loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () async {
                  final username = _user.text.trim();
                  final password = _pass.text;

                  if (username.isEmpty || password.isEmpty) {
                    _showMessage('Please enter username and password');
                    return;
                  }

                  setState(() {
                    _loading = true;
                  });

                  try {
                    final ok = await auth.login(username, password);
                    setState(() {
                      _loading = false;
                    });

                    if (ok) {
                      _showMessage('✅ Login successful');
                      Navigator.pushReplacementNamed(
                          context, '/products');
                    } else {
                      _showMessage('❌ Invalid username or password');
                    }
                  } catch (e) {
                    setState(() {
                      _loading = false;
                    });
                    _showMessage('Error: $e');
                  }
                },
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text('Register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}*/

//23-10-2025


//27-10-2025
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool _loading = false;
  int _currentIndex = 0;

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  final List<String> adImages = [
    'assets/ads/karthika masam ad.jpeg',
    'assets/ads/marriage kit ad.jpeg',
    'assets/ads/navami ad.png',
    'assets/ads/new year ad.jpeg',
    'assets/ads/tulasi pooja ad.png',
    'assets/ads/ugadi ad.png',
    'assets/ads/sankranti_ad.jpeg',
    'assets/ads/new_year_calendar_ad.jpeg',
    'assets/ads/rakhi ad.png',
  ];

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/pooja_kart_logo.jpeg',
              height: 35,
            ),
            const SizedBox(width: 10),
            const Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // ✅ Carousel Section with curved image edges
              CarouselSlider(
                items: adImages.map((img) {
                  return Container(
                    width: double.infinity,
                    height: 180,
                    // Key change: Use BoxDecoration to enforce border radius and contain the image
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18), // Small curve
                      color: Colors.grey[100], // Background color
                      image: DecorationImage(
                        image: AssetImage(img),
                        // BoxFit.contain ensures the ENTIRE image is visible (no crop)
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),

              const SizedBox(height: 8),

              // ✅ Dots indicator for ads
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: adImages.asMap().entries.map((entry) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              // ✅ Welcome Message (same color as Login text)
              Text(
                'Welcome to Pooja-Kart',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).appBarTheme.titleTextStyle?.color ??
                      Colors.black,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              // ✅ Login Form
              TextField(
                controller: _user,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: _pass,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16),

              _loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () async {
                  final username = _user.text.trim();
                  final password = _pass.text;

                  if (username.isEmpty || password.isEmpty) {
                    _showMessage('Please enter username and password');
                    return;
                  }

                  setState(() {
                    _loading = true;
                  });

                  try {
                    final ok = await auth.login(username, password);
                    setState(() {
                      _loading = false;
                    });

                    if (ok) {
                      _showMessage('✅ Login successful');
                      Navigator.pushReplacementNamed(context, '/products');
                    } else {
                      _showMessage('❌ Invalid username or password');
                    }
                  } catch (e) {
                    setState(() {
                      _loading = false;
                    });
                    _showMessage('Error: $e');
                  }
                },
                child: const Text('Login'),
              ),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../providers/auth_provider.dart';
import '../services/api_service.dart'; // Assuming you have ApiService for HTTP calls

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _newPass = TextEditingController(); // for reset
  bool _loading = false;
  bool _showReset = false; // show reset form if account locked
  int _currentIndex = 0;

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  final List<String> adImages = [
    'assets/ads/karthika masam ad.jpeg',
    'assets/ads/marriage kit ad.jpeg',
    'assets/ads/navami ad.png',
    'assets/ads/new year ad.jpeg',
    'assets/ads/tulasi pooja ad.png',
    'assets/ads/ugadi ad.png',
    'assets/ads/sankranti_ad.jpeg',
    'assets/ads/new_year_calendar_ad.jpeg',
    'assets/ads/rakhi ad.png',
  ];

  Future<void> _handleLogin() async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final username = _user.text.trim();
    final password = _pass.text;

    if (username.isEmpty || password.isEmpty) {
      _showMessage('Please enter username and password');
      return;
    }

    setState(() => _loading = true);

    try {
      final ok = await auth.login(username, password);
      setState(() => _loading = false);

      if (ok) {
        _showMessage('✅ Login successful');
        Navigator.pushReplacementNamed(context, '/products');
      } else {
        _showMessage('❌ Invalid username or password');
      }
    } catch (e) {
      setState(() => _loading = false);

      // ✅ Check backend message
      final err = e.toString();
      if (err.contains('Account locked')) {
        setState(() => _showReset = true);
        _showMessage('⚠️ Account locked. Please reset your password.');
      } else if (err.contains('Invalid credentials')) {
        _showMessage('❌ Invalid credentials. Please try again.');
      } else {
        _showMessage('Error: $err');
      }
    }
  }

  Future<void> _resetPassword() async {
    final username = _user.text.trim();
    final newPass = _newPass.text;

    if (username.isEmpty || newPass.isEmpty) {
      _showMessage('Enter username and new password');
      return;
    }

    setState(() => _loading = true);

    try {
      final response = await ApiService.post('/auth/reset-password', {
        'username': username,
        'newPassword': newPass,
      });

      setState(() {
        _loading = false;
        _showReset = false;
      });

      _showMessage(response['message'] ?? 'Password reset successful');
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('Error resetting password: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/pooja_kart_logo.jpeg', height: 35),
            const SizedBox(width: 10),
            const Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // ✅ Carousel Section
              CarouselSlider(
                items: adImages.map((img) {
                  return Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.grey[100],
                      image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() => _currentIndex = index);
                  },
                ),
              ),
              const SizedBox(height: 8),

              // ✅ Dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: adImages.asMap().entries.map((entry) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              Text(
                'Welcome to Pooja-Kart',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).appBarTheme.titleTextStyle?.color ??
                      Colors.black,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              // ✅ Login Fields
              TextField(
                controller: _user,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: _pass,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),

              const SizedBox(height: 16),

              if (_loading) const CircularProgressIndicator() else ...[
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Register'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() => _showReset = true);
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],

              // ✅ Reset Password Section (appears only if locked)
              if (_showReset) ...[
                const Divider(height: 30, color: Colors.grey),
                const Text(
                  'Reset Password',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _newPass,
                  decoration:
                  const InputDecoration(labelText: 'Enter new password'),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _resetPassword,
                  child: const Text('Reset Password'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../providers/auth_provider.dart';
import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  bool _loading = false;
  bool _showReset = false;
  int _currentIndex = 0;

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  final List<String> adImages = [
    'assets/ads/karthika masam ad.jpeg',
    'assets/ads/marriage kit ad.jpeg',
    'assets/ads/navami ad.png',
    'assets/ads/new year ad.jpeg',
    'assets/ads/tulasi pooja ad.png',
    'assets/ads/ugadi ad.png',
    'assets/ads/sankranti_ad.jpeg',
    'assets/ads/new_year_calendar_ad.jpeg',
    'assets/ads/rakhi ad.png',
  ];

  Future<void> _handleLogin() async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final username = _user.text.trim();
    final password = _pass.text;

    if (username.isEmpty || password.isEmpty) {
      _showMessage('Please enter username and password');
      return;
    }

    setState(() => _loading = true);

    try {
      final ok = await auth.login(username, password);
      setState(() => _loading = false);

      if (ok) {
        _showMessage('✅ Login successful');
        Navigator.pushReplacementNamed(context, '/products');
      } else {
        _showMessage('❌ Invalid username or password');
      }
    } catch (e) {
      setState(() => _loading = false);
      final err = e.toString();

      if (err.contains('Account locked')) {
        setState(() => _showReset = true);
        _showMessage('⚠️ Account locked. Please reset your password.');
      } else if (err.contains('Invalid credentials')) {
        _showMessage('❌ Invalid credentials. Please try again.');
      } else {
        _showMessage('Error: $err');
      }
    }
  }

  Future<void> _resetPassword() async {
    final username = _user.text.trim();
    final newPass = _newPass.text;

    if (username.isEmpty || newPass.isEmpty) {
      _showMessage('Enter username and new password');
      return;
    }

    setState(() => _loading = true);

    try {
      final res = await ApiService.post('/auth/reset-password', {
        'username': username,
        'newPassword': newPass,
      });

      final data = jsonDecode(res.body);
      setState(() {
        _loading = false;
        _showReset = false;
      });

      _showMessage(data['message'] ?? 'Password reset successful');
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('Error resetting password: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/pooja_kart_logo.jpeg', height: 35),
            const SizedBox(width: 10),
            const Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CarouselSlider(
                items: adImages.map((img) {
                  return Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.grey[100],
                      image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() => _currentIndex = index);
                  },
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: adImages.asMap().entries.map((entry) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to Pooja-Kart',
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _user,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: _pass,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              if (_loading)
                const CircularProgressIndicator()
              else ...[
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Register'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() => _showReset = true);
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],
              if (_showReset) ...[
                const Divider(height: 30, color: Colors.grey),
                const Text(
                  'Reset Password',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _newPass,
                  decoration:
                  const InputDecoration(labelText: 'Enter new password'),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _resetPassword,
                  child: const Text('Reset Password'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

*/




/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../providers/auth_provider.dart';
import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  bool _loading = false;
  bool _showReset = false;
  int _currentIndex = 0;

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  final List<String> adImages = [
    'assets/ads/karthika masam ad.jpeg',
    'assets/ads/marriage kit ad.jpeg',
    'assets/ads/navami ad.png',
    'assets/ads/new year ad.jpeg',
    'assets/ads/tulasi pooja ad.png',
    'assets/ads/ugadi ad.png',
    'assets/ads/sankranti_ad.jpeg',
    'assets/ads/new_year_calendar_ad.jpeg',
    'assets/ads/rakhi ad.png',
  ];

  Future<void> _handleLogin() async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final username = _user.text.trim();
    final password = _pass.text;

    if (username.isEmpty || password.isEmpty) {
      _showMessage('Please enter username and password');
      return;
    }

    setState(() => _loading = true);
    print("Sending reset payload: username=$username, password=$password");
    try {
      final ok = await auth.login(username, password); // ✅ returns bool now
      setState(() => _loading = false);

      if (ok) {
        _showMessage('✅ Login successful');
        Navigator.pushReplacementNamed(context, '/products');
      } else {
        _showMessage('❌ Invalid username or password');

      }
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('Error: $e');
    }
  }

  Future<void> _resetPassword() async {
    final username = _user.text.trim();
    final newPass = _newPass.text.trim();

    if (username.isEmpty || newPass.isEmpty) {
      _showMessage('Enter username and new password');
      return;
    }

    setState(() => _loading = true);

    try {
      final res = await ApiService.post('/api/auth/reset-password', {
        'username': username,
        'newPassword': newPass,

      });
      print("Sending reset payload: username=$username, newPassword=$newPass");
      final data = jsonDecode(res.body);
      setState(() {
        _loading = false;
        _showReset = false;
      });

      _showMessage(data['message'] ?? 'Password reset successful');
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('Error resetting password: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/pooja_kart_logo.jpeg.png', height: 35),
            const SizedBox(width: 10),
            const Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CarouselSlider(
                items: adImages.map((img) {
                  return Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.grey[100],
                      image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() => _currentIndex = index);
                  },
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: adImages.asMap().entries.map((entry) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to Pooja-Kart',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _user,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: _pass,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              if (_loading)
                const CircularProgressIndicator()
              else ...[
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Register'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() => _showReset = true);
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],
              if (_showReset) ...[
                const Divider(height: 30, color: Colors.grey),
                const Text(
                  'Reset Password',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _newPass,
                  decoration: const InputDecoration(
                      labelText: 'Enter new password'),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _resetPassword,
                  child: const Text('Reset Password'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
*/



/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../providers/auth_provider.dart';
import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  bool _loading = false;
  bool _showReset = false;
  int _currentIndex = 0;

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  final List<String> adImages = [
    'assets/ads/karthika masam ad.jpeg',
    'assets/ads/marriage kit ad.jpeg',
    'assets/ads/navami ad.png',
    'assets/ads/new year ad.jpeg',
    'assets/ads/tulasi pooja ad.png',
    'assets/ads/ugadi ad.png',
    'assets/ads/sankranti_ad.jpeg',
    'assets/ads/new_year_calendar_ad.jpeg',
    'assets/ads/rakhi ad.png',
  ];

  Future<void> _handleLogin() async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final username = _user.text.trim();
    final password = _pass.text;

    if (username.isEmpty || password.isEmpty) {
      _showMessage('Please enter username and password');
      return;
    }

    setState(() => _loading = true);
    print("Sending reset payload: username=$username, password=$password");
    try {
      final ok = await auth.login(username, password); // ✅ returns bool now
      setState(() => _loading = false);

      if (ok) {
        _showMessage('✅ Login successful');
        Navigator.pushReplacementNamed(context, '/products');
      } else {
        _showMessage('❌ Invalid username or password');
      }
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('Error: $e');
    }
  }

  Future<void> _resetPassword() async {
    final username = _user.text.trim();
    final newPass = _newPass.text.trim();

    if (username.isEmpty || newPass.isEmpty) {
      _showMessage('Enter username and new password');
      return;
    }

    setState(() => _loading = true);

    try {
      final res = await ApiService.post('/api/auth/reset-password', {
        'username': username,
        'newPassword': newPass,
      });
      print("Sending reset payload: username=$username, newPassword=$newPass");
      final data = jsonDecode(res.body);
      setState(() {
        _loading = false;
        _showReset = false;
      });

      _showMessage(data['message'] ?? 'Password reset successful');
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('Error resetting password: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/pooja_kart_logo.jpeg.png', height: 35),
            const SizedBox(width: 10),
            const Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🖼️ Rectangular Carousel Ads (No Border, No Radius)
              CarouselSlider(
                items: adImages.map((img) {
                  return Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() => _currentIndex = index);
                  },
                ),
              ),

              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: adImages.asMap().entries.map((entry) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
              const Text(
                'Welcome to Pooja-Kart',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),
              TextField(
                controller: _user,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: _pass,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16),

              if (_loading)
                const CircularProgressIndicator()
              else ...[
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Register'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() => _showReset = true);
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],

              if (_showReset) ...[
                const Divider(height: 30, color: Colors.grey),
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _newPass,
                  decoration:
                  const InputDecoration(labelText: 'Enter new password'),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _resetPassword,
                  child: const Text('Reset Password'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
*/


/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../providers/auth_provider.dart';
import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  bool _loading = false;
  bool _showReset = false;
  int _currentIndex = 0;

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  final List<String> adImages = [
    'assets/ads/karthika masam ad.jpeg',
    'assets/ads/marriage kit ad.jpeg',
    'assets/ads/navami ad.png',
    'assets/ads/new year ad.jpeg',
    'assets/ads/tulasi pooja ad.png',
    'assets/ads/ugadi ad.png',
    'assets/ads/sankranti_ad.jpeg',
    'assets/ads/new_year_calendar_ad.jpeg',
    'assets/ads/rakhi ad.png',
  ];

  Future<void> _handleLogin() async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final username = _user.text.trim();
    final password = _pass.text;

    if (username.isEmpty || password.isEmpty) {
      _showMessage('Please enter username and password');
      return;
    }

    setState(() => _loading = true);
    print("Sending reset payload: username=$username, password=$password");
    try {
      final ok = await auth.login(username, password);
      setState(() => _loading = false);

      if (ok) {
        _showMessage('✅ Login successful');
        Navigator.pushReplacementNamed(context, '/products');
      } else {
        _showMessage('❌ Invalid username or password');
      }
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('Error: $e');
    }
  }

  Future<void> _resetPassword() async {
    final username = _user.text.trim();
    final newPass = _newPass.text.trim();

    if (username.isEmpty || newPass.isEmpty) {
      _showMessage('Enter username and new password');
      return;
    }

    setState(() => _loading = true);

    try {
      final res = await ApiService.post('/api/auth/reset-password', {
        'username': username,
        'newPassword': newPass,
      });
      print("Sending reset payload: username=$username, newPassword=$newPass");
      final data = jsonDecode(res.body);
      setState(() {
        _loading = false;
        _showReset = false;
      });

      _showMessage(data['message'] ?? 'Password reset successful');
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('Error resetting password: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEB66), // 🍋 Light Lemon Yellow background
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFC107), // 🌟 Rich Gold Login bar
        title: Row(
          children: [
            Image.asset('assets/pooja_kart_logo.jpeg.png', height: 35),
            const SizedBox(width: 10),
            const Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF800000), // Maroon text
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🖼️ Rectangular Carousel Ads
              CarouselSlider(
                items: adImages.map((img) {
                  return Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF176),
                      image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() => _currentIndex = index);
                  },
                ),
              ),

              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: adImages.asMap().entries.map((entry) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
              const Text(
                'Welcome to Pooja-Kart',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF800000), // 🪔 Maroon text
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),
              // 🟨 Username field with rich gold background
              TextField(
                controller: _user,
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: const Color(0xFFFFC107), // Rich Gold
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF800000)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // 🟨 Password field styled similarly
              TextField(
                controller: _pass,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: const Color(0xFFFFC107),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF800000)),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),

              if (_loading)
                const CircularProgressIndicator()
              else ...[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC107), // Gold button
                    foregroundColor: const Color(0xFF800000), // Maroon text
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side:
                      const BorderSide(color: Color(0xFF800000), width: 2),
                    ),
                  ),
                  onPressed: _handleLogin,
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Color(0xFF800000)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() => _showReset = true);
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0xFF800000)),
                  ),
                ),
              ],

              if (_showReset) ...[
                const Divider(height: 30, color: Colors.grey),
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _newPass,
                  decoration: const InputDecoration(
                    labelText: 'Enter new password',
                    filled: true,
                    fillColor: Color(0xFFFFC107),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC107),
                    foregroundColor: const Color(0xFF800000),
                  ),
                  onPressed: _resetPassword,
                  child: const Text('Reset Password'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
*/


/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../providers/auth_provider.dart';
import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  bool _loading = false;
  bool _showReset = false;
  int _currentIndex = 0;

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  final List<String> adImages = [
    'assets/ads/karthika masam ad.jpeg',
    'assets/ads/marriage kit ad.jpeg',
    'assets/ads/navami ad.png',
    'assets/ads/new year ad.jpeg',
    'assets/ads/tulasi pooja ad.png',
    'assets/ads/ugadi ad.png',
    'assets/ads/sankranti_ad.jpeg',
    'assets/ads/new_year_calendar_ad.jpeg',
    'assets/ads/rakhi ad.png',
  ];

  Future<void> _handleLogin() async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final username = _user.text.trim();
    final password = _pass.text;

    if (username.isEmpty || password.isEmpty) {
      _showMessage('Please enter username and password');
      return;
    }

    setState(() => _loading = true);
    print("Sending reset payload: username=$username, password=$password");
    try {
      final ok = await auth.login(username, password); // ✅ returns bool now
      setState(() => _loading = false);

      if (ok) {
        _showMessage('✅ Login successful');
        Navigator.pushReplacementNamed(context, '/products');
      } else {
        _showMessage('❌ Invalid username or password');
      }
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('Error: $e');
    }
  }

  Future<void> _resetPassword() async {
    final username = _user.text.trim();
    final newPass = _newPass.text.trim();

    if (username.isEmpty || newPass.isEmpty) {
      _showMessage('Enter username and new password');
      return;
    }

    setState(() => _loading = true);

    try {
      final res = await ApiService.post('/api/auth/reset-password', {
        'username': username,
        'newPassword': newPass,
      });
      print("Sending reset payload: username=$username, newPassword=$newPass");
      final data = jsonDecode(res.body);
      setState(() {
        _loading = false;
        _showReset = false;
      });

      _showMessage(data['message'] ?? 'Password reset successful');
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('Error resetting password: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/pooja_kart_logo.jpeg.png', height: 35),
            const SizedBox(width: 10),
            const Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🖼️ Rectangular Carousel Ads (No Border, No Radius)
              CarouselSlider(
                items: adImages.map((img) {
                  return Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() => _currentIndex = index);
                  },
                ),
              ),

              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: adImages.asMap().entries.map((entry) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
              const Text(
                'Welcome to Pooja-Kart',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF800000), // 🟤 Changed to Maroon
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),
              TextField(
                controller: _user,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: _pass,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16),

              if (_loading)
                const CircularProgressIndicator()
              else ...[
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Register'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() => _showReset = true);
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],

              if (_showReset) ...[
                const Divider(height: 30, color: Colors.grey),
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _newPass,
                  decoration:
                  const InputDecoration(labelText: 'Enter new password'),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _resetPassword,
                  child: const Text('Reset Password'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../providers/auth_provider.dart';
import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  bool _loading = false;
  bool _showReset = false;
  int _currentIndex = 0;

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  final List<String> adImages = [
    'assets/ads/karthika masam ad.jpeg',
    'assets/ads/marriage kit ad.jpeg',
    'assets/ads/navami ad.png',
    'assets/ads/new year ad.jpeg',
    'assets/ads/tulasi pooja ad.png',
    'assets/ads/ugadi ad.png',
    'assets/ads/sankranti_ad.jpeg',
    'assets/ads/new_year_calendar_ad.jpeg',
    'assets/ads/rakhi ad.png',
  ];

  Future<void> _handleLogin() async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final username = _user.text.trim();
    final password = _pass.text;

    if (username.isEmpty || password.isEmpty) {
      _showMessage('Please enter username and password');
      return;
    }

    setState(() => _loading = true);
    print("Sending login payload: username=$username, password=$password");
    try {
      final ok = await auth.login(username, password);
      setState(() => _loading = false);

      if (ok) {
        _showMessage('✅ Login successful');
        // ✅ Navigate to MainNavigation after login
        Navigator.pushReplacementNamed(context, '/main');
      } else {
        _showMessage('❌ Invalid username or password');
      }
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('Error: $e');
    }
  }

  Future<void> _resetPassword() async {
    final username = _user.text.trim();
    final newPass = _newPass.text.trim();

    if (username.isEmpty || newPass.isEmpty) {
      _showMessage('Enter username and new password');
      return;
    }

    setState(() => _loading = true);

    try {
      final res = await ApiService.post('/api/auth/reset-password', {
        'username': username,
        'newPassword': newPass,
      });
      print("Sending reset payload: username=$username, newPassword=$newPass");
      final data = jsonDecode(res.body);
      setState(() {
        _loading = false;
        _showReset = false;
      });

      _showMessage(data['message'] ?? 'Password reset successful');
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('Error resetting password: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/pooja_kart_logo.jpeg.png', height: 35),
            const SizedBox(width: 10),
            const Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🖼️ Rectangular Carousel Ads (No Border, No Radius)
              CarouselSlider(
                items: adImages.map((img) {
                  return Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() => _currentIndex = index);
                  },
                ),
              ),

              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: adImages.asMap().entries.map((entry) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
              const Text(
                'Welcome to Pooja-Kart',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF800000), // 🟤 Maroon color for text
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),
              TextField(
                controller: _user,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: _pass,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16),

              if (_loading)
                const CircularProgressIndicator()
              else ...[
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Register'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() => _showReset = true);
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],

              if (_showReset) ...[
                const Divider(height: 30, color: Colors.grey),
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _newPass,
                  decoration:
                  const InputDecoration(labelText: 'Enter new password'),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _resetPassword,
                  child: const Text('Reset Password'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
*/



/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/auth_provider.dart';
import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  bool _loading = false;
  bool _showReset = false;
  int _currentIndex = 0;

  String? _selectedLang;

  // 🌍 Supported Languages
  final Map<String, String> _languages = {
    'en': 'English',
    'hi': 'Hindi',
    'te': 'Telugu',
    'kn': 'Kannada',
    'ml': 'Malayalam',
    'ta': 'Tamil',
    'bn': 'Bengali',
    'mr': 'Marathi',
    'gu': 'Gujarati',
    'pa': 'Punjabi',
    'ur': 'Urdu',
    'or': 'Odia',
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedLang = context.locale.languageCode;
  }

  // 🌐 Save selected locale persistently
  Future<void> _saveLocale(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_locale', code);
  }

  // 🧠 Handle language change
  Future<void> _changeLanguage(String code) async {
    await context.setLocale(Locale(code));
    await _saveLocale(code);
    setState(() => _selectedLang = code);
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  final List<String> adImages = [
    'assets/ads/karthika masam ad.jpeg',
    'assets/ads/marriage kit ad.jpeg',
    'assets/ads/navami ad.png',
    'assets/ads/new year ad.jpeg',
    'assets/ads/tulasi pooja ad.png',
    'assets/ads/ugadi ad.png',
    'assets/ads/sankranti_ad.jpeg',
    'assets/ads/new_year_calendar_ad.jpeg',
    'assets/ads/rakhi ad.png',
  ];

  Future<void> _handleLogin() async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final username = _user.text.trim();
    final password = _pass.text;

    if (username.isEmpty || password.isEmpty) {
      _showMessage(tr('enter_username_password'));
      return;
    }

    setState(() => _loading = true);
    print("Sending login payload: username=$username, password=$password");
    try {
      final ok = await auth.login(username, password);
      setState(() => _loading = false);

      if (ok) {
        _showMessage(tr('login_success'));
        Navigator.pushReplacementNamed(context, '/main');
      } else {
        _showMessage(tr('invalid_credentials'));
      }
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('${tr('error')}: $e');
    }
  }

  Future<void> _resetPassword() async {
    final username = _user.text.trim();
    final newPass = _newPass.text.trim();

    if (username.isEmpty || newPass.isEmpty) {
      _showMessage(tr('enter_username_newpass'));
      return;
    }

    setState(() => _loading = true);

    try {
      final res = await ApiService.post('/api/auth/reset-password', {
        'username': username,
        'newPassword': newPass,
      });
      print("Sending reset payload: username=$username, newPassword=$newPass");
      final data = jsonDecode(res.body);
      setState(() {
        _loading = false;
        _showReset = false;
      });

      _showMessage(data['message'] ?? tr('reset_success'));
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('${tr('reset_error')}: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/pooja_kart_logo.jpeg.png', height: 35),
            const SizedBox(width: 10),
            Text(
              tr('login_title'),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          // 🌍 Language Dropdown in AppBar
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedLang,
              icon: const Icon(Icons.language, color: Colors.white),
              dropdownColor: Colors.white,
              items: _languages.entries.map((entry) {
                return DropdownMenuItem<String>(
                  value: entry.key,
                  child: Text(entry.value),
                );
              }).toList(),
              onChanged: (String? newLang) {
                if (newLang != null) {
                  _changeLanguage(newLang);
                }
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🖼️ Rectangular Carousel Ads
              CarouselSlider(
                items: adImages.map((img) {
                  return Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() => _currentIndex = index);
                  },
                ),
              ),

              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: adImages.asMap().entries.map((entry) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
              Text(
                tr('welcome_title'),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF800000),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),
              TextField(
                controller: _user,
                decoration: InputDecoration(labelText: tr('username')),
              ),
              TextField(
                controller: _pass,
                decoration: InputDecoration(labelText: tr('password')),
                obscureText: true,
              ),
              const SizedBox(height: 16),

              if (_loading)
                const CircularProgressIndicator()
              else ...[
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: Text(tr('login_button')),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(tr('register_button')),
                ),
                TextButton(
                  onPressed: () {
                    setState(() => _showReset = true);
                  },
                  child: Text(tr('forgot_password')),
                ),
              ],

              if (_showReset) ...[
                const Divider(height: 30, color: Colors.grey),
                Text(
                  tr('reset_password'),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _newPass,
                  decoration:
                  InputDecoration(labelText: tr('enter_new_password')),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _resetPassword,
                  child: Text(tr('reset_button')),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import '../providers/auth_provider.dart';
import '../services/api_service.dart';

// 🌍 Global variable to store logged-in mobile number
String? loggedInMobileNumber;

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  bool _loading = false;
  bool _showReset = false;
  int _currentIndex = 0;

  String? _selectedLang;

  // 🌍 Supported Languages
  final Map<String, String> _languages = {
    'en': 'English',
    'hi': 'Hindi',
    'te': 'Telugu',
    'kn': 'Kannada',
    'ml': 'Malayalam',
    'ta': 'Tamil',
    'bn': 'Bengali',
    'mr': 'Marathi',
    'gu': 'Gujarati',
    'pa': 'Punjabi',
    'ur': 'Urdu',
    'or': 'Odia',
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedLang = context.locale.languageCode;
  }

  // 🌐 Save selected locale persistently
  Future<void> _saveLocale(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_locale', code);
  }

  // 🧠 Handle language change
  Future<void> _changeLanguage(String code) async {
    await context.setLocale(Locale(code));
    await _saveLocale(code);
    setState(() => _selectedLang = code);
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  final List<String> adImages = [
    'assets/ads/karthika masam ad.jpeg',
    'assets/ads/marriage kit ad.jpeg',
    'assets/ads/navami ad.png',
    'assets/ads/new year ad.jpeg',
    'assets/ads/tulasi pooja ad.png',
    'assets/ads/ugadi ad.png',
    'assets/ads/sankranti_ad.jpeg',
    'assets/ads/new_year_calendar_ad.jpeg',
    'assets/ads/rakhi ad.png',
  ];

  Future<void> _handleLogin() async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final mobile = _user.text.trim();
    final password = _pass.text;

    if (mobile.isEmpty || password.isEmpty) {
      _showMessage(tr('enter_username_password'));
      return;
    }

    if (mobile.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(mobile)) {
      _showMessage('Please enter a valid 10-digit mobile number');
      return;
    }

    setState(() => _loading = true);
    print("Sending login payload: mobile=$mobile, password=$password");
    try {
      final ok = await auth.login(mobile, password);
      setState(() => _loading = false);

      if (ok) {
        loggedInMobileNumber = mobile; // ✅ Store globally
        _showMessage(tr('login_success'));
        Navigator.pushReplacementNamed(context, '/main');
      } else {
        _showMessage(tr('invalid_credentials'));
      }
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('${tr('error')}: $e');
    }
  }

  Future<void> _resetPassword() async {
    final mobile = _user.text.trim();
    final newPass = _newPass.text.trim();

    if (mobile.isEmpty || newPass.isEmpty) {
      _showMessage(tr('enter_username_newpass'));
      return;
    }

    if (mobile.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(mobile)) {
      _showMessage('Please enter a valid 10-digit mobile number');
      return;
    }

    setState(() => _loading = true);

    try {
      final res = await ApiService.post('/api/auth/reset-password', {
        'username': mobile,
        'newPassword': newPass,
      });
      print("Sending reset payload: mobile=$mobile, newPassword=$newPass");
      final data = jsonDecode(res.body);
      setState(() {
        _loading = false;
        _showReset = false;
      });

      _showMessage(data['message'] ?? tr('reset_success'));
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('${tr('reset_error')}: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/pooja_kart_logo.jpeg.png', height: 35),
            const SizedBox(width: 10),
            Text(
              tr('login_title'),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          // 🌍 Language Dropdown in AppBar
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedLang,
              icon: const Icon(Icons.language, color: Colors.white),
              dropdownColor: Colors.white,
              items: _languages.entries.map((entry) {
                return DropdownMenuItem<String>(
                  value: entry.key,
                  child: Text(entry.value),
                );
              }).toList(),
              onChanged: (String? newLang) {
                if (newLang != null) {
                  _changeLanguage(newLang);
                }
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🖼️ Rectangular Carousel Ads
              CarouselSlider(
                items: adImages.map((img) {
                  return Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() => _currentIndex = index);
                  },
                ),
              ),

              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: adImages.asMap().entries.map((entry) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
              Text(
                tr('welcome_title'),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF800000),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),
              // 📱 Mobile number input field
              TextField(
                controller: _user,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),

              TextField(
                controller: _pass,
                decoration: InputDecoration(labelText: tr('password')),
                obscureText: true,
              ),
              const SizedBox(height: 16),

              if (_loading)
                const CircularProgressIndicator()
              else ...[
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: Text(tr('login_button')),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(tr('register_button')),
                ),
                TextButton(
                  onPressed: () {
                    setState(() => _showReset = true);
                  },
                  child: Text(tr('forgot_password')),
                ),
              ],

              if (_showReset) ...[
                const Divider(height: 30, color: Colors.grey),
                Text(
                  tr('reset_password'),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _newPass,
                  decoration:
                  InputDecoration(labelText: tr('enter_new_password')),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _resetPassword,
                  child: Text(tr('reset_button')),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
*/

/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import '../providers/auth_provider.dart';
import '../services/api_service.dart';

// 🌍 Global variable to store logged-in mobile number
String? loggedInMobileNumber;

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  bool _loading = false;
  bool _showReset = false;
  bool _isPasswordVisible = false; // 👁 Password visibility toggle
  int _currentIndex = 0;

  String? _selectedLang;

  // 🌍 Supported Languages
  final Map<String, String> _languages = {
    'en': 'English',
    'hi': 'Hindi',
    'te': 'Telugu',
    'kn': 'Kannada',
    'ml': 'Malayalam',
    'ta': 'Tamil',
    'bn': 'Bengali',
    'mr': 'Marathi',
    'gu': 'Gujarati',
    'pa': 'Punjabi',
    'ur': 'Urdu',
    'or': 'Odia',
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedLang = context.locale.languageCode;
  }

  // 🌐 Save selected locale persistently
  Future<void> _saveLocale(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_locale', code);
  }

  // 🧠 Handle language change
  Future<void> _changeLanguage(String code) async {
    await context.setLocale(Locale(code));
    await _saveLocale(code);
    setState(() => _selectedLang = code);
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  final List<String> adImages = [
    'assets/ads/karthika masam ad.jpeg',
    'assets/ads/marriage kit ad.jpeg',
    'assets/ads/navami ad.png',
    'assets/ads/new year ad.jpeg',
    'assets/ads/tulasi pooja ad.png',
    'assets/ads/ugadi ad.png',
    'assets/ads/sankranti_ad.jpeg',
    'assets/ads/new_year_calendar_ad.jpeg',
    'assets/ads/rakhi ad.png',
  ];

  Future<void> _handleLogin() async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final mobile = _user.text.trim();
    final password = _pass.text;

    if (mobile.isEmpty || password.isEmpty) {
      _showMessage(tr('enter_username_password'));
      return;
    }

    if (mobile.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(mobile)) {
      _showMessage('Please enter a valid 10-digit mobile number');
      return;
    }

    setState(() => _loading = true);
    print("Sending login payload: mobile=$mobile, password=$password");
    try {
      final ok = await auth.login(mobile, password);
      setState(() => _loading = false);

      if (ok) {
        loggedInMobileNumber = mobile; // ✅ Store globally
        _showMessage(tr('login_success'));
        Navigator.pushReplacementNamed(context, '/main');
      } else {
        _showMessage(tr('invalid_credentials'));
      }
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('${tr('error')}: $e');
    }
  }

  Future<void> _resetPassword() async {
    final mobile = _user.text.trim();
    final newPass = _newPass.text.trim();

    if (mobile.isEmpty || newPass.isEmpty) {
      _showMessage(tr('enter_username_newpass'));
      return;
    }

    if (mobile.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(mobile)) {
      _showMessage('Please enter a valid 10-digit mobile number');
      return;
    }

    setState(() => _loading = true);

    try {
      final res = await ApiService.post('/api/auth/reset-password', {
        'username': mobile,
        'newPassword': newPass,
      });
      print("Sending reset payload: mobile=$mobile, newPassword=$newPass");
      final data = jsonDecode(res.body);
      setState(() {
        _loading = false;
        _showReset = false;
      });

      _showMessage(data['message'] ?? tr('reset_success'));
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('${tr('reset_error')}: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/pooja_kart_logo.jpeg.png', height: 35),
            const SizedBox(width: 10),
            Text(
              tr('login_title'),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          // 🌍 Language Dropdown in AppBar
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedLang,
              icon: const Icon(Icons.language, color: Colors.white),
              dropdownColor: Colors.white,
              items: _languages.entries.map((entry) {
                return DropdownMenuItem<String>(
                  value: entry.key,
                  child: Text(entry.value),
                );
              }).toList(),
              onChanged: (String? newLang) {
                if (newLang != null) {
                  _changeLanguage(newLang);
                }
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🖼️ Rectangular Carousel Ads
              CarouselSlider(
                items: adImages.map((img) {
                  return Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() => _currentIndex = index);
                  },
                ),
              ),

              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: adImages.asMap().entries.map((entry) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
              Text(
                tr('welcome_title'),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF800000),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              // 📱 Mobile number input field
              TextField(
                controller: _user,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),

              const SizedBox(height: 16),

              // 🔒 Password with Show/Hide Toggle
              TextField(
                controller: _pass,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: tr('password'),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              if (_loading)
                const CircularProgressIndicator()
              else ...[
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: Text(tr('login_button')),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(tr('register_button')),
                ),
                TextButton(
                  onPressed: () {
                    setState(() => _showReset = true);
                  },
                  child: Text(tr('forgot_password')),
                ),
              ],

              if (_showReset) ...[
                const Divider(height: 30, color: Colors.grey),
                Text(
                  tr('reset_password'),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _newPass,
                  decoration:
                  InputDecoration(labelText: tr('enter_new_password')),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _resetPassword,
                  child: Text(tr('reset_button')),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
*/




import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import '../providers/auth_provider.dart';
import '../services/api_service.dart';

// 🌍 Global variable to store logged-in mobile number
String? loggedInMobileNumber;

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  bool _loading = false;
  bool _showReset = false;
  bool _isPasswordVisible = false; // 👁 Password visibility toggle
  int _currentIndex = 0;

  String? _selectedLang;

  // 🌍 Supported Languages
  final Map<String, String> _languages = {
    'en': 'English',
    'hi': 'Hindi',
    'te': 'Telugu',
    'kn': 'Kannada',
    'ml': 'Malayalam',
    'ta': 'Tamil',
    'bn': 'Bengali',
    'mr': 'Marathi',
    'gu': 'Gujarati',
    'pa': 'Punjabi',
    'ur': 'Urdu',
    'or': 'Odia',
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedLang = context.locale.languageCode;
  }

  // 🌐 Save selected locale persistently
  Future<void> _saveLocale(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_locale', code);
  }

  // 🧠 Handle language change
  Future<void> _changeLanguage(String code) async {
    await context.setLocale(Locale(code));
    await _saveLocale(code);
    setState(() => _selectedLang = code);
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  final List<String> adImages = [
    'assets/ads/karthika masam ad.jpeg',
    'assets/ads/marriage kit ad.jpeg',
    'assets/ads/navami ad.png',
    'assets/ads/new year ad.jpeg',
    'assets/ads/tulasi pooja ad.png',
    'assets/ads/ugadi ad.png',
    'assets/ads/sankranti_ad.jpeg',
    'assets/ads/new_year_calendar_ad.jpeg',
    'assets/ads/rakhi ad.png',
  ];

  Future<void> _handleLogin() async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final mobile = _user.text.trim();
    final password = _pass.text;

    if (mobile.isEmpty || password.isEmpty) {
      _showMessage(tr('enter_username_password'));
      return;
    }

    if (mobile.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(mobile)) {
      _showMessage('Please enter a valid 10-digit mobile number');
      return;
    }

    setState(() => _loading = true);
    print("Sending login payload: mobile=$mobile, password=$password");
    try {
      final ok = await auth.login(mobile, password);
      setState(() => _loading = false);

      if (ok) {
        loggedInMobileNumber = mobile; // ✅ Store globally
        _showMessage(tr('login_success'));
        Navigator.pushReplacementNamed(context, '/main');
      } else {
        _showMessage(tr('invalid_credentials'));
      }
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('${tr('error')}: $e');
    }
  }

  Future<void> _resetPassword() async {
    final mobile = _user.text.trim();
    final newPass = _newPass.text.trim();

    if (mobile.isEmpty || newPass.isEmpty) {
      _showMessage(tr('enter_username_newpass'));
      return;
    }

    if (mobile.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(mobile)) {
      _showMessage('Please enter a valid 10-digit mobile number');
      return;
    }

    setState(() => _loading = true);

    try {
      final res = await ApiService.post('/api/auth/reset-password', {
        'username': mobile,
        'newPassword': newPass,
      });
      print("Sending reset payload: mobile=$mobile, newPassword=$newPass");
      final data = jsonDecode(res.body);
      setState(() {
        _loading = false;
        _showReset = false;
      });

      _showMessage(data['message'] ?? tr('reset_success'));
    } catch (e) {
      setState(() => _loading = false);
      _showMessage('${tr('reset_error')}: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final mobileLabel = tr('Mobile Number'); // ✅ Dynamic translation fetched here

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/pooja_kart_logo.jpeg.png', height: 35),
            const SizedBox(width: 10),
            Text(
              tr('login_title'),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          // 🌍 Language Dropdown in AppBar
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedLang,
              icon: const Icon(Icons.language, color: Colors.white),
              dropdownColor: Colors.white,
              items: _languages.entries.map((entry) {
                return DropdownMenuItem<String>(
                  value: entry.key,
                  child: Text(entry.value),
                );
              }).toList(),
              onChanged: (String? newLang) {
                if (newLang != null) {
                  _changeLanguage(newLang);
                }
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🖼️ Rectangular Carousel Ads
              CarouselSlider(
                items: adImages.map((img) {
                  return Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() => _currentIndex = index);
                  },
                ),
              ),

              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: adImages.asMap().entries.map((entry) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
              Text(
                tr('welcome_title'),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF800000),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              // 📱 Mobile number input field
              TextField(
                controller: _user,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: InputDecoration(
                  labelText: mobileLabel, // ✅ now translated dynamically
                  prefixIcon: const Icon(Icons.phone),
                ),
              ),

              const SizedBox(height: 16),

              // 🔒 Password with Show/Hide Toggle
              TextField(
                controller: _pass,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: tr('password'),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              if (_loading)
                const CircularProgressIndicator()
              else ...[
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: Text(tr('login_button')),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(tr('register_button')),
                ),
                TextButton(
                  onPressed: () {
                    setState(() => _showReset = true);
                  },
                  child: Text(tr('forgot_password')),
                ),
              ],

              if (_showReset) ...[
                const Divider(height: 30, color: Colors.grey),
                Text(
                  tr('reset_password'),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _newPass,
                  decoration:
                  InputDecoration(labelText: tr('enter_new_password')),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _resetPassword,
                  child: Text(tr('reset_button')),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
