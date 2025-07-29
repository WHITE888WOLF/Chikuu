import 'package:flutter/material.dart';
import 'chat/chat_unlock_screen.dart';
import 'chat/chat_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  void _tryUnlockChat(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => ChatUnlockScreen(
        onUnlock: () {
          Navigator.pop(context); // close dialog
          Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen()));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Center(
        child: GestureDetector(
          onDoubleTap: () => _tryUnlockChat(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/chikuu_logo.png'),
                radius: 50,
              ),
              SizedBox(height: 16),
              Text('Chikuu', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text('A romantic/cute games & chat app.'),
            ],
          ),
        ),
      ),
    );
  }
}