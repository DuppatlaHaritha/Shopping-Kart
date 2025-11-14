/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        initialRoute: '/',
        routes: {
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
          '/': (_) => ProductsScreen(),


          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
        },
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/category_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        initialRoute: '/login', // ✅ Start with LoginScreen
        routes: {
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
              '/categories':(_) => CategoryScreen(),
          '/products': (_) => ProductsScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
        },
      ),
    );
  }
}*/


//21-10-2025--testing for theme




//27-10-2025 working before any modifications

/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        debugShowCheckedModeBanner: false,
        initialRoute: '/login', // ✅ Start with LoginScreen

        // 🍋🪔 Lemon Yellow & Red Traditional Theme
        theme: ThemeData(
          // 🍋 Base colors
          primaryColor: const Color(0xFFD32F2F), // Temple red
          scaffoldBackgroundColor: const Color(0xFFFFFDE7), // Very soft lemon background
          hintColor: const Color(0xFF6D1B1B), // Maroon hint text

          // 🎨 Color scheme
          colorScheme: ColorScheme.light(
            primary: const Color(0xFFD32F2F), // Red
            secondary: const Color(0xFFFFF176), // Lemon yellow accent
            background: const Color(0xFFFFFDE7), // Light lemon background
            onPrimary: Colors.white, // Text on red
            onBackground: const Color(0xFF6D1B1B), // Text on yellow
          ),

          // 🕉 Text theme
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF6D1B1B)), // Dark maroon text
            titleMedium: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),

          // 🔘 Buttons
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F), // Red button
              foregroundColor: Colors.white, // White text
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          // 🪔 AppBar
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFFF176), // Lemon yellow AppBar
            titleTextStyle: TextStyle(
              color: Color(0xFF6D1B1B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Color(0xFF6D1B1B)),
          ),

          // 🕯 Input Fields
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFFFFF9C4), // Light lemon fill
            labelStyle: TextStyle(color: Color(0xFF6D1B1B)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD32F2F), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFF176)),
            ),
          ),
        ),

        // 🗺 Routes
        routes: {
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
          '/categories': (_) => CategoryScreen(),
          '/products': (_) => ProductsScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
        },
      ),
    );
  }
}
*/

/*
/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  // ✅ Load user data (token + role) on app start
  Future<void> _initAuth() async {
    final authProvider = AuthProvider();
    await authProvider.loadUserData();
    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      // ✅ Show splash/loading screen briefly
      return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFFFFDE7),
          body: const Center(
            child: CircularProgressIndicator(color: Color(0xFFD32F2F)),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..loadUserData()), // ✅ Load user data here too
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        debugShowCheckedModeBanner: false,
        initialRoute: '/login', // ✅ Start with LoginScreen

        // 🍋🪔 Lemon Yellow & Red Traditional Theme
        theme: ThemeData(
          primaryColor: const Color(0xFFD32F2F),
          scaffoldBackgroundColor: const Color(0xFFFFFDE7),
          hintColor: const Color(0xFF6D1B1B),

          colorScheme: const ColorScheme.light(
            primary: Color(0xFFD32F2F),
            secondary: Color(0xFFFFF176),
            background: Color(0xFFFFFDE7),
            onPrimary: Colors.white,
            onBackground: Color(0xFF6D1B1B),
          ),

          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF6D1B1B)),
            titleMedium: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFFF176),
            titleTextStyle: TextStyle(
              color: Color(0xFF6D1B1B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Color(0xFF6D1B1B)),
          ),

          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFFFFF9C4),
            labelStyle: TextStyle(color: Color(0xFF6D1B1B)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD32F2F), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFF176)),
            ),
          ),
        ),

        // 🗺 Routes
        routes: {
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
          '/categories': (_) => CategoryScreen(),
          '/products': (_) => ProductsScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
        },
      ),
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  // ✅ Load user data (token + role) on app start
  Future<void> _initAuth() async {
    final authProvider = AuthProvider();
    await authProvider.loadUserData();
    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      // ✅ Show splash/loading screen briefly
      return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFFFFDE7),
          body: const Center(
            child: CircularProgressIndicator(color: Color(0xFFD32F2F)),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..loadUserData()), // ✅ Load user data here too
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        debugShowCheckedModeBanner: false,
        initialRoute: '/login', // ✅ Start with LoginScreen

        // 🍋🪔 Lemon Yellow & Red Traditional Theme
        theme: ThemeData(
          primaryColor: const Color(0xFFD32F2F),
          scaffoldBackgroundColor: const Color(0xFFFFFDE7),
          hintColor: const Color(0xFF6D1B1B),

          colorScheme: const ColorScheme.light(
            primary: Color(0xFFD32F2F),
            secondary: Color(0xFFFFF176),
            background: Color(0xFFFFFDE7),
            onPrimary: Colors.white,
            onBackground: Color(0xFF6D1B1B),
          ),

          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF6D1B1B)),
            titleMedium: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFFF176),
            titleTextStyle: TextStyle(
              color: Color(0xFF6D1B1B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Color(0xFF6D1B1B)),
          ),

          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFFFFF9C4),
            labelStyle: TextStyle(color: Color(0xFF6D1B1B)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD32F2F), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFF176)),
            ),
          ),
        ),

        // 🗺 Routes
        routes: {
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
          '/categories': (_) => CategoryScreen(),
          '/products': (_) => ProductsScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
        },
      ),
    );
  }
}
*/


 */

