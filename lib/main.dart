import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qrscan/src/feature/dashboard/view/home.dart';

import '../src/core/routes.dart';
import '../src/core/theme.dart';
import '../src/services/navigation_service.dart';
import '../src/services/snackbar_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Qr Scan',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: HomeScreen(),
      navigatorKey: ref.read(navigationService).navigatorKey,
      scaffoldMessengerKey: ref.read(snackbarService).scaffoldMessengerKey,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
