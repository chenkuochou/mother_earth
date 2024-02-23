// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/model/progress_model.dart';
import 'package:mother_earth/progress/progress_bar.dart';
import 'package:mother_earth/providers/progress_provider.dart';

// import 'firebase_options.dart';

Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   if (kDebugMode) {
//     try {
//       FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
//       await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'MyDemo',
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    ),
  );
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: GestureDetector(
            onTap: () {
              ref.read(progressProvider.notifier).activateTraining(
                  'A', ref.read(progressProvider)['A']![0].title);
              HapticFeedback.mediumImpact();
            },
            child: Column(
              children: [
                ProgressBar(0, ref.read(progressProvider)['A']![0]),
              ],
            )),
      ),
    );
  }
}
