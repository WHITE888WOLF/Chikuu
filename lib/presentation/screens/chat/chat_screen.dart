import 'package:flutter/material.dart';
import '../../providers/chat_provider.dart';
import 'package:provider/provider.dart';
import 'call_screen.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Profile pic, name, online status
            CircleAvatar(
              backgroundImage: NetworkImage(chatProvider.otherUserProfilePic ?? ''),
            ),
            SizedBox(width: 8),
            Text(chatProvider.otherUserName),
            SizedBox(width: 8),
            chatProvider.isOtherUserOnline
                ? Icon(Icons.circle, color: Colors.green, size: 12)
                : Icon(Icons.circle, color: Colors.red, size: 12),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CallScreen(isVideo: false)));
            },
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CallScreen(isVideo: true)));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat message list (streamed from Firebase)
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final msg = chatProvider.messages[index];
                return Align(
                  alignment: msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: msg.isMe
                            ? [Color(0xFFFF6B9D), Color(0xFFA78BFA)]
                            : [Color(0xFF4ECDC4), Color(0xFFA78BFA)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(msg.text),
                  ),
                );
              },
            ),
          ),
          // Typing indicator
          chatProvider.isOtherUserTyping
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${chatProvider.otherUserName} is typing...'),
                )
              : SizedBox.shrink(),
          // Message input
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: chatProvider.inputController,
                  decoration: InputDecoration(hintText: 'Type a message...'),
                  onChanged: (v) => chatProvider.setTyping(true),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () => chatProvider.sendMessage(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}