*/
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  // ✅ Load user data (token + role) on app start
  Future<void> _initAuth() async {
    final authProvider = AuthProvider();
    await authProvider.loadUserData();
    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      // ✅ Splash / Loading screen during initialization
      return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFFFFDE7),
          body: const Center(
            child: CircularProgressIndicator(color: Color(0xFFD32F2F)),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..loadUserData()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',

        // 🍋🪔 Lemon Yellow & Red Traditional Theme
        theme: ThemeData(
          primaryColor: const Color(0xFFD32F2F),
          scaffoldBackgroundColor: const Color(0xFFFFFDE7),
          hintColor: const Color(0xFF6D1B1B),

          colorScheme: const ColorScheme.light(
            primary: Color(0xFFD32F2F),
            secondary: Color(0xFFFFF176),
            background: Color(0xFFFFFDE7),
            onPrimary: Colors.white,
            onBackground: Color(0xFF6D1B1B),
          ),

          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF6D1B1B)),
            titleMedium: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFFF176),
            titleTextStyle: TextStyle(
              color: Color(0xFF6D1B1B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Color(0xFF6D1B1B)),
          ),

          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFFFFF9C4),
            labelStyle: TextStyle(color: Color(0xFF6D1B1B)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD32F2F), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFF176)),
            ),
          ),
        ),

        // 🗺 Routes
        routes: {
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
          '/categories': (_) => CategoryScreen(),
          '/products': (_) => ProductsScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
        },
      ),
    );
  }
}
*/

/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'screens/login_screen.dart'; // example

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp()); // 👈 or PoojaApp() if that’s your class name
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pooja App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: LoginScreen(), // your first screen
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(), // 👈 your root widget
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pooja App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const LoginScreen(), // 👈 Your first screen
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  Future<void> _initAuth() async {
    final authProvider = AuthProvider();
    await authProvider.loadUserData();
    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFFFF176), // Light lemon yellow
          body: const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..loadUserData()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',

        // 🌼 Light Lemon Yellow + White Theme
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: const Color(0xFFFFF176), // Softer lemon yellow
          hintColor: const Color(0xFF6D1B1B),

          colorScheme: const ColorScheme.light(
            primary: Colors.white,
            secondary: Color(0xFFFFF9C4),
            background: Color(0xFFFFF176),
            onPrimary: Color(0xFF6D1B1B),
            onBackground: Color(0xFF6D1B1B),
          ),

          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF6D1B1B)),
            titleMedium: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Buttons white
              foregroundColor: const Color(0xFF6D1B1B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white, // App bar white
            titleTextStyle: TextStyle(
              color: Color(0xFF6D1B1B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Color(0xFF6D1B1B)),
          ),

          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white, // Text field white
            labelStyle: TextStyle(color: Color(0xFF6D1B1B)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6D1B1B), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),

        routes: {
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
          '/categories': (_) => CategoryScreen(),
          '/products': (_) => ProductsScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
        },
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/category_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Needed for async setup

  // ✅ Create and preload AuthProvider
  final authProvider = AuthProvider();
  await authProvider.loadUserData(); // 👈 This loads saved token & role

  runApp(MyApp(authProvider: authProvider));
}

