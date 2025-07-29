import 'package:flutter/material.dart';
import '../../providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ChatUnlockScreen extends StatefulWidget {
  final VoidCallback onUnlock;
  const ChatUnlockScreen({Key? key, required this.onUnlock}) : super(key: key);

  @override
  State<ChatUnlockScreen> createState() => _ChatUnlockScreenState();
}

class _ChatUnlockScreenState extends State<ChatUnlockScreen> {
  final _controller = TextEditingController();
  String? _error;

  void _checkPasscode(String code) {
    if (code == '2116rm' || code == '2116mr') {
      widget.onUnlock();
    } else {
      setState(() => _error = 'Invalid passcode!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Chat Passcode'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Passcode',
              errorText: _error,
            ),
            onSubmitted: _checkPasscode,
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('Unlock'),
          onPressed: () => _checkPasscode(_controller.text),
        )
      ],
    );
  }
}