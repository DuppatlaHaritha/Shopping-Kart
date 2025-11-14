/*
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4), // Lemon yellow shade
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/golden_pattern.png'), // Add a self-design golden pattern image here
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.yellowAccent.withOpacity(0.1),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🪔 App Logo
                Image.asset(
                  'assets/pooja_kart_logo.png',
                  height: 150,
                ),
                const SizedBox(height: 30),

                // 🪔 Welcome Text
                const Text(
                  "Welcome to Pooja-Kart",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // 🪔 5 Welcome Messages
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("🌿 We deliver 100% organic pooja products."),
                    Text("🪔 All pooja materials in one place."),
                    Text("🌸 Fresh flowers and idols available."),
                    Text("📦 Fast delivery and easy ordering."),
                    Text("🙏 Bringing spirituality to your doorstep."),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4), // Lemon yellow shade
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFF9C4), // Lemon yellow
              Color(0xFFFFECB3), // Soft golden tint
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🪔 App Logo
                Image.asset(
                  'assets/pooja_kart_logo.png',
                  height: 150,
                ),
                const SizedBox(height: 30),

                // 🪔 Welcome Text
                const Text(
                  "Welcome to Pooja-Kart",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // 🪔 5 Welcome Messages
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("🌿 We deliver 100% organic pooja products."),
                    Text("🪔 All pooja materials in one place."),
                   // Text("🌼 Pure incense sticks and sacred essentials."),
                    Text("📦 Fast delivery and easy ordering."),
                    Text("🙏 Bringing spirituality to your doorstep."),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4), // Lemon yellow shade
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFF9C4), // Lemon yellow
              Color(0xFFFFECB3), // Soft golden tint
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🪔 App Logo
                Image.asset(
                  'assets/pooja_kart_logo.jpeg.png',
                  height: 150,
                ),
                const SizedBox(height: 30),

                // 🪔 Welcome Text
                const Text(
                  "Welcome to Pooja-Kart",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // 🪔 5 Welcome Messages
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("🌿 We deliver 100% organic pooja products."),
                    Text("🪔 All pooja materials in one place."),
                    Text("📦 Fast delivery and easy ordering."),
                    Text("🙏 Bringing spirituality to your doorstep."),
                  ],
                ),

                const SizedBox(height: 40),

                // ✨ ENTER BUTTON
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Enter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🪔 Rich gradient background (gold + maroon + yellow)
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7B1F1F), // Deep Maroon (Top)
              Color(0xFFFFC300), // Bright Gold
              Color(0xFFFFE082), // Soft Yellow (Bottom)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFFFD700), // Gold border
                  width: 6,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.amber.shade200.withOpacity(0.6),
                    blurRadius: 20,
                    spreadRadius: 5,
                    offset: const Offset(0, 10),
                  ),
                ],
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFFF8E1), // light gold
                    Color(0xFFFFECB3), // pale yellow
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 🪔 App Logo
                  Image.asset(
                    'assets/pooja_kart_logo.jpeg.png',
                    height: 150,
                  ),
                  const SizedBox(height: 30),

                  // 🪔 Welcome Text
                  const Text(
                    "✨ Welcome to Pooja-Kart ✨",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF7B1F1F), // Maroon
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          color: Colors.orangeAccent,
                          blurRadius: 8,
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // 🪔 5 Welcome Messages
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "🌿 100% Organic Pooja Products",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "🪔 All Pooja Essentials in One Place",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "💫 Beautiful Idols and Spiritual Decor",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "📦 Fast & Reliable Delivery Service",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "🙏 Bringing Divinity to Your Doorstep",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // ✨ ENTER BUTTON (Golden Maroon Style)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7B1F1F), // Maroon
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                            color: Color(0xFFFFD700), width: 3), // Gold border
                      ),
                      elevation: 10,
                      shadowColor: Colors.amber,
                    ),
                    child: const Text(
                      "ENTER",
                      style: TextStyle(
                        color: Color(0xFFFFD700), // Gold text
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🪔 Grand festive gradient background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7B1F1F), // Deep Maroon (top)
              Color(0xFFFFC107), // Rich Gold (middle)
              Color(0xFFFFF59D), // Warm Yellow (bottom)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🪔 App Logo
                Image.asset(
                  'assets/pooja_kart_logo.jpeg.png',
                  height: 150,
                ),
                const SizedBox(height: 30),

                // ✨ Title Text
                const Text(
                  "✨ Welcome to Pooja-Kart ✨",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFFFF9C4), // Soft golden-yellow
                    fontFamily: 'Georgia',
                    shadows: [
                      Shadow(
                        color: Colors.orangeAccent,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // 🌸 Welcome Messages
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "🌿 100% Organic Pooja Products",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "🪔 All Pooja Essentials in One Place",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "💫 Beautiful Idols and Spiritual Decor",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "📦 Fast & Reliable Delivery Service",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "🙏 Bringing Divinity to Your Doorstep",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),

                // 🌟 Enter Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7B1F1F), // Maroon
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(
                          color: Color(0xFFFFD700), width: 3), // Gold border
                    ),
                    elevation: 10,
                    shadowColor: Colors.amberAccent,
                  ),
                  child: const Text(
                    "ENTER",
                    style: TextStyle(
                      color: Color(0xFFFFD700), // Gold Text
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/




/*
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFD700), // Gold
              Color(0xFFFFC107), // Deep Yellow
              Color(0xFFB22222), // Maroon base
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🪔 App Logo
                Image.asset(
                  'assets/pooja_kart_logo.jpeg.png',
                  height: 150,
                ),
                const SizedBox(height: 30),

                // 🌸 Welcome Text
                const Text(
                  "💫 Welcome to Pooja-Kart 💫",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF800000), // Maroon
                    fontFamily: 'Georgia',
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // 🪔 5 Welcome Messages
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "🌿 We deliver 100% organic pooja products.",
                      style: TextStyle(color: Color(0xFF800000), fontSize: 16),
                    ),
                    Text(
                      "🪔 All pooja materials in one place.",
                      style: TextStyle(color: Color(0xFF800000), fontSize: 16),
                    ),
                    Text(
                      "📦 Fast delivery and easy ordering.",
                      style: TextStyle(color: Color(0xFF800000), fontSize: 16),
                    ),
                    Text(
                      "🙏 Bringing spirituality to your doorstep.",
                      style: TextStyle(color: Color(0xFF800000), fontSize: 16),
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                // ✨ ENTER BUTTON (Golden with Maroon Text)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD700), // Gold
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Color(0xFF800000), width: 2),
                    ),
                    elevation: 8,
                  ),
                  child: const Text(
                    "Enter",
                    style: TextStyle(
                      color: Color(0xFF800000), // Maroon
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // ✨ Richer Gradient Background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFE97F), // 🍋 Deep Lemon Yellow
              Color(0xFFFFD54F), // 🌟 Golden Yellow
              Color(0xFFFFB300), // ✨ Rich Amber
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🪔 App Logo
                Image.asset(
                  'assets/pooja_kart_logo.jpeg.png',
                  height: 150,
                ),
                const SizedBox(height: 30),

                // 🌸 Welcome Text
                const Text(
                  "💫 Welcome to Pooja-Kart 💫",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF800000), // Maroon text
                    fontFamily: 'Georgia',
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),

                // 🪔 Welcome Messages
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "🌿 We deliver 100% organic pooja products.",
                      style: TextStyle(
                        color: Color(0xFF800000),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                            blurRadius: 3,
                            color: Colors.black26,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "🪔 All pooja materials in one place.",
                      style: TextStyle(
                        color: Color(0xFF800000),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                            blurRadius: 3,
                            color: Colors.black26,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "📦 Fast delivery and easy ordering.",
                      style: TextStyle(
                        color: Color(0xFF800000),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                            blurRadius: 3,
                            color: Colors.black26,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "🙏 Bringing spirituality to your doorstep.",
                      style: TextStyle(
                        color: Color(0xFF800000),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                            blurRadius: 3,
                            color: Colors.black26,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                // ✨ ENTER BUTTON
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC107), // Rich Gold
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side:
                      const BorderSide(color: Color(0xFF800000), width: 2),
                    ),
                    elevation: 10,
                  ),
                  child: const Text(
                    "Enter",
                    style: TextStyle(
                      color: Color(0xFF800000),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌼 Lemon Yellow Background
        decoration: const BoxDecoration(
          color: Color(0xFFFFF8C6), // Lemon Yellow shade
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🌸 Welcome Text ABOVE the logo
                  const Text(
                    "💫 Welcome to Pooja-Kart 💫",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000), // Maroon text
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 6,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // 🪔 Logo with Golden Flowery Border
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFFFD700), // Golden border
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(2, 4),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/golden_pattern.png'),
                        fit: BoxFit.cover,
                        opacity: 0.15, // Subtle floral pattern overlay
                      ),
                    ),
                    child: Image.asset(
                      'assets/pooja_kart_logo.jpeg.png',
                      height: 150,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // 🌺 Section Heading
                  const Text(
                    "🌼 Our Services 🌼",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000),
                      fontFamily: 'Georgia',
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 25),

                  // ✅ Checkboxes (Service Points)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ServiceCheckbox(text: "We deliver 100% authenticated pooja products."),
                      ServiceCheckbox(text: "All pooja materials in one place for all occasions."),
                      ServiceCheckbox(text: "ordering at finger tips."),
                      ServiceCheckbox(text: "Bringing spirituality to your doorstep."),
                      ServiceCheckbox(text: "guaranteed low prices for high quality products."),
                    ],
                  ),

                  const SizedBox(height: 50),

                  // ✨ ENTER BUTTON
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107), // Rich Gold
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                            color: Color(0xFF800000), width: 2),
                      ),
                      elevation: 10,
                    ),
                    child: const Text(
                      "Enter",
                      style: TextStyle(
                        color: Color(0xFF800000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkboxes
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
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

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌸 Background color (Rich Lemon Gold)
        decoration: const BoxDecoration(
          color: Color(0xFFFFF2A1), // Deeper gold-yellow background
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🌸 Welcome Text ABOVE the logo
                  const Text(
                    "💫 Welcome to Pooja-Kart 💫",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000), // Deep Maroon
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 8,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // 🪔 Logo with Golden Flowery Border
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFFFC107), // Golden border
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(3, 4),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/golden_pattern.png'),
                        fit: BoxFit.cover,
                        opacity: 0.18, // subtle background pattern
                      ),
                    ),
                    child: Image.asset(
                      'assets/pooja_kart_logo.jpeg.png',
                      height: 160,
                    ),
                  ),

                  const SizedBox(height: 45),

                  // 🌺 Section Heading
                  const Text(
                    "🌼 Our Services 🌼",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000),
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 3,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 25),

                  // ✅ Checkboxes (Service Points)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ServiceCheckbox(
                          text:
                          "We deliver 100% authenticated pooja products."),
                      ServiceCheckbox(
                          text:
                          "All pooja materials in one place for all occasions."),
                      ServiceCheckbox(
                          text:
                          "Ordering made simple — right at your fingertips."),
                      ServiceCheckbox(
                          text: "Bringing spirituality to your doorstep."),
                      ServiceCheckbox(
                          text:
                          "Guaranteed low prices with top quality items."),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // ✨ ENTER BUTTON
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107), // Rich Gold
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                            color: Color(0xFF800000), width: 2),
                      ),
                      elevation: 12,
                    ),
                    child: const Text(
                      "Enter",
                      style: TextStyle(
                        color: Color(0xFF800000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for Services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkbox
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌸 Background color (Rich Lemon Gold)
        decoration: const BoxDecoration(
          color: Color(0xFFFFF2A1), // Deeper gold-yellow background
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🌸 Welcome Text ABOVE the logo
                  const Text(
                    "💫 Welcome to Pooja-Kart 💫",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000), // Deep Maroon
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 8,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // 🪔 Logo with Flowery Golden Border
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // 🌼 Golden Flowery Frame
                      Container(
                        height: 190,
                        width: 190,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/golden_flower_frame.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(3, 4),
                            ),
                          ],
                        ),
                      ),

                      // 🪔 Inner logo with soft white backdrop
                      Container(
                        height: 150,
                        width: 150,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(2, 3),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/pooja_kart_logo.jpeg.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 45),

                  // 🌺 Section Heading
                  const Text(
                    "🌼 Our Services 🌼",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000),
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 3,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 25),

                  // ✅ Checkboxes (Service Points)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ServiceCheckbox(
                          text:
                          "We deliver 100% authenticated pooja products."),
                      ServiceCheckbox(
                          text:
                          "All pooja materials in one place for all occasions."),
                      ServiceCheckbox(
                          text:
                          "Ordering made simple — right at your fingertips."),
                      ServiceCheckbox(
                          text: "Bringing spirituality to your doorstep."),
                      ServiceCheckbox(
                          text:
                          "Guaranteed low prices with top quality items."),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // ✨ ENTER BUTTON
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107), // Rich Gold
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                            color: Color(0xFF800000), width: 2),
                      ),
                      elevation: 12,
                    ),
                    child: const Text(
                      "Enter",
                      style: TextStyle(
                        color: Color(0xFF800000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for Services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkbox
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌸 Background color (Rich Lemon Gold)
        decoration: const BoxDecoration(
          color: Color(0xFFFFF2A1), // Deeper gold-yellow background
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🌸 Welcome Text ABOVE the logo
                  const Text(
                    "💫 Welcome to Pooja-Kart 💫",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000), // Deep Maroon
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 8,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // 🪔 Logo with True Golden Border
                  Container(
                    height: 170,
                    width: 170,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xFFFFD700), // ✨ Pure Golden Border
                        width: 8,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(3, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        'assets/pooja_kart_logo.jpeg.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 45),

                  // 🌺 Section Heading
                  const Text(
                    "🌼 Our Services 🌼",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000),
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 3,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 25),

                  // ✅ Checkboxes (Service Points)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ServiceCheckbox(
                        text:
                        "We deliver 100% authenticated pooja products.",
                      ),
                      ServiceCheckbox(
                        text:
                        "All pooja materials in one place for all occasions.",
                      ),
                      ServiceCheckbox(
                        text:
                        "Ordering made simple — right at your fingertips.",
                      ),
                      ServiceCheckbox(
                        text: "Bringing spirituality to your doorstep.",
                      ),
                      ServiceCheckbox(
                        text:
                        "Guaranteed low prices with top quality items.",
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // ✨ ENTER BUTTON
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107), // Rich Gold
                      padding: const EdgeInsets.symmetric(
                        horizontal: 55,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          color: Color(0xFF800000),
                          width: 2,
                        ),
                      ),
                      elevation: 12,
                    ),
                    child: const Text(
                      "Enter",
                      style: TextStyle(
                        color: Color(0xFF800000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for Services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkbox
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌸 Background color (Thick Lemon Yellow)
        decoration: const BoxDecoration(
          color: Color(0xFFFFD700), // 🌼 Vibrant Lemon Yellow (Thicker tone)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🌸 Welcome Text ABOVE the logo
                  const Text(
                    "💫 Welcome to Pooja-Kart 💫",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000), // Deep Maroon
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 8,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // 🪔 Logo with True Golden Border
                  Container(
                    height: 170,
                    width: 170,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xFFFFD700), // ✨ Pure Golden Border
                        width: 8,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(3, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        'assets/pooja_kart_logo.jpeg.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 45),

                  // 🌺 Section Heading
                  const Text(
                    "🌼 Our Services 🌼",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000),
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 3,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 25),

                  // ✅ Checkboxes (Service Points)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ServiceCheckbox(
                        text:
                        "We deliver 100% authenticated pooja products.",
                      ),
                      ServiceCheckbox(
                        text:
                        "All pooja materials in one place for all occasions.",
                      ),
                      ServiceCheckbox(
                        text:
                        "Ordering made simple — right at your fingertips.",
                      ),
                      ServiceCheckbox(
                        text: "Bringing spirituality to your doorstep.",
                      ),
                      ServiceCheckbox(
                        text:
                        "Guaranteed low prices with top quality items.",
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // ✨ ENTER BUTTON
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107), // Rich Gold
                      padding: const EdgeInsets.symmetric(
                        horizontal: 55,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          color: Color(0xFF800000),
                          width: 2,
                        ),
                      ),
                      elevation: 12,
                    ),
                    child: const Text(
                      "Enter",
                      style: TextStyle(
                        color: Color(0xFF800000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for Services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkbox
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌸 Background color (Light Lemon Yellow)
        decoration: const BoxDecoration(
          color: Color(0xFFFFEB66), // 🍋 Light Lemon Yellow (soft but bright)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🌸 Welcome Text ABOVE the logo
                  const Text(
                    "💫 Welcome to Pooja-Kart 💫",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000), // Deep Maroon
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 8,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // 🪔 Logo with True Golden Border
                  Container(
                    height: 170,
                    width: 170,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xFFFFD700), // ✨ Pure Golden Border
                        width: 8,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(3, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        'assets/pooja_kart_logo.jpeg.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 45),

                  // 🌺 Section Heading
                  const Text(
                    "🌼 Our Services 🌼",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000),
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 3,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 25),

                  // ✅ Checkboxes (Service Points)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ServiceCheckbox(
                        text:
                        "We deliver 100% authenticated pooja products.",
                      ),
                      ServiceCheckbox(
                        text:
                        "All pooja materials in one place for all occasions.",
                      ),
                      ServiceCheckbox(
                        text:
                        "Ordering made simple — right at your fingertips.",
                      ),
                      ServiceCheckbox(
                        text: "Bringing spirituality to your doorstep.",
                      ),
                      ServiceCheckbox(
                        text:
                        "Guaranteed low prices with top quality items.",
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // ✨ ENTER BUTTON
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107), // Rich Gold
                      padding: const EdgeInsets.symmetric(
                        horizontal: 55,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          color: Color(0xFF800000),
                          width: 2,
                        ),
                      ),
                      elevation: 12,
                    ),
                    child: const Text(
                      "Enter",
                      style: TextStyle(
                        color: Color(0xFF800000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for Services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkbox
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌸 Background color (Light Lemon Yellow)
        decoration: const BoxDecoration(
          color: Color(0xFFFFEB66), // 🍋 Light Lemon Yellow (soft but bright)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🌸 Welcome Text ABOVE the logo
                  const Text(
                    "💫 Welcome to Pooja-Kart 💫",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000), // Deep Maroon
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 8,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // 🪔 Logo with True Golden Border
                  Container(
                    height: 170,
                    width: 170,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xFFFFD700), // ✨ Pure Golden Border
                        width: 8,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(3, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        'assets/pooja_kart_logo.jpeg.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 45),

                  // 🌹 Section Heading with Red Flowers
                  const Text(
                    "🌹 Our Services 🌹",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000),
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 3,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 25),

                  // ✅ Checkboxes (Service Points)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ServiceCheckbox(
                        text:
                        "We deliver 100% authenticated pooja products.",
                      ),
                      ServiceCheckbox(
                        text:
                        "All pooja materials in one place for all occasions.",
                      ),
                      ServiceCheckbox(
                        text:
                        "Ordering made simple — right at your fingertips.",
                      ),
                      ServiceCheckbox(
                        text: "Bringing spirituality to your doorstep.",
                      ),
                      ServiceCheckbox(
                        text:
                        "Guaranteed low prices with top quality items.",
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // ✨ ENTER BUTTON
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107), // Rich Gold
                      padding: const EdgeInsets.symmetric(
                        horizontal: 55,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          color: Color(0xFF800000),
                          width: 2,
                        ),
                      ),
                      elevation: 12,
                    ),
                    child: const Text(
                      "Enter",
                      style: TextStyle(
                        color: Color(0xFF800000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for Services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkbox
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌸 Background color (Light Lemon Yellow)
        decoration: const BoxDecoration(
          color: Color(0xFFFFEB66), // 🍋 Light Lemon Yellow (soft but bright)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🌸 Welcome Text ABOVE the logo
                  const Text(
                    "💫 Welcome to Pooja-Kart 💫",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000), // Deep Maroon
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 8,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // 🪔 Logo with True Golden Border
                  Container(
                    height: 170,
                    width: 170,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xFFFFD700), // ✨ Pure Golden Border
                        width: 8,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(3, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        'assets/pooja_kart_logo.jpeg.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 45),

                  // 🪷 Section Heading (Flower color changed to Orange theme)
                  const Text(
                    "🪷 Our Services 🪷",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000),
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 3,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 25),

                  // ✅ Checkboxes (Service Points)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ServiceCheckbox(
                        text:
                        "We deliver 100% authenticated pooja products.",
                      ),
                      ServiceCheckbox(
                        text:
                        "All pooja materials in one place for all occasions.",
                      ),
                      ServiceCheckbox(
                        text:
                        "Ordering made simple — right at your fingertips.",
                      ),
                      ServiceCheckbox(
                        text: "Bringing spirituality to your doorstep.",
                      ),
                      ServiceCheckbox(
                        text:
                        "Guaranteed low prices with top quality items.",
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // ✨ ENTER BUTTON
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107), // Rich Gold
                      padding: const EdgeInsets.symmetric(
                        horizontal: 55,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          color: Color(0xFF800000),
                          width: 2,
                        ),
                      ),
                      elevation: 12,
                    ),
                    child: const Text(
                      "Enter",
                      style: TextStyle(
                        color: Color(0xFF800000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for Services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkbox
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌸 Background color (Light Lemon Yellow)
        decoration: const BoxDecoration(
          color: Color(0xFFFFEB66), // 🍋 Light Lemon Yellow (soft but bright)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🌸 Welcome Text ABOVE the logo
                  const Text(
                    "🪔 Welcome to Pooja-Kart 🪔",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000), // Deep Maroon
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 8,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // 🪔 Logo with True Golden Border
                  Container(
                    height: 170,
                    width: 170,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xFFFFD700), // ✨ Pure Golden Border
                        width: 8,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(3, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        'assets/pooja_kart_logo.jpeg.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 45),

                  // 🪷 Section Heading (Flower color changed to Orange theme)
                  const Text(
                    "🪷 Our Services 🪷",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000),
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 3,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 25),

                  // ✅ Checkboxes (Service Points)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ServiceCheckbox(
                        text:
                        "We deliver 100% authenticated pooja products.",
                      ),
                      ServiceCheckbox(
                        text:
                        "All pooja materials in one place for all occasions.",
                      ),
                      ServiceCheckbox(
                        text:
                        "Ordering made simple — right at your fingertips.",
                      ),
                      ServiceCheckbox(
                        text: "Bringing spirituality to your doorstep.",
                      ),
                      ServiceCheckbox(
                        text:
                        "Guaranteed low prices with top quality items.",
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // ✨ ENTER BUTTON
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107), // Rich Gold
                      padding: const EdgeInsets.symmetric(
                        horizontal: 55,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          color: Color(0xFF800000),
                          width: 2,
                        ),
                      ),
                      elevation: 12,
                    ),
                    child: const Text(
                      "Enter",
                      style: TextStyle(
                        color: Color(0xFF800000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for Services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkbox
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌸 Background color (Light Lemon Yellow)
        decoration: const BoxDecoration(
          color: Color(0xFFFFEB66), // 🍋 Light Lemon Yellow (soft but bright)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🌸 Welcome Text ABOVE the logo
                  const Text(
                    "🪔 Welcome to Pooja-Kart 🪔",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000), // Deep Maroon
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 8,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // 🪔 Logo with True Golden Border
                  Container(
                    height: 170,
                    width: 170,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xFFFFD700), // ✨ Pure Golden Border
                        width: 8,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(3, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        'assets/pooja_kart_logo.jpeg.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 45),

                  // 🪷 Section Heading (Flowers removed)
                  const Text(
                    "Our Services",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000),
                      fontFamily: 'Georgia',
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 3,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 25),

                  // ✅ Checkboxes (Service Points)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ServiceCheckbox(
                        text:
                        "We deliver 100% authenticated pooja products.",
                      ),
                      ServiceCheckbox(
                        text:
                        "All pooja materials in one place for all occasions.",
                      ),
                      ServiceCheckbox(
                        text:
                        "Ordering made simple — right at your fingertips.",
                      ),
                      ServiceCheckbox(
                        text: "Bringing spirituality to your doorstep.",
                      ),
                      ServiceCheckbox(
                        text:
                        "Guaranteed low prices with top quality items.",
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // ✨ ENTER BUTTON
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107), // Rich Gold
                      padding: const EdgeInsets.symmetric(
                        horizontal: 55,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          color: Color(0xFF800000),
                          width: 2,
                        ),
                      ),
                      elevation: 12,
                    ),
                    child: const Text(
                      "Enter",
                      style: TextStyle(
                        color: Color(0xFF800000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for Services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkbox
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌟 Outer Golden Border
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFD700), // ✨ Pure Rich Gold Border
            width: 10,
          ),
        ),
        child: Container(
          // 🌸 Background color (Light Lemon Yellow)
          decoration: const BoxDecoration(
            color: Color(0xFFFFEB66), // 🍋 Light Lemon Yellow (soft but bright)
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 🌸 Welcome Text ABOVE the logo
                    const Text(
                      "🪔 Welcome to Pooja-Kart 🪔",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF800000), // Deep Maroon
                        fontFamily: 'Georgia',
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 8,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    // 🪔 Logo with True Golden Border
                    Container(
                      height: 170,
                      width: 170,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFFFD700), // ✨ Pure Golden Border
                          width: 8,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(3, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          'assets/pooja_kart_logo.jpeg.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 45),

                    // 🪷 Section Heading
                    const Text(
                      "Our Services",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF800000),
                        fontFamily: 'Georgia',
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 3,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 25),

                    // ✅ Service List with Checkboxes
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        ServiceCheckbox(
                          text:
                          "We deliver 100% authenticated pooja products.",
                        ),
                        ServiceCheckbox(
                          text:
                          "All pooja materials in one place for all occasions.",
                        ),
                        ServiceCheckbox(
                          text:
                          "Ordering made simple — right at your fingertips.",
                        ),
                        ServiceCheckbox(
                          text: "Bringing spirituality to your doorstep.",
                        ),
                        ServiceCheckbox(
                          text:
                          "Guaranteed low prices with top quality items.",
                        ),
                      ],
                    ),

                    const SizedBox(height: 60),

                    // ✨ ENTER BUTTON
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFC107), // Rich Gold
                        padding: const EdgeInsets.symmetric(
                          horizontal: 55,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            color: Color(0xFF800000),
                            width: 2,
                          ),
                        ),
                        elevation: 12,
                      ),
                      child: const Text(
                        "Enter",
                        style: TextStyle(
                          color: Color(0xFF800000),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for Services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkbox
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌟 Outer Golden Border
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFD700), // ✨ Pure Rich Gold Border
            width: 10,
          ),
        ),
        child: Container(
          // 🌸 Background color (Light Lemon Yellow)
          decoration: const BoxDecoration(
            color: Color(0xFFFFEB66), // 🍋 Light Lemon Yellow (soft but bright)
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 🌸 Welcome Text ABOVE the logo
                    const Text(
                      "🪔 Welcome to Pooja-Kart 🪔",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF800000), // Deep Maroon
                        fontFamily: 'Georgia',
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 8,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    // 🪔 Logo with True Golden Border
                    Container(
                      height: 170,
                      width: 170,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFFFD700), // ✨ Pure Golden Border
                          width: 8,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(3, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                            Color(0xFFFFD700), // 🌟 Golden Yellow Tint
                            BlendMode.modulate, // Blend with image colors
                          ),
                          child: Image.asset(
                            'assets/pooja_kart_logo.jpeg.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 45),

                    // 🪷 Section Heading
                    const Text(
                      "Our Services",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF800000),
                        fontFamily: 'Georgia',
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 3,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 25),

                    // ✅ Service List with Checkboxes
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        ServiceCheckbox(
                          text:
                          "We deliver 100% authenticated pooja products.",
                        ),
                        ServiceCheckbox(
                          text:
                          "All pooja materials in one place for all occasions.",
                        ),
                        ServiceCheckbox(
                          text:
                          "Ordering made simple — right at your fingertips.",
                        ),
                        ServiceCheckbox(
                          text: "Bringing spirituality to your doorstep.",
                        ),
                        ServiceCheckbox(
                          text:
                          "Guaranteed low prices with top quality items.",
                        ),
                      ],
                    ),

                    const SizedBox(height: 60),

                    // ✨ ENTER BUTTON
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFC107), // Rich Gold
                        padding: const EdgeInsets.symmetric(
                          horizontal: 55,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            color: Color(0xFF800000),
                            width: 2,
                          ),
                        ),
                        elevation: 12,
                      ),
                      child: const Text(
                        "Enter",
                        style: TextStyle(
                          color: Color(0xFF800000),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for Services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkbox
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌟 Outer Golden Border
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFD700), // ✨ Pure Rich Gold Border
            width: 10,
          ),
        ),
        child: Container(
          // 🌸 Background color (Light Lemon Yellow)
          decoration: const BoxDecoration(
            color: Color(0xFFFFEB66), // 🍋 Light Lemon Yellow (soft but bright)
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 🌸 Welcome Text ABOVE the logo
                    const Text(
                      "🪔 Welcome to Pooja-Kart 🪔",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF800000), // Deep Maroon
                        fontFamily: 'Georgia',
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 8,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    // 🪔 Logo with Golden Fill and True Golden Border
                    Container(
                      height: 170,
                      width: 170,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD700), // ✨ Filled with Gold inside
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFFFD700), // ✨ Outer Golden Border
                          width: 8,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(3, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                            Color(0xFFFFF8DC), // 🟡 Light golden tint for glow
                            BlendMode.modulate, // Blend with image colors
                          ),
                          child: Image.asset(
                            'assets/pooja_kart_logo.jpeg.png',
                            fit: BoxFit.cover, // ✅ Ensures full fill, no white edges
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 45),

                    // 🪷 Section Heading
                    const Text(
                      "Our Services",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF800000),
                        fontFamily: 'Georgia',
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 3,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 25),

                    // ✅ Service List with Checkboxes
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        ServiceCheckbox(
                          text:
                          "We deliver 100% authenticated pooja products.",
                        ),
                        ServiceCheckbox(
                          text:
                          "All pooja materials in one place for all occasions.",
                        ),
                        ServiceCheckbox(
                          text:
                          "Ordering made simple — right at your fingertips.",
                        ),
                        ServiceCheckbox(
                          text: "Bringing spirituality to your doorstep.",
                        ),
                        ServiceCheckbox(
                          text:
                          "Guaranteed low prices with top quality items.",
                        ),
                      ],
                    ),

                    const SizedBox(height: 60),

                    // ✨ ENTER BUTTON
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFC107), // Rich Gold
                        padding: const EdgeInsets.symmetric(
                          horizontal: 55,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            color: Color(0xFF800000),
                            width: 2,
                          ),
                        ),
                        elevation: 12,
                      ),
                      child: const Text(
                        "Enter",
                        style: TextStyle(
                          color: Color(0xFF800000),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for Services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkbox
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌟 Outer Golden Border
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFD700), // ✨ Pure Rich Gold Border
            width: 10,
          ),
        ),
        child: Container(
          // 🌸 Background color (Light Lemon Yellow)
          decoration: const BoxDecoration(
            color: Color(0xFFFFEB66), // 🍋 Light Lemon Yellow (soft but bright)
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 🌸 Welcome Text ABOVE the logo
                    const Text(
                      "🪔 Welcome to Pooja-Kart 🪔",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF800000), // Deep Maroon
                        fontFamily: 'Georgia',
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 8,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    // 🪔 Logo with Thicker Golden Border
                    Container(
                      height: 170,
                      width: 170,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFFFD700), // ✨ Pure Golden Border
                          width: 12, // ⬆️ Increased border width for prominence
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(3, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                            Color(0xFFFFD700), // 🌟 Golden Yellow Tint
                            BlendMode.modulate, // Blend with image colors
                          ),
                          child: Image.asset(
                            'assets/pooja_kart_logo.jpeg.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 45),

                    // 🪷 Section Heading
                    const Text(
                      "Our Services",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF800000),
                        fontFamily: 'Georgia',
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 3,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 25),

                    // ✅ Service List with Checkboxes
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        ServiceCheckbox(
                          text:
                          "We deliver 100% authenticated pooja products.",
                        ),
                        ServiceCheckbox(
                          text:
                          "All pooja materials in one place for all occasions.",
                        ),
                        ServiceCheckbox(
                          text:
                          "Ordering made simple — right at your fingertips.",
                        ),
                        ServiceCheckbox(
                          text: "Bringing spirituality to your doorstep.",
                        ),
                        ServiceCheckbox(
                          text:
                          "Guaranteed low prices with top quality items.",
                        ),
                      ],
                    ),

                    const SizedBox(height: 60),

                    // ✨ ENTER BUTTON
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFC107), // Rich Gold
                        padding: const EdgeInsets.symmetric(
                          horizontal: 55,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            color: Color(0xFF800000),
                            width: 2,
                          ),
                        ),
                        elevation: 12,
                      ),
                      child: const Text(
                        "Enter",
                        style: TextStyle(
                          color: Color(0xFF800000),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for Services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkbox
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌟 Outer Golden Border
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFD700), // ✨ Pure Rich Gold Border
            width: 10,
          ),
        ),
        child: Container(
          // 🌸 Background color (Light Lemon Yellow)
          decoration: const BoxDecoration(
            color: Color(0xFFFFEB66), // 🍋 Light Lemon Yellow (soft but bright)
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 🌸 Welcome Text ABOVE the logo
                    const Text(
                      "🪔 Welcome to Pooja-Kart 🪔",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF800000), // Deep Maroon
                        fontFamily: 'Georgia',
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 8,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    // 🪔 Logo with Thicker Golden Border
                    Container(
                      height: 170,
                      width: 170,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFFFD700), // ✨ Pure Golden Border
                          width: 12, // ⬆️ Increased border width for prominence
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(3, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                            Color(0xFFFFD700), // 🌟 Golden Yellow Tint
                            BlendMode.modulate, // Blend with image colors
                          ),
                          child: Image.asset(
                            'assets/pooja_kart_logo.jpeg.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 45),

                    // 🪷 Section Heading
                    const Text(
                      "Our Services",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF800000),
                        fontFamily: 'Georgia',
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 3,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 25),

                    // ✅ Service List with Checkboxes
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        ServiceCheckbox(
                          text:
                          "We deliver 100% authenticated pooja products.",
                        ),
                        ServiceCheckbox(
                          text:
                          "All pooja materials in one place for all occasions.",
                        ),
                        ServiceCheckbox(
                          text:
                          "Ordering made simple — right at your fingertips.",
                        ),
                        ServiceCheckbox(
                          text: "Bringing spirituality to your doorstep.",
                        ),
                        ServiceCheckbox(
                          text:
                          "Guaranteed low prices with top quality items.",
                        ),
                      ],
                    ),

                    const SizedBox(height: 60),

                    // ✨ WELCOME BUTTON (updated)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF800000), // 🟥 Maroon
                        padding: const EdgeInsets.symmetric(
                          horizontal: 55,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            color: Color(0xFFFFD700), // ✨ Gold border
                            width: 2,
                          ),
                        ),
                        elevation: 12,
                      ),
                      child: const Text(
                        "Welcome",
                        style: TextStyle(
                          color: Colors.white, // 🤍 White text
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for Services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkbox
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌟 Outer Golden Border
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFD700), // ✨ Pure Rich Gold Border
            width: 10,
          ),
        ),
        child: Container(
          // 🍋 Light Lemon Yellow Background
          decoration: const BoxDecoration(
            color: Color(0xFFFFEB66),
          ),
          child: Stack(
            children: [
              // 🕉️ OM Symbol (Top Left Corner)
              const Positioned(
                top: 5,
                left: 5,
                child: Text(
                  "ॐ",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC70039), // 🔴 Dark Red color

                    fontFamily: 'Georgia',
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),

              // 卐 Swastik Symbol (Top Right Corner)
              const Positioned(
                top: 5,
                right: 5,
                child: Text(
                  "卐",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC70039), // 🔴 Dark Red color
                    fontFamily: 'Georgia',
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),

              // 🌸 Main Content (centered)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Welcome to Pooja-Kart",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF800000), // Deep Maroon
                            fontFamily: 'Georgia',
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 8,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),

                        // 🪔 Logo with Thicker Golden Border (no diyas)
                        Container(
                          height: 170,
                          width: 170,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFFFD700),
                              width: 12,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(3, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                Color(0xFFFFD700),
                                BlendMode.modulate,
                              ),
                              child: Image.asset(
                                'assets/pooja_kart_logo.jpeg.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 45),

                        // 🪷 Section Heading
                        const Text(
                          "Our Services",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF800000),
                            fontFamily: 'Georgia',
                            shadows: [
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 3,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 25),

                        // ✅ Service List
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            ServiceCheckbox(
                              text:
                              "We deliver 100% authenticated pooja products.",
                            ),
                            ServiceCheckbox(
                              text:
                              "All pooja materials in one place for all occasions.",
                            ),
                            ServiceCheckbox(
                              text:
                              "Ordering made simple — right at your fingertips.",
                            ),
                            ServiceCheckbox(
                              text: "Bringing spirituality to your doorstep.",
                            ),
                            ServiceCheckbox(
                              text:
                              "Guaranteed low prices with top quality items.",
                            ),
                          ],
                        ),

                        const SizedBox(height: 60),

                        // ✨ Welcome Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            const Color(0xFF800000), // 🟥 Maroon
                            padding: const EdgeInsets.symmetric(
                              horizontal: 55,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(
                                color: Color(0xFFFFD700), // ✨ Gold border
                                width: 2,
                              ),
                            ),
                            elevation: 12,
                          ),
                          child: const Text(
                            "Welcome",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for Services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkbox
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌟 Outer Golden Border
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFD700), // ✨ Pure Rich Gold Border
            width: 10,
          ),
        ),
        child: Container(
          // 🍋 Light Lemon Yellow Background
          decoration: const BoxDecoration(
            color: Color(0xFFFFEB66),
          ),
          child: Stack(
            children: [
              // 🕉️ OM Symbol (Top Left Corner)
              const Positioned(
                top: 5,
                left: 5,
                child: Text(
                  "ॐ",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC70039), // 🔴 Dark Red color
                    fontFamily: 'Georgia',
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),

              // 卐 Swastik Symbol (Top Right Corner) with dots inside
              const Positioned(
                top: 5,
                right: 5,
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Swastik Symbol
                      Text(
                        "卐",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC70039), // 🔴 Dark Red color
                          fontFamily: 'Georgia',
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 6,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),

                      // 🔴 4 Inner Dots (Same color as Swastik)
                      Positioned(
                        top: 12,
                        left: 18,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xFFC70039),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 18,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xFFC70039),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        left: 18,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xFFC70039),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        right: 18,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xFFC70039),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 🌸 Main Content (centered)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Welcome to Pooja-Kart",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF800000), // Deep Maroon
                            fontFamily: 'Georgia',
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 8,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),

                        // 🪔 Logo with Thicker Golden Border (no diyas)
                        Container(
                          height: 170,
                          width: 170,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFFFD700),
                              width: 12,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(3, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                Color(0xFFFFD700),
                                BlendMode.modulate,
                              ),
                              child: Image.asset(
                                'assets/pooja_kart_logo.jpeg.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 45),

                        // 🪷 Section Heading
                        const Text(
                          "Our Services",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF800000),
                            fontFamily: 'Georgia',
                            shadows: [
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 3,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 25),

                        // ✅ Service List
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            ServiceCheckbox(
                              text:
                              "We deliver 100% authenticated pooja products.",
                            ),
                            ServiceCheckbox(
                              text:
                              "All pooja materials in one place for all occasions.",
                            ),
                            ServiceCheckbox(
                              text:
                              "Ordering made simple — right at your fingertips.",
                            ),
                            ServiceCheckbox(
                              text: "Bringing spirituality to your doorstep.",
                            ),
                            ServiceCheckbox(
                              text:
                              "Guaranteed low prices with top quality items.",
                            ),
                          ],
                        ),

                        const SizedBox(height: 60),

                        // ✨ Welcome Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            const Color(0xFF800000), // 🟥 Maroon
                            padding: const EdgeInsets.symmetric(
                              horizontal: 55,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(
                                color: Color(0xFFFFD700), // ✨ Gold border
                                width: 2,
                              ),
                            ),
                            elevation: 12,
                          ),
                          child: const Text(
                            "Welcome",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget for Services
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000), // Maroon checkbox
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // 🌐 Language Dropdown Data
  final List<String> languages = [
    "English",
    "Hindi",
    "Telugu",
    "Kannada",
    "Malayalam",
    "Tamil",
    "Bengali",
    "Marathi",
    "Gujarati",
    "Punjabi",
    "Urdu",
    "Odia"
  ];

  String? selectedLanguage = "English"; // Default language

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌟 Outer Golden Border
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFD700), // ✨ Pure Rich Gold Border
            width: 10,
          ),
        ),
        child: Container(
          // 🍋 Light Lemon Yellow Background
          decoration: const BoxDecoration(
            color: Color(0xFFFFEB66),
          ),
          child: Stack(
            children: [
              // 🕉️ OM Symbol (Top Left Corner)
              const Positioned(
                top: 5,
                left: 5,
                child: Text(
                  "ॐ",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC70039),
                    fontFamily: 'Georgia',
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),

              // 卐 Swastik Symbol (Top Right Corner)
              const Positioned(
                top: 5,
                right: 5,
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "卐",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC70039),
                          fontFamily: 'Georgia',
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 6,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 12,
                        left: 18,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xFFC70039),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 18,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xFFC70039),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        left: 18,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xFFC70039),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        right: 18,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xFFC70039),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 🌸 Main Content
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Welcome to Pooja-Kart",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF800000),
                            fontFamily: 'Georgia',
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 8,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 20),

                        // 🌐 Language Dropdown
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xFFFFD700),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(2, 3),
                              ),
                            ],
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedLanguage,
                              icon: const Icon(
                                Icons.language,
                                color: Color(0xFF800000),
                              ),
                              dropdownColor: const Color(0xFFFFF8DC),
                              items: languages.map((String language) {
                                return DropdownMenuItem<String>(
                                  value: language,
                                  child: Text(
                                    language,
                                    style: const TextStyle(
                                      color: Color(0xFF800000),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedLanguage = newValue;
                                });
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // 🪔 Logo
                        Container(
                          height: 170,
                          width: 170,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFFFD700),
                              width: 12,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(3, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                Color(0xFFFFD700),
                                BlendMode.modulate,
                              ),
                              child: Image.asset(
                                'assets/pooja_kart_logo.jpeg.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 45),

                        // 🪷 Section Heading
                        const Text(
                          "Our Services",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF800000),
                            fontFamily: 'Georgia',
                            shadows: [
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 3,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 25),

                        // ✅ Services
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            ServiceCheckbox(
                              text:
                              "We deliver 100% authenticated pooja products.",
                            ),
                            ServiceCheckbox(
                              text:
                              "All pooja materials in one place for all occasions.",
                            ),
                            ServiceCheckbox(
                              text:
                              "Ordering made simple — right at your fingertips.",
                            ),
                            ServiceCheckbox(
                              text: "Bringing spirituality to your doorstep.",
                            ),
                            ServiceCheckbox(
                              text:
                              "Guaranteed low prices with top quality items.",
                            ),
                          ],
                        ),

                        const SizedBox(height: 60),

                        // ✨ Welcome Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF800000),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 55,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(
                                color: Color(0xFFFFD700),
                                width: 2,
                              ),
                            ),
                            elevation: 12,
                          ),
                          child: const Text(
                            "Welcome",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // 🌐 Language Dropdown Data
  final List<String> languages = [
    "English",
    "Hindi",
    "Telugu",
    "Kannada",
    "Malayalam",
    "Tamil",
    "Bengali",
    "Marathi",
    "Gujarati",
    "Punjabi",
    "Urdu",
    "Odia"
  ];

  // Mapping between dropdown label and language code
  final Map<String, String> languageToCode = {
    "English": "en",
    "Hindi": "hi",
    "Telugu": "te",
    "Kannada": "kn",
    "Malayalam": "ml",
    "Tamil": "ta",
    "Bengali": "bn",
    "Marathi": "mr",
    "Gujarati": "gu",
    "Punjabi": "pa",
    "Urdu": "ur",
    "Odia": "or",
  };

  String? selectedLanguage;

  @override
  void initState() {
    super.initState();

    // set initial selectedLanguage based on current locale
    final currentCode = context.locale.languageCode;
    final found = languageToCode.entries.firstWhere(
          (e) => e.value == currentCode,
      orElse: () => const MapEntry("English", "en"),
    );
    selectedLanguage = found.key;
  }

  Future<void> _onLanguageChanged(String? newLanguage) async {
    if (newLanguage == null) return;

    final code = languageToCode[newLanguage];
    if (code == null) return;

    // Change app locale instantly
    await context.setLocale(Locale(code));

    // Persist selected locale for next app launch
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_locale', code);

    setState(() {
      selectedLanguage = newLanguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌟 Outer Golden Border
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFD700),
            width: 10,
          ),
        ),
        child: Container(
          // 🍋 Light Lemon Yellow Background
          decoration: const BoxDecoration(
            color: Color(0xFFFFEB66),
          ),
          child: Stack(
            children: [
              // 🕉️ OM Symbol (Top Left Corner)
              const Positioned(
                top: 5,
                left: 5,
                child: Text(
                  "ॐ",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC70039),
                    fontFamily: 'Georgia',
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),

              // 卐 Swastik Symbol (Top Right Corner)
              const Positioned(
                top: 5,
                right: 5,
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "卐",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC70039),
                          fontFamily: 'Georgia',
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 6,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 12,
                        left: 18,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xFFC70039),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 18,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xFFC70039),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        left: 18,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xFFC70039),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        right: 18,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xFFC70039),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 🌸 Main Content
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Localized Title
                        Text(
                          'welcome_title'.tr(),
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF800000),
                            fontFamily: 'Georgia',
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 8,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 20),

                        // 🌐 Language Dropdown
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xFFFFD700),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(2, 3),
                              ),
                            ],
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedLanguage,
                              icon: const Icon(
                                Icons.language,
                                color: Color(0xFF800000),
                              ),
                              dropdownColor: const Color(0xFFFFF8DC),
                              items: languages.map((String language) {
                                return DropdownMenuItem<String>(
                                  value: language,
                                  child: Text(
                                    language,
                                    style: const TextStyle(
                                      color: Color(0xFF800000),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: _onLanguageChanged,
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // 🪔 Logo
                        Container(
                          height: 170,
                          width: 170,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFFFD700),
                              width: 12,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(3, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                Color(0xFFFFD700),
                                BlendMode.modulate,
                              ),
                              child: Image.asset(
                                'assets/pooja_kart_logo.jpeg.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 45),

                        // 🪷 Section Heading (localized)
                        Text(
                          'our_services'.tr(),
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF800000),
                            fontFamily: 'Georgia',
                            shadows: [
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 3,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 25),

                        // ✅ Services (localized)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ServiceCheckbox(text: 'service_1'.tr()),
                            ServiceCheckbox(text: 'service_2'.tr()),
                            ServiceCheckbox(text: 'service_3'.tr()),
                            ServiceCheckbox(text: 'service_4'.tr()),
                            ServiceCheckbox(text: 'service_5'.tr()),
                          ],
                        ),

                        const SizedBox(height: 60),

                        // ✨ Welcome Button (localized)
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF800000),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 55,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(
                                color: Color(0xFFFFD700),
                                width: 2,
                              ),
                            ),
                            elevation: 12,
                          ),
                          child: Text(
                            'welcome_button'.tr(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String? _selectedLang;

  // 🌍 List of supported languages
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
    // ✅ Safe place to access context.locale
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDE7),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🌸 App title (translated)
              Text(
                tr('welcome_title'),
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6D1B1B),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // 🌍 Language selector dropdown
              DropdownButton<String>(
                value: _selectedLang,
                icon: const Icon(Icons.language, color: Color(0xFFD32F2F)),
                dropdownColor: const Color(0xFFFFF9C4),
                borderRadius: BorderRadius.circular(12),
                style: const TextStyle(
                    color: Color(0xFF6D1B1B),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
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

              const SizedBox(height: 40),

              // 🕉 Welcome button (translated)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD32F2F),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  tr('welcome_button'),
                  style: const TextStyle(fontSize: 18),
                ),
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
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String? _selectedLang;

  // 🌍 Supported language map (languageCode → Display name)
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌟 Outer Golden Border
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFD700), // ✨ Pure Rich Gold Border
            width: 10,
          ),
        ),
        child: Container(
          // 🍋 Light Lemon Yellow Background
          decoration: const BoxDecoration(
            color: Color(0xFFFFEB66),
          ),
          child: Stack(
            children: [
              // 🕉️ OM Symbol (Top Left Corner)
              const Positioned(
                top: 5,
                left: 5,
                child: Text(
                  "ॐ",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC70039),
                    fontFamily: 'Georgia',
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),

              // 卐 Swastik Symbol (Top Right Corner)
              const Positioned(
                top: 5,
                right: 5,
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "卐",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC70039),
                          fontFamily: 'Georgia',
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 6,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 26,
                        left: 25,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xFFC70039),
                        ),
                      ),
                      Positioned(
                        top: 26,
                        right: 25,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xFFC70039),
                        ),
                      ),
                      Positioned(
                        bottom: 22,
                        left: 25,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xFFC70039),
                        ),
                      ),
                      Positioned(
                        bottom: 22,
                        right: 25,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Color(0xFFC70039),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 🌸 Main Content
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 🪔 Title
                        Text(
                          tr('welcome_title'),
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF800000),
                            fontFamily: 'Georgia',
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 8,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 20),

                        // 🌐 Language Dropdown
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xFFFFD700),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(2, 3),
                              ),
                            ],
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedLang,
                              icon: const Icon(
                                Icons.language,
                                color: Color(0xFF800000),
                              ),
                              dropdownColor: const Color(0xFFFFF8DC),
                              items: _languages.entries.map((entry) {
                                return DropdownMenuItem<String>(
                                  value: entry.key,
                                  child: Text(
                                    entry.value,
                                    style: const TextStyle(
                                      color: Color(0xFF800000),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newLang) {
                                if (newLang != null) {
                                  _changeLanguage(newLang);
                                }
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // 🪔 Logo
                        Container(
                          height: 170,
                          width: 170,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFFFD700),
                              width: 12,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(3, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                Color(0xFFFFD700),
                                BlendMode.modulate,
                              ),
                              child: Image.asset(
                                'assets/pooja_kart_logo.jpeg.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 45),

                        // 🪷 Section Heading
                        Text(
                          tr('our_services'),
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF800000),
                            fontFamily: 'Georgia',
                            shadows: [
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 3,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 25),

                        // ✅ Services
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ServiceCheckbox(
                              text: tr('service_1'),
                            ),
                            ServiceCheckbox(
                              text: tr('service_2'),
                            ),
                            ServiceCheckbox(
                              text: tr('service_3'),
                            ),
                            ServiceCheckbox(
                              text: tr('service_4'),
                            ),
                            ServiceCheckbox(
                              text: tr('service_5'),
                            ),
                          ],
                        ),

                        const SizedBox(height: 60),

                        // ✨ Welcome Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF800000),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 55,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(
                                color: Color(0xFFFFD700),
                                width: 2,
                              ),
                            ),
                            elevation: 12,
                          ),
                          child: Text(
                            tr('welcome_button'),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_box,
            color: Color(0xFF800000),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
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
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String? _selectedLang;

  // 🌍 Supported language map
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

  Future<void> _saveLocale(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_locale', code);
  }

  Future<void> _changeLanguage(String code) async {
    await context.setLocale(Locale(code));
    await _saveLocale(code);
    setState(() => _selectedLang = code);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFD700),
            width: 10,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFEB66),
          ),
          child: Stack(
            children: [
              // 🕉️ OM Symbol
              const Positioned(
                top: 5,
                left: 5,
                child: Text(
                  "ॐ",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC70039),
                    fontFamily: 'Georgia',
                    shadows: [
                      Shadow(offset: Offset(2, 2), blurRadius: 6, color: Colors.black26),
                    ],
                  ),
                ),
              ),

              // 卐 Swastik Symbol
              const Positioned(
                top: 5,
                right: 5,
                child: SizedBox(
                  width: 65,
                  height: 65,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "卐",
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC70039),
                          fontFamily: 'Georgia',
                          shadows: [
                            Shadow(offset: Offset(2, 2), blurRadius: 6, color: Colors.black26),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 25,
                        left: 23,
                        child: CircleAvatar(radius: 2.5, backgroundColor: Color(0xFFC70039)),
                      ),
                      Positioned(
                        top: 25,
                        right: 23,
                        child: CircleAvatar(radius: 2.5, backgroundColor: Color(0xFFC70039)),
                      ),
                      Positioned(
                        bottom: 21,
                        left: 23,
                        child: CircleAvatar(radius: 2.5, backgroundColor: Color(0xFFC70039)),
                      ),
                      Positioned(
                        bottom: 21,
                        right: 23,
                        child: CircleAvatar(radius: 2.5, backgroundColor: Color(0xFFC70039)),
                      ),
                    ],
                  ),
                ),
              ),

              // 🌸 Main Content
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: screenHeight - 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 🌐 Smaller Dropdown
                          Container(
                            width: 130,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: const Color(0xFFFFD700), width: 1.3),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(color: Colors.black26, blurRadius: 3, offset: Offset(2, 2)),
                              ],
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _selectedLang,
                                icon: const Icon(Icons.language, size: 16, color: Color(0xFF800000)),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF800000),
                                  fontWeight: FontWeight.w500,
                                ),
                                dropdownColor: const Color(0xFFFFF8DC),
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
                          ),

                          const SizedBox(height: 16),

                          // 🪔 Title
                          Text(
                            tr('welcome_title'),
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF800000),
                              fontFamily: 'Georgia',
                              shadows: [
                                Shadow(offset: Offset(2, 2), blurRadius: 5, color: Colors.black38),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 25),

                          // 🪔 Logo
                          Container(
                            height: 150,
                            width: 150,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: const Color(0xFFFFD700), width: 10),
                              boxShadow: const [
                                BoxShadow(color: Colors.black26, blurRadius: 7, offset: Offset(3, 4)),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: ColorFiltered(
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFFFFD700),
                                  BlendMode.modulate,
                                ),
                                child: Image.asset(
                                  'assets/pooja_kart_logo.jpeg.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          // 🪷 Section Heading
                          Text(
                            tr('our_services'),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF800000),
                              fontFamily: 'Georgia',
                              shadows: [
                                Shadow(offset: Offset(1.5, 1.5), blurRadius: 2, color: Colors.black26),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 18),

                          // ✅ Services
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ServiceCheckbox(text: tr('service_1')),
                              ServiceCheckbox(text: tr('service_2')),
                              ServiceCheckbox(text: tr('service_3')),
                              ServiceCheckbox(text: tr('service_4')),
                              ServiceCheckbox(text: tr('service_5')),
                            ],
                          ),

                          const SizedBox(height: 35),

                          // ✨ Welcome Button
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF800000),
                              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(color: Color(0xFFFFD700), width: 2),
                              ),
                              elevation: 10,
                            ),
                            child: Text(
                              tr('welcome_button'),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check_box, size: 22, color: Color(0xFF800000)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 17,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


 */