class MyApp extends StatelessWidget {
  final AuthProvider authProvider;
  const MyApp({Key? key, required this.authProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>.value(value: authProvider), // ✅ preloaded provider
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        debugShowCheckedModeBanner: false,
        initialRoute: '/login', // ✅ Start with LoginScreen

        // 🍋🪔 Lemon Yellow & Red Traditional Theme
        theme: ThemeData(
          primaryColor: const Color(0xFFD32F2F),
          scaffoldBackgroundColor: const Color(0xFFFFFDE7),
          hintColor: const Color(0xFF6D1B1B),

          colorScheme: const ColorScheme.light(
            primary: Color(0xFFD32F2F),
            secondary: Color(0xFFFFF176),
            background: Color(0xFFFFFDE7),
            onPrimary: Colors.white,
            onBackground: Color(0xFF6D1B1B),
          ),

          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF6D1B1B)),
            titleMedium: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFFF176),
            titleTextStyle: TextStyle(
              color: Color(0xFF6D1B1B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Color(0xFF6D1B1B)),
          ),

          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFFFFF9C4),
            labelStyle: TextStyle(color: Color(0xFF6D1B1B)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD32F2F), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFF176)),
            ),
          ),
        ),

        // 🗺 Routes
        routes: {
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
          '/categories': (_) => CategoryScreen(),
          '/products': (_) => ProductsScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
        },
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  // ✅ Load user data (token + role) on app start
  Future<void> _initAuth() async {
    final authProvider = AuthProvider();
    await authProvider.loadUserData();
    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      // ✅ Show splash/loading screen briefly
      return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFFFFDE7),
          body: const Center(
            child: CircularProgressIndicator(color: Color(0xFFD32F2F)),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..loadUserData()), // ✅ Load user data here too
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        debugShowCheckedModeBanner: false,
        initialRoute: '/login', // ✅ Start with LoginScreen

        // 🍋🪔 Lemon Yellow & Red Traditional Theme
        theme: ThemeData(
          primaryColor: const Color(0xFFD32F2F),
          scaffoldBackgroundColor: const Color(0xFFFFFDE7),
          hintColor: const Color(0xFF6D1B1B),

          colorScheme: const ColorScheme.light(
            primary: Color(0xFFD32F2F),
            secondary: Color(0xFFFFF176),
            background: Color(0xFFFFFDE7),
            onPrimary: Colors.white,
            onBackground: Color(0xFF6D1B1B),
          ),

          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF6D1B1B)),
            titleMedium: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFFF176),
            titleTextStyle: TextStyle(
              color: Color(0xFF6D1B1B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Color(0xFF6D1B1B)),
          ),

          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFFFFF9C4),
            labelStyle: TextStyle(color: Color(0xFF6D1B1B)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD32F2F), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFF176)),
            ),
          ),
        ),

        // 🗺 Routes
        routes: {
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
          '/categories': (_) => CategoryScreen(),
          '/products': (_) => ProductsScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
        },
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  // ✅ Load user data (token + role) on app start
  Future<void> _initAuth() async {
    final authProvider = AuthProvider();
    await authProvider.loadUserData();
    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      // ✅ Show splash/loading screen briefly
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: const Center(
            child: CircularProgressIndicator(color: Color(0xFFFBC02D)),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..loadUserData()), // ✅ Load user data here too
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        debugShowCheckedModeBanner: false,
        initialRoute: '/login', // ✅ Start with LoginScreen

        // 🍋🕉️ White & Yellow Elegant Theme
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          hintColor: const Color(0xFFFBC02D), // yellow accent

          colorScheme: const ColorScheme.light(
            primary: Colors.white,
            secondary: Color(0xFFFBC02D),
            background: Colors.white,
            onPrimary: Colors.black,
            onBackground: Colors.black,
          ),

          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.black87),
            titleMedium: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFBC02D), // yellow
              foregroundColor: Colors.black, // black text
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 1,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Colors.black),
          ),

          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFFFFF9C4), // soft yellow fields
            labelStyle: TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFBC02D), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFBC02D)),
            ),
          ),
        ),

        // 🗺 Routes
        routes: {
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
          '/categories': (_) => CategoryScreen(),
          '/products': (_) => ProductsScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
        },
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  Future<void> _initAuth() async {
    final authProvider = AuthProvider();
    await authProvider.loadUserData();
    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFFFFF00), // Yellow background
          body: const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..loadUserData()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',

        // 🌼 Bright Yellow & White Clean Theme
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: const Color(0xFFFFFF00), // Yellow background
          hintColor: const Color(0xFF6D1B1B),

          colorScheme: const ColorScheme.light(
            primary: Colors.white,
            secondary: Color(0xFFFFF9C4),
            background: Color(0xFFFFFF00),
            onPrimary: Color(0xFF6D1B1B),
            onBackground: Color(0xFF6D1B1B),
          ),

          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF6D1B1B)),
            titleMedium: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Button white
              foregroundColor: const Color(0xFF6D1B1B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white, // App bar white
            titleTextStyle: TextStyle(
              color: Color(0xFF6D1B1B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Color(0xFF6D1B1B)),
          ),

          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white, // White text field background
            labelStyle: TextStyle(color: Color(0xFF6D1B1B)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6D1B1B), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),

        routes: {
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
          '/categories': (_) => CategoryScreen(),
          '/products': (_) => ProductsScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
        },
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  Future<void> _initAuth() async {
    final authProvider = AuthProvider();
    await authProvider.loadUserData();
    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFFFEB3B), // Lemon yellow background
          body: const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..loadUserData()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',

        // 🍋 Thick Lemon Yellow + White Clean Theme
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: const Color(0xFFFFEB3B), // Lemon yellow
          hintColor: const Color(0xFF6D1B1B),

          colorScheme: const ColorScheme.light(
            primary: Colors.white,
            secondary: Color(0xFFFFF9C4),
            background: Color(0xFFFFEB3B),
            onPrimary: Color(0xFF6D1B1B),
            onBackground: Color(0xFF6D1B1B),
          ),

          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF6D1B1B)),
            titleMedium: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Buttons white
              foregroundColor: const Color(0xFF6D1B1B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white, // App bar white
            titleTextStyle: TextStyle(
              color: Color(0xFF6D1B1B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Color(0xFF6D1B1B)),
          ),

          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white, // Text field white
            labelStyle: TextStyle(color: Color(0xFF6D1B1B)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6D1B1B), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),

        routes: {
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
          '/categories': (_) => CategoryScreen(),
          '/products': (_) => ProductsScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
        },
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  Future<void> _initAuth() async {
    final authProvider = AuthProvider();
    await authProvider.loadUserData();
    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFFFF176), // Light lemon yellow
          body: const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..loadUserData()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',

        // 🌼 Light Lemon Yellow + White Theme
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: const Color(0xFFFFF176), // Softer lemon yellow
          hintColor: const Color(0xFF6D1B1B),

          colorScheme: const ColorScheme.light(
            primary: Colors.white,
            secondary: Color(0xFFFFF9C4),
            background: Color(0xFFFFF176),
            onPrimary: Color(0xFF6D1B1B),
            onBackground: Color(0xFF6D1B1B),
          ),

          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF6D1B1B)),
            titleMedium: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Buttons white
              foregroundColor: const Color(0xFF6D1B1B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white, // App bar white
            titleTextStyle: TextStyle(
              color: Color(0xFF6D1B1B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Color(0xFF6D1B1B)),
          ),

          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white, // Text field white
            labelStyle: TextStyle(color: Color(0xFF6D1B1B)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6D1B1B), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),

        routes: {
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
          '/categories': (_) => CategoryScreen(),
          '/products': (_) => ProductsScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
        },
      ),
    );
  }
}
*/

