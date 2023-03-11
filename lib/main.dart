import 'package:flutter/material.dart';
import 'package:todoapp/application.dart';
import 'package:todoapp/providers/auth_provider.dart';
import 'package:todoapp/services/firestore_database.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(
      /*
      * MultiProvider for top services that do not depends on any runtime values
      * such as user uid/email.
       */
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider(),
          ),
        ],
        child: Application(
          databaseBuilder: (_, uid) => FirestoreDatabase(uid: uid),
          key: const Key('MyApp'),
        ),
      ),
    );
  });
}
