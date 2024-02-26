// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mother_earth/layout/layout_page.dart';

// import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        title: 'Mother Earth',
        theme: ThemeData(
          textTheme: TextTheme(
            bodyMedium: GoogleFonts.ubuntuMono(
                // fontSize: 9,
                ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const LayoutPage(),
      ),
    ),
  );
}
