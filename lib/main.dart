import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/constants/routes.dart';
import 'core/constants/colors.dart';
import 'presentation/theme/chikuu_theme.dart';
import 'presentation/providers/auth_provider.dart';
import 'presentation/providers/chat_provider.dart';
import 'presentation/providers/call_provider.dart';
import 'presentation/providers/game_provider.dart';
import 'presentation/screens/home_screen.dart';
import 'core/services/security_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    // Handle Firebase initialization error gracefully
    runApp(ErrorApp(error: e.toString()));
    return;
  }
  await SecurityService.init(); // disables screenshot/screen recording in chat
  runApp(const ChikuuApp());
}

class ChikuuApp extends StatelessWidget {
  const ChikuuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => CallProvider()),
        ChangeNotifierProvider(create: (_) => GameProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chikuu',
        theme: chikuuTheme,
        initialRoute: Routes.home,
        routes: Routes.getAll(),
      ),
    );
  }
}

class ErrorApp extends StatelessWidget {
  final String error;
  const ErrorApp({required this.error});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Firebase initialization failed:\n$error'),
        ),
      ),
    );
  }
}