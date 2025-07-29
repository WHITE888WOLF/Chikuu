import 'package:flutter/material.dart';
import '../widgets/bouncy_button.dart';
import '../widgets/profile_avatar.dart';
import '../screens/about_screen.dart';
import '../screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _openAbout(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => AboutScreen()));
  }

  void _openSettings(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chikuu'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _openSettings(context),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Game Buttons
          BouncyButton(
            text: 'Tic-Tac-Toe',
            icon: Icons.close,
            onTap: () {/* TODO: Navigate to TicTacToe */},
          ),
          BouncyButton(
            text: 'Flappy Bird',
            icon: Icons.flight_takeoff,
            onTap: () {/* TODO: Navigate to Flappy Bird */},
          ),
          BouncyButton(
            text: 'Memory Match',
            icon: Icons.memory,
            onTap: () {/* TODO: Navigate to Memory Match */},
          ),
          BouncyButton(
            text: 'Feed-the-Pet',
            icon: Icons.pets,
            onTap: () {/* TODO: Navigate to Feed-the-Pet */},
          ),
          SizedBox(height: 32),
          GestureDetector(
            onDoubleTap: () => _openAbout(context),
            child: ProfileAvatar(
              imagePath: 'assets/images/chikuu_logo.png',
              size: 80,
            ),
          ),
        ],
      ),
    );
  }
}