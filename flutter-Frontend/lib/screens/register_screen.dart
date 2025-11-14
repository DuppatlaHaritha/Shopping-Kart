/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  @override State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: _user, decoration: InputDecoration(labelText: 'Username')),
          TextField(controller: _pass, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
          SizedBox(height: 16),
          _loading ? CircularProgressIndicator() : ElevatedButton(
            onPressed: () async {
              setState((){_loading=true;});
              final ok = await auth.register(_user.text.trim(), _pass.text);
              setState((){_loading=false;});
              if (ok) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registered. Login now.')));
                Navigator.pushReplacementNamed(context, '/login');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration failed')));
              }
            },
            child: Text('Register')
          ),
        ]),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          TextField(
              controller: _user,
              decoration: InputDecoration(labelText: 'Username')),
          TextField(
              controller: _pass,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true),
          SizedBox(height: 16),
          _loading
              ? CircularProgressIndicator()
              : ElevatedButton(
            onPressed: () async {
              setState(() {
                _loading = true;
              });
              final ok =
              await auth.register(_user.text.trim(), _pass.text);
              setState(() {
                _loading = false;
              });
              if (ok) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Registered. Login now.')));
                Navigator.pushReplacementNamed(context, '/login');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Registration failed')));
              }
            },
            child: Text('Register'),
          ),
        ]),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool _loading = false;
  bool _isPasswordVisible = false; // 👁 Toggle state for password visibility

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 📱 Mobile Number Field
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

            // 🔒 Password Field with Show/Hide Icon
            TextField(
              controller: _pass,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
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

            _loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () async {
                final mobile = _user.text.trim();
                final password = _pass.text.trim();

                if (mobile.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                        Text('Please enter mobile number and password')),
                  );
                  return;
                }

                if (mobile.length != 10 ||
                    !RegExp(r'^[0-9]+$').hasMatch(mobile)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Enter a valid 10-digit mobile number')),
                  );
                  return;
                }

                setState(() {
                  _loading = true;
                });

                final ok = await auth.register(mobile, password);

                setState(() {
                  _loading = false;
                });

                if (ok) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registered. Login now.')),
                  );
                  Navigator.pushReplacementNamed(context, '/login');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Registration failed. Try again.')),
                  );
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
