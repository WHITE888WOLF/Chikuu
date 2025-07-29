import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  // ... implement chat logic, connect to Firebase RTDB, Firestore, Storage

  List<Message> messages = []; // Message model (with isMe, text, etc.)
  bool isOtherUserOnline = false;
  bool isOtherUserTyping = false;
  String otherUserName = 'Admin';
  String? otherUserProfilePic;

  final inputController = TextEditingController();

  void setTyping(bool typing) {
    // TODO: Update typing status in RTDB
    notifyListeners();
  }

  void sendMessage() {
    // TODO: Send message to Firebase
  }
}

class Message {
  final bool isMe;
  final String text;
  // ... additional fields
  Message({required this.isMe, required this.text});
}