import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String? _selectedLang;

  // 🌍 Supported language map
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

  Future<void> _saveLocale(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_locale', code);
  }

  Future<void> _changeLanguage(String code) async {
    await context.setLocale(Locale(code));
    await _saveLocale(code);
    setState(() => _selectedLang = code);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFD700),
            width: 10,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFEB66),
          ),
          child: Stack(
            children: [
              // 🕉️ OM Symbol
              const Positioned(
                top: 6,
                left: 15,
                child: Text(
                  "ॐ",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC70039),
                    fontFamily: 'Georgia',
                    shadows: [
                      Shadow(offset: Offset(2, 2), blurRadius: 6, color: Colors.black26),
                    ],
                  ),
                ),
              ),

              // 卐 Swastik Symbol
              const Positioned(
                top: 5,
                right: 5,
                child: SizedBox(
                  width: 65,
                  height: 65,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "卐",
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC70039),
                          fontFamily: 'Georgia',
                          shadows: [
                            Shadow(offset: Offset(2, 2), blurRadius: 6, color: Colors.black26),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 25,
                        left: 23,
                        child: CircleAvatar(radius: 2.5, backgroundColor: Color(0xFFC70039)),
                      ),
                      Positioned(
                        top: 25,
                        right: 23,
                        child: CircleAvatar(radius: 2.5, backgroundColor: Color(0xFFC70039)),
                      ),
                      Positioned(
                        bottom: 21,
                        left: 23,
                        child: CircleAvatar(radius: 2.5, backgroundColor: Color(0xFFC70039)),
                      ),
                      Positioned(
                        bottom: 21,
                        right: 23,
                        child: CircleAvatar(radius: 2.5, backgroundColor: Color(0xFFC70039)),
                      ),
                    ],
                  ),
                ),
              ),

              // 🌸 Main Content
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: screenHeight - 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 🌐 Smaller Dropdown
                          Container(
                            width: 130,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: const Color(0xFFFFD700), width: 1.3),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(color: Colors.black26, blurRadius: 3, offset: Offset(2, 2)),
                              ],
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _selectedLang,
                                icon: const Icon(Icons.language, size: 16, color: Color(0xFF800000)),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF800000),
                                  fontWeight: FontWeight.w500,
                                ),
                                dropdownColor: const Color(0xFFFFF8DC),
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
                          ),

                          const SizedBox(height: 16),

                          // 🪔 Title
                          Text(
                            tr('welcome_title'),
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF800000),
                              fontFamily: 'Georgia',
                              shadows: [
                                Shadow(offset: Offset(2, 2), blurRadius: 5, color: Colors.black38),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 25),

                          // 🪔 Logo
                          Container(
                            height: 150,
                            width: 150,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: const Color(0xFFFFD700), width: 10),
                              boxShadow: const [
                                BoxShadow(color: Colors.black26, blurRadius: 7, offset: Offset(3, 4)),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: ColorFiltered(
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFFFFD700),
                                  BlendMode.modulate,
                                ),
                                child: Image.asset(
                                  'assets/pooja_kart_logo.jpeg.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          // 🪷 Section Heading (Increased Font Size)
                          Text(
                            tr('our_services'),
                            style: const TextStyle(
                              fontSize: 28, // ⬆️ Increased from 24 → 28
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF800000),
                              fontFamily: 'Georgia',
                              shadows: [
                                Shadow(offset: Offset(1.5, 1.5), blurRadius: 2, color: Colors.black26),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 18),

                          // ✅ Services
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ServiceCheckbox(text: tr('service_1')),
                              ServiceCheckbox(text: tr('service_2')),
                              ServiceCheckbox(text: tr('service_3')),
                              ServiceCheckbox(text: tr('service_4')),
                              ServiceCheckbox(text: tr('service_5')),
                            ],
                          ),

                          const SizedBox(height: 35),

                          // ✨ Welcome Button
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF800000),
                              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(color: Color(0xFFFFD700), width: 2),
                              ),
                              elevation: 10,
                            ),
                            child: Text(
                              tr('welcome_button'),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ Custom Checkbox Widget
class ServiceCheckbox extends StatelessWidget {
  final String text;

  const ServiceCheckbox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check_box, size: 22, color: Color(0xFF800000)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF800000),
                fontSize: 17,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