/*

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  // ✅ Load user data (token + role) on app start
  Future<void> _initAuth() async {
    final authProvider = AuthProvider();
    await authProvider.loadUserData();
    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      // ✅ Show splash/loading screen briefly
      return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFFFFDE7),
          body: const Center(
            child: CircularProgressIndicator(color: Color(0xFFD32F2F)),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..loadUserData()), // ✅ Load user data here too
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        debugShowCheckedModeBanner: false,
        initialRoute: '/login', // ✅ Start with LoginScreen

        // 🍋🪔 Lemon Yellow & Red Traditional Theme
        theme: ThemeData(
          primaryColor: const Color(0xFFD32F2F),
          scaffoldBackgroundColor: const Color(0xFFFFFDE7),
          hintColor: const Color(0xFF6D1B1B),

          colorScheme: const ColorScheme.light(
            primary: Color(0xFFD32F2F),
            secondary: Color(0xFFFFF176),
            background: Color(0xFFFFFDE7),
            onPrimary: Colors.white,
            onBackground: Color(0xFF6D1B1B),
          ),

          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF6D1B1B)),
            titleMedium: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFFF176),
            titleTextStyle: TextStyle(
              color: Color(0xFF6D1B1B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Color(0xFF6D1B1B)),
          ),

          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFFFFF9C4),
            labelStyle: TextStyle(color: Color(0xFF6D1B1B)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD32F2F), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFF176)),
            ),
          ),
        ),

        // 🗺 Routes
        routes: {
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
          '/categories': (_) => CategoryScreen(),
          '/products': (_) => ProductsScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
        },
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:pooja_app_new/screens/main_navigation.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/category_screen.dart';
import 'screens/landing_page.dart'; // ✅ Added import for Landing Page

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  // ✅ Load user data (token + role) on app start
  Future<void> _initAuth() async {
    final authProvider = AuthProvider();
    await authProvider.loadUserData();
    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      // ✅ Show splash/loading screen briefly
      return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFFFFDE7),
          body: const Center(
            child: CircularProgressIndicator(color: Color(0xFFD32F2F)),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..loadUserData()), // ✅ Load user data here too
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        debugShowCheckedModeBanner: false,
        initialRoute: '/landing', // ✅ Start with Landing Page first

        // 🍋🪔 Lemon Yellow & Red Traditional Theme
        theme: ThemeData(
          primaryColor: const Color(0xFFD32F2F),
          scaffoldBackgroundColor: const Color(0xFFFFFDE7),
          hintColor: const Color(0xFF6D1B1B),

          colorScheme: const ColorScheme.light(
            primary: Color(0xFFD32F2F),
            secondary: Color(0xFFFFF176),
            background: Color(0xFFFFFDE7),
            onPrimary: Colors.white,
            onBackground: Color(0xFF6D1B1B),
          ),

          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF6D1B1B)),
            titleMedium: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFFF176),
            titleTextStyle: TextStyle(
              color: Color(0xFF6D1B1B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Color(0xFF6D1B1B)),
          ),

          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFFFFF9C4),
            labelStyle: TextStyle(color: Color(0xFF6D1B1B)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD32F2F), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFF176)),
            ),
          ),
        ),

        // 🗺 Routes
        routes: {
          '/landing': (_) => const LandingPage(), // ✅ New route added
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
          '/main': (_) => const MainNavigation(),
          '/categories': (_) => CategoryScreen(),
          '/products': (_) => ProductsScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
        },
      ),
    );
  }
}

*/



