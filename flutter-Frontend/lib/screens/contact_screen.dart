import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Us',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 3,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '📧 Mail ID',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF800000)),
                ),
                SizedBox(height: 4),
                Text('support@poojakart.in'),
                SizedBox(height: 16),

                Text(
                  '🏠 Address',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF800000)),
                ),
                SizedBox(height: 4),
                Text(
                    'Pooja Kart Pvt Ltd,\n#123, Ameerpet Main Road,\nHyderabad, Telangana - 500016'),
                SizedBox(height: 16),

                Text(
                  '📞 Phone Number',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF800000)),
                ),
                SizedBox(height: 4),
                Text('+91 98765 43210'),
                SizedBox(height: 16),

                Text(
                  '💬 Concern / Support',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF800000)),
                ),
                SizedBox(height: 4),
                Text(
                    'For product inquiries, order tracking, or feedback,\nplease email us or call our helpline.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