/*
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';

import 'screens/main_navigation.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/category_screen.dart';
import 'screens/landing_page.dart'; // ✅ Landing Page import

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // ✅ Read saved locale from SharedPreferences (if any)
  final prefs = await SharedPreferences.getInstance();
  final savedLocaleCode = prefs.getString('saved_locale'); // e.g. "en", "te", "ta"

  Locale? startLocale;
  if (savedLocaleCode != null && savedLocaleCode.isNotEmpty) {
    startLocale = Locale(savedLocaleCode);
  }

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
        Locale('te'),
        Locale('kn'),
        Locale('ml'),
        Locale('ta'),
        Locale('bn'),
        Locale('mr'),
        Locale('gu'),
        Locale('pa'),
        Locale('ur'),
        Locale('or'),
      ],
      path: 'assets/langs', // ✅ Folder with translation JSONs
      fallbackLocale: const Locale('en'),
      startLocale: startLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  // ✅ Load user data (token + role) on app start
  Future<void> _initAuth() async {
    final authProvider = AuthProvider();
    await authProvider.loadUserData();
    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      // ✅ Show splash/loading screen briefly
      return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFFFFDE7),
          body: const Center(
            child: CircularProgressIndicator(color: Color(0xFFD32F2F)),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..loadUserData()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        debugShowCheckedModeBanner: false,

        // ✅ Localization configuration
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,

        initialRoute: '/landing', // ✅ Landing Page first

        // 🍋🪔 Lemon Yellow & Red Traditional Theme
        theme: ThemeData(
          primaryColor: const Color(0xFFD32F2F),
          scaffoldBackgroundColor: const Color(0xFFFFFDE7),
          hintColor: const Color(0xFF6D1B1B),

          colorScheme: const ColorScheme.light(
            primary: Color(0xFFD32F2F),
            secondary: Color(0xFFFFF176),
            background: Color(0xFFFFFDE7),
            onPrimary: Colors.white,
            onBackground: Color(0xFF6D1B1B),
          ),

          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF6D1B1B)),
            titleMedium: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFFF176),
            titleTextStyle: TextStyle(
              color: Color(0xFF6D1B1B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Color(0xFF6D1B1B)),
          ),

          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFFFFF9C4),
            labelStyle: TextStyle(color: Color(0xFF6D1B1B)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD32F2F), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFF176)),
            ),
          ),
        ),

        // 🗺 Routes
        routes: {
          '/landing': (_) => const LandingPage(),
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
          '/main': (_) => const MainNavigation(),
          '/categories': (_) => CategoryScreen(),
          '/products': (_) => ProductsScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
        },
      ),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/main_navigation.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/register_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/category_screen.dart';
import 'screens/landing_page.dart';
import 'screens/reports_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final savedLocaleCode = prefs.getString('saved_locale');
  Locale? startLocale;
  if (savedLocaleCode != null && savedLocaleCode.isNotEmpty) {
    startLocale = Locale(savedLocaleCode);
  }

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
        Locale('te'),
        Locale('kn'),
        Locale('ml'),
        Locale('ta'),
        Locale('bn'),
        Locale('mr'),
        Locale('gu'),
        Locale('pa'),
        Locale('ur'),
        Locale('or'),
      ],
      path: 'assets/langs',
      fallbackLocale: const Locale('en'),
      startLocale: startLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  Future<void> _initAuth() async {
    final authProvider = AuthProvider();
    await authProvider.loadUserData();
    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFFFFDE7),
          body: const Center(
            child: CircularProgressIndicator(color: Color(0xFFD32F2F)),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..loadUserData()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Pooja Essentials',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: '/landing',
        theme: ThemeData(
          primaryColor: const Color(0xFFD32F2F),
          scaffoldBackgroundColor: const Color(0xFFFFFDE7),
          hintColor: const Color(0xFF6D1B1B),
          colorScheme: const ColorScheme.light(
            primary: Color(0xFFD32F2F),
            secondary: Color(0xFFFFF176),
            background: Color(0xFFFFFDE7),
            onPrimary: Colors.white,
            onBackground: Color(0xFF6D1B1B),
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF6D1B1B)),
            titleMedium: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Color(0xFF6D1B1B),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFFF176),
            titleTextStyle: TextStyle(
              color: Color(0xFF6D1B1B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Color(0xFF6D1B1B)),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFFFFF9C4),
            labelStyle: TextStyle(color: Color(0xFF6D1B1B)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD32F2F), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFF176)),
            ),
          ),
        ),
        routes: {
          '/landing': (_) => const LandingPage(),
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen(),
          '/main': (_) => const MainNavigation(),
          '/categories': (_) => CategoryScreen(),
          '/products': (_) => ProductsScreen(),
          '/cart': (_) => CartScreen(),
          '/checkout': (_) => CheckoutScreen(),
          '/admin': (_) => AdminScreen(),
          '/orders': (_) => OrdersScreen(),
          '/reports': (_) => ReportsScreen(),

        },
      ),
    );
  }
